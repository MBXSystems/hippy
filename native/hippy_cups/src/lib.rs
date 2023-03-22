use ipp::prelude::*;
use rustler::NifStruct;

#[derive(NifStruct, Clone)]
#[module = "Hippy.Cups.PrinterInformation"]
struct PrinterInformation {
    pub name: String,
    pub printer_uri: String,
}

impl PrinterInformation {
    pub fn new(group: &IppAttributeGroup) -> Self {
        let printer_uri = group.attributes()["printer-uri-supported"]
            .value()
            .to_string();

        let name = group.attributes()["printer-name"].value().to_string();

        PrinterInformation { name, printer_uri }
    }
}

fn to_error(message: String) -> rustler::Error {
    rustler::Error::Term(Box::new(String::from(message)))
}

#[rustler::nif]
fn do_get_printers(uri: String) -> Result<Vec<PrinterInformation>, rustler::Error> {
    let uri: Uri = match uri.parse() {
        Ok(u) => u,
        Err(e) => return Err(to_error(e.to_string())),
    };

    let client = IppClient::builder(uri).build();
    let operation = IppOperationBuilder::cups().get_printers();

    let response = match client.send(operation) {
        Ok(resp) => resp,
        Err(e) => return Err(to_error(e.to_string())),
    };

    Ok(response
        .attributes()
        .groups_of(DelimiterTag::PrinterAttributes)
        .map(|group| PrinterInformation::new(group))
        .collect())
}

rustler::init!("Elixir.Hippy.Cups", [do_get_printers]);

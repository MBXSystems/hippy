FROM elixir:1.14

RUN apt-get update && \
  apt-get install -y build-essential

RUN mix local.rebar --force \
  && mix local.hex --force

# Install Rust (needed for tds_encoding lib dependency)
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH "/root/.cargo/bin:${PATH}"

COPY priv/2018_MBX_Root.cer /usr/local/share/ca-certificates/2018_MBX_Root.crt
RUN update-ca-certificates

WORKDIR /workspaces/hippy

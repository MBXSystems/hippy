FROM elixir:1.14

RUN apt-get update && \
  apt-get install -y build-essential

RUN mix local.rebar --force \
  && mix local.hex --force

COPY priv/2018_MBX_Root.cer /usr/local/share/ca-certificates/2018_MBX_Root.crt
RUN update-ca-certificates

WORKDIR /workspaces/hippy

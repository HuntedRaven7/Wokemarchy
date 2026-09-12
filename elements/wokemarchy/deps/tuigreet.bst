kind: cargo

description: tuigreet - Console/TUI greeter for greetd

sources:
  - kind: git
    url: https://github.com/apognu/tuigreet.git
    track: main
    # Pin to latest stable release
    # ref: <commit-sha256>

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-cargo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/rust.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/openssl.bst
    junction: freedesktop-sdk.bst
  # Runtime depends
  - ../greetd.bst

config:
  cargo-options:
    - --features=default

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/tuigreet
          %{mandir}/man1/tuigreet.1
          %{datadir}/tuigreet
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/tuigreet
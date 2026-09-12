kind: cargo

description: ghostty - GPU-accelerated terminal emulator

sources:
  - kind: git
    url: https://github.com/ghostty-org/ghostty.git
    track: main
    # Pin to latest release tag
    # ref: <commit-sha256>

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-cargo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/rust.bst
    junction: freedesktop-sdk.bst
    type: build
  # Zig for building (from our custom element)
  - ../deps/zig.bst
  # Runtime dependencies
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/mesa.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
  - filename: components/fontconfig.bst
    junction: freedesktop-sdk.bst
  - filename: components/freetype.bst
    junction: freedesktop-sdk.bst
  - filename: components/harfbuzz.bst
    junction: freedesktop-sdk.bst
  - filename: components/ncurses.bst
    junction: freedesktop-sdk.bst
  - filename: components/openssl.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxml2.bst
    junction: freedesktop-sdk.bst
  - filename: components/libpng.bst
    junction: freedesktop-sdk.bst
  - filename: components/zlib.bst
    junction: freedesktop-sdk.bst

config:
  cargo-options:
    - --features=default
    - --locked

# Ghostty uses Zig for some parts, need to ensure zig is in PATH
environment:
  PATH: "/usr/lib/zig:%{env:PATH}"

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/ghostty
          %{datadir}/ghostty
          %{mandir}/man1/ghostty.1
          %{mandir}/man5/ghostty-config.5
          %{datadir}/applications/com.mitchellh.ghostty.desktop
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/ghostty
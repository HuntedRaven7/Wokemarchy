kind: cargo

description: MangoWC - Wayland compositor

sources:
  - kind: tar
    url: https://github.com/mangowm/mango/archive/refs/tags/0.16.3.tar.gz
    ref: sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-cargo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/rust.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland-protocols.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libinput.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/mesa.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/seatd.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/systemd.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/dbus.bst
    junction: freedesktop-sdk.bst
    type: build
  # Runtime dependencies
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/libinput.bst
    junction: freedesktop-sdk.bst
  - filename: components/mesa.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/seatd.bst
    junction: freedesktop-sdk.bst
  - filename: components/systemd.bst
    junction: freedesktop-sdk.bst
  - filename: components/dbus.bst
    junction: freedesktop-sdk.bst

config:
  cargo-options:
    - --features=default
    - --locked

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/mango
          %{libdir}/libmango*.so*
          %{datadir}/mango
          %{datadir}/wayland-sessions/mango.desktop
          %{libdir}/systemd/user/mango.service
      devel:
        - |
          %{includedir}/mango
          %{libdir}/pkgconfig/mango.pc
          %{libdir}/libmango*.a
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/mango
          %{libdir}/debug/usr/lib/libmango*.so*
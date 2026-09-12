kind: cargo

description: quickshell - Qt6-based shell/widget toolkit for Wayland

sources:
  - kind: tar
    url: https://github.com/quickshell-mirror/quickshell/archive/refs/tags/v0.3.1.tar.gz
    ref: sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-cargo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/rust.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/qt6/qt6-base.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/qt6/qt6-declarative.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/qt6/qt6-svg.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/qt6/qt6-wayland.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland-protocols.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland.bst
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
  # Runtime dependencies
  - filename: components/qt6/qt6-base.bst
    junction: freedesktop-sdk.bst
  - filename: components/qt6/qt6-declarative.bst
    junction: freedesktop-sdk.bst
  - filename: components/qt6/qt6-svg.bst
    junction: freedesktop-sdk.bst
  - filename: components/qt6/qt6-wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/libinput.bst
    junction: freedesktop-sdk.bst
  - filename: components/mesa.bst
    junction: freedesktop-sdk.bst
  - filename: components/fontconfig.bst
    junction: freedesktop-sdk.bst
  - filename: components/freetype.bst
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
          %{bindir}/quickshell
          %{libdir}/libquickshell*.so*
          %{datadir}/quickshell
          %{datadir}/applications/org.quickshell.*.desktop
          %{datadir}/metainfo/org.quickshell.*.metainfo.xml
      devel:
        - |
          %{includedir}/quickshell
          %{libdir}/pkgconfig/quickshell.pc
          %{libdir}/libquickshell*.a
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/quickshell
          %{libdir}/debug/usr/lib/libquickshell*.so*
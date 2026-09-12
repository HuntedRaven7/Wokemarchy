kind: meson

description: rofi - Application launcher and window switcher

sources:
  - kind: tar
    url: https://github.com/davatorium/rofi/releases/download/2.0.0/rofi-2.0.0.tar.gz
    ref: sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-meson.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland-protocols.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/glib.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/gdk-pixbuf.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/startup-notification.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/librsvg.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/flex.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/bison.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/check.bst
    junction: freedesktop-sdk.bst
    type: build
  # Runtime dependencies
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/glib.bst
    junction: freedesktop-sdk.bst
  - filename: components/gdk-pixbuf.bst
    junction: freedesktop-sdk.bst
  - filename: components/startup-notification.bst
    junction: freedesktop-sdk.bst
  - filename: components/librsvg.bst
    junction: freedesktop-sdk.bst

config:
  meson-options:
    - -Dcheck=enabled
    - -Ddocs=enabled
    - -Dman=enabled

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/rofi
          %{libdir}/rofi
          %{datadir}/rofi
          %{mandir}/man1/rofi.1
          %{mandir}/man5/rofi-theme.5
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/rofi
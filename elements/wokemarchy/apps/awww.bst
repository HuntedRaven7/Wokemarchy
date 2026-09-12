kind: meson

description: awww - Wayland wallpaper setter

sources:
  - kind: tar
    url: https://codeberg.org/LGFae/awww/archive/v0.12.1.tar.gz
    ref: sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-meson.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland-protocols.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libinput.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libpng.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/libjpeg-turbo.bst
    junction: freedesktop-sdk.bst
    type: build
  # Runtime dependencies
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/libpng.bst
    junction: freedesktop-sdk.bst
  - filename: components/libjpeg-turbo.bst
    junction: freedesktop-sdk.bst

config:
  meson-options:
    - -Ddocs=disabled
    - -Dman-pages=enabled

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/awww
          %{datadir}/awww
          %{mandir}/man1/awww.1
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/awww
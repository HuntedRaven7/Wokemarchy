kind: cmake

description: fcitx5 input method framework

sources:
  - kind: git
    url: https://github.com/fcitx/fcitx5.git
    track: 5.1.x
    # Pin to specific version if needed
    # ref: <commit-sha256>

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-cmake.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/extra-cmake-modules.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/icu.bst
    junction: freedesktop-sdk.bst
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/gdk-pixbuf.bst
    junction: freedesktop-sdk.bst
  - filename: components/json-c.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxml2.bst
    junction: freedesktop-sdk.bst
  - filename: components/iso-codes.bst
    junction: freedesktop-sdk.bst
  - filename: components/enchant.bst
    junction: freedesktop-sdk.bst
  - filename: components/presage.bst
    junction: freedesktop-sdk.bst

# fcitx5 uses CMake with several components
variables:
  # Build all fcitx5 components
  FCITX5_COMPONENTS: "fcitx5;fcitx5-chinese-addons;fcitx5-gtk;fcitx5-qt;fcitx5-lua;fcitx5-unikey"

config:
  cmake-options:
    - -DENABLE_GTK=ON
    - -DENABLE_QT=ON
    - -DENABLE_LUA=ON
    - -DENABLE_UNIKEY=ON
    - -DENABLE_ANTHY=OFF
    - -DENABLE_CHEWING=OFF
    - -DENABLE_HANGUL=OFF
    - -DENABLE_MOZC=OFF
    - -DENABLE_SAYURA=OFF
    - -DENABLE_TABLE=ON
    - -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/fcitx5*
          %{libdir}/fcitx5
          %{datadir}/fcitx5
          %{libdir}/libFcitx*.so*
          %{libdir}/libfcitx*.so*
      devel:
        - |
          %{includedir}/fcitx*
          %{libdir}/pkgconfig/fcitx*.pc
          %{libdir}/libFcitx*.a
          %{libdir}/libfcitx*.a
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/fcitx5*
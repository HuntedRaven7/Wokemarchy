kind: meson

description: greetd - Wayland greeter daemon

sources:
  - kind: git
    url: https://git.sr.ht/~kennylevinsen/greetd
    track: main
    # Pin to latest stable release tag
    # ref: <commit-sha256>

depends:
  # Build dependencies
  - filename: public-stacks/buildsystem-meson.bst
    junction: freedesktop-sdk.bst
    type: build
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/pam.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst
  - filename: components/systemd.bst
    junction: freedesktop-sdk.bst

config:
  meson-options:
    - -Ddefault_session=mango
    - -Dman_pages=enabled
    - -Dgreetd_session_dir=/usr/share/wayland-sessions

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/greetd
          %{bindir}/agreety
          %{libdir}/greetd
          %{datadir}/greetd
          %{sysconfdir}/greetd
          %{libdir}/systemd/system/greetd.service
          %{libdir}/systemd/user/greetd.service
          %{mandir}/man5/greetd.toml.5
          %{mandir}/man8/greetd.8
      devel:
        - |
          %{includedir}/greetd
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/greetd
          %{libdir}/debug/usr/bin/agreety
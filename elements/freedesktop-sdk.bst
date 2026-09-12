kind: junction

description: |
  Freedesktop SDK junction. Provides base SDK components including
  buildsystems (meson, cmake, cargo, autotools), core libraries (glib, wayland,
  mesa, pipewire, bluez, systemd), and runtime stacks.

sources:
  - kind: git
    url: https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
    track: master
    # Pin to a specific commit for reproducibility
    # ref: <commit-sha256>

config:
  # Override options for our target architecture
  options:
    bootstrap_build_arch: "x86_64"
    target_arch: "x86_64"
    # Disable features we don't need
    build_flatpak: false
    build_snap: false
    build_vm: false

  # Optional: Patch queue for local overrides
  # patches:
  #   path: patches/freedesktop-sdk

  # Base directory inside the repo
  base-dir: .
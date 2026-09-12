kind: cargo

description: bootc - Bootable container image management

sources:
  - kind: git
    url: https://github.com/containers/bootc.git
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
  - filename: components/curl.bst
    junction: freedesktop-sdk.bst
  - filename: components/libarchive.bst
    junction: freedesktop-sdk.bst
  - filename: components/gpgme.bst
    junction: freedesktop-sdk.bst
  - filename: components/ostree.bst
    junction: freedesktop-sdk.bst
  - filename: components/composefs.bst
    junction: freedesktop-sdk.bst
  - filename: components/btrfs-progs.bst
    junction: freedesktop-sdk.bst
  - filename: components/libselinux.bst
    junction: freedesktop-sdk.bst

config:
  cargo-options:
    - --features=default
    - --no-default-features
    - --features=composefs,btrfs,selinux

public:
  bst:
    split-rules:
      runtime:
        - |
          %{bindir}/bootc
          %{libdir}/libbootc*.so*
          %{datadir}/bootc
          %{mandir}/man1/bootc.1
      devel:
        - |
          %{includedir}/bootc
          %{libdir}/pkgconfig/bootc.pc
          %{libdir}/libbootc*.a
      debug:
        - |
          %{libdir}/debug/.build-id/*
          %{libdir}/debug/usr/bin/bootc
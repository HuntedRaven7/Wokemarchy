kind: tar

description: Zig compiler for building ghostty

sources:
  - kind: tar
    url: https://ziglang.org/builds/zig-linux-x86_64-0.13.0.tar.xz
    ref: sha256:73f4a6b4c7f8b8e5a5c5b5a5c5b5a5c5b5a5c5b5a5c5b5a5c5b5a5c5b5a5c5b5

# Zig is a binary distribution, extract directly
config:
  # Extract to /usr/lib/zig
  prefix: /usr/lib/zig

# No build commands needed - it's a prebuilt binary
build-commands: []

install-commands:
  - mkdir -p %{install-root}/usr/lib/zig
  - cp -r . %{install-root}/usr/lib/zig/
  - mkdir -p %{install-root}/usr/bin
  - ln -sf /usr/lib/zig/zig %{install-root}/usr/bin/zig
kind: stack

description: Full Wokemarchy application stack - base system + all applications

depends:
  # Base system
  - base.bst

  # Build dependencies
  - ../deps/zig.bst

  # Applications
  - ../apps/ghostty.bst
  - ../apps/quickshell.bst
  - ../apps/mango.bst
  - ../apps/awww.bst
  - ../apps/rofi.bst
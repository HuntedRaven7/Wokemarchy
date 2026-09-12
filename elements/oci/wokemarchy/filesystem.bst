kind: compose

description: Runtime filesystem composition - filters stack to runtime-only files

build-depends:
  - ../wokemarchy/stack.bst

config:
  # Only include runtime files (exclude devel, debug, static-blocklist, extra)
  include:
    - runtime
  include-orphans: false
  # Run integration commands before composition
  integrate: true

# Exclude specific split domains that bloat the image
exclude:
  - devel
  - debug
  - static-blocklist
  - extra
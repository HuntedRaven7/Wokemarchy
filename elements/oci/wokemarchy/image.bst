kind: script

description: Final bootc-compatible OCI image assembly

build-depends:
  # Required build tools from freedesktop-sdk
  - filename: components/oci-builder.bst
    junction: freedesktop-sdk.bst
  - filename: components/glib.bst
    junction: freedesktop-sdk.bst
  - filename: vm/prepare-image.bst
    junction: freedesktop-sdk.bst
  - filename: components/fakecap.bst
    junction: freedesktop-sdk.bst
  # Our composed runtime filesystem
  - filename: oci/wokemarchy/filesystem.bst
    config:
      location: /layer

environment:
  # fakecap emulates filesystem capabilities in the sandbox
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  # Unique seed for ostree sysroot (generate once, keep stable)
  sysroot-seed: "wokemarchy-$(date +%Y%m%d)"
  # Image repository name (for bootc upgrade origin)
  image-repo: "wokemarchy"
  # Architecture
  go-arch: "amd64"

config:
  commands:
    # Create fakecap database
    - mkdir -p /fakecap

    # Prepare the ostree/bootc-compatible sysroot
    # --noroot: don't require root in the sandbox
    # --noboot: don't include kernel/initramfs (we add them separately)
    - |
      prepare-image.sh \
        --sysroot /layer \
        --initscripts /initial_scripts \
        --seed "%{sysroot-seed}" \
        --noroot --noboot >/dev/null

    # Create systemd user/group entries
    - systemd-sysusers --root /layer

    # Compile GSettings schemas
    - glib-compile-schemas /layer/usr/share/glib-2.0/schemas

    # Merge /usr/etc into /etc (bootc requirement: no /usr/etc in images)
    - |
      if [ -d /layer/usr/etc ]; then
        mkdir -p /layer/etc
        cp -a /layer/usr/etc/. /layer/etc/
        rm -rf /layer/usr/etc
      fi

    # Update dconf database
    - dconf update /layer/etc/dconf/db

    # Rebuild linker cache to avoid dlopen failures after bootc switch
    - ldconfig -r /layer -f /layer/etc/ld.so.conf

    # Generate the OCI image
    - |
      cd "%{install-root}"
      build-oci <<EOF
      mode: oci
      gzip: disabled
      images:
      - os: linux
        architecture: "%{go-arch}"
        layer: /layer
        comment: "Import Wokemarchy layer"
        config:
          Labels:
            'com.github.containers.toolbox': 'true'
            'org.opencontainers.image.title': 'Wokemarchy'
            'org.opencontainers.image.description': 'A MangoWC image inspired by Omarchy but better because it is gay!'
            'org.opencontainers.image.vendor': 'Wokemarchy'
            'org.opencontainers.image.licenses': 'Apache-2.0'
            'org.opencontainers.image.url': 'https://github.com/robin/Wokemarchy'
            'org.opencontainers.image.source': 'https://github.com/robin/Wokemarchy'
            'containers.bootc': '1'
        index-annotations:
          'org.opencontainers.image.ref.name': 'ghcr.io/robin/%{image-repo}:latest'
      EOF
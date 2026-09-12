kind: stack

description: Base system stack - FSDK runtime + bootc + greetd + fcitx5 + core Wayland

depends:
  # FSDK base runtime (glibc, bash, coreutils, etc.)
  - filename: public-stacks/runtime-gnu.bst
    junction: freedesktop-sdk.bst

  # Graphics stack
  - filename: components/wayland.bst
    junction: freedesktop-sdk.bst
  - filename: components/wayland-protocols.bst
    junction: freedesktop-sdk.bst
  - filename: components/libinput.bst
    junction: freedesktop-sdk.bst
  - filename: components/mesa.bst
    junction: freedesktop-sdk.bst
  - filename: components/vulkan-loader.bst
    junction: freedesktop-sdk.bst
  - filename: components/libdrm.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxkbcommon.bst
    junction: freedesktop-sdk.bst

  # Audio stack
  - filename: components/pipewire.bst
    junction: freedesktop-sdk.bst
  - filename: components/wireplumber.bst
    junction: freedesktop-sdk.bst
  - filename: components/libpipewire.bst
    junction: freedesktop-sdk.bst

  # Bluetooth stack
  - filename: components/bluez.bst
    junction: freedesktop-sdk.bst
  - filename: components/bluez-alsa.bst
    junction: freedesktop-sdk.bst

  # Core system
  - filename: components/systemd.bst
    junction: freedesktop-sdk.bst
  - filename: components/dbus.bst
    junction: freedesktop-sdk.bst
  - filename: components/seatd.bst
    junction: freedesktop-sdk.bst
  - filename: components/polkit.bst
    junction: freedesktop-sdk.bst
  - filename: components/elogind.bst
    junction: freedesktop-sdk.bst
  - filename: components/libcap.bst
    junction: freedesktop-sdk.bst
  - filename: components/libseccomp.bst
    junction: freedesktop-sdk.bst

  # Networking
  - filename: components/networkmanager.bst
    junction: freedesktop-sdk.bst
  - filename: components/modemmanager.bst
    junction: freedesktop-sdk.bst
  - filename: components/iwd.bst
    junction: freedesktop-sdk.bst
  - filename: components/libnftables.bst
    junction: freedesktop-sdk.bst
  - filename: components/nftables.bst
    junction: freedesktop-sdk.bst

  # Fonts and text rendering
  - filename: components/fontconfig.bst
    junction: freedesktop-sdk.bst
  - filename: components/freetype.bst
    junction: freedesktop-sdk.bst
  - filename: components/harfbuzz.bst
    junction: freedesktop-sdk.bst
  - filename: components/pango.bst
    junction: freedesktop-sdk.bst
  - filename: components/cairo.bst
    junction: freedesktop-sdk.bst
  - filename: components/gdk-pixbuf.bst
    junction: freedesktop-sdk.bst
  - filename: components/librsvg.bst
    junction: freedesktop-sdk.bst
  - filename: components/noto-fonts.bst
    junction: freedesktop-sdk.bst
  - filename: components/dejavu-fonts.bst
    junction: freedesktop-sdk.bst
  - filename: components/liberation-fonts.bst
    junction: freedesktop-sdk.bst

  # Input method
  - ../deps/fcitx5.bst

  # Bootc for image management
  - ../deps/bootc.bst

  # Login greeter
  - ../deps/greetd.bst
  - ../deps/tuigreet.bst

  # Utilities
  - filename: components/util-linux.bst
    junction: freedesktop-sdk.bst
  - filename: components/e2fsprogs.bst
    junction: freedesktop-sdk.bst
  - filename: components/btrfs-progs.bst
    junction: freedesktop-sdk.bst
  - filename: components/dosfstools.bst
    junction: freedesktop-sdk.bst
  - filename: components/cryptsetup.bst
    junction: freedesktop-sdk.bst
  - filename: components/lvm2.bst
    junction: freedesktop-sdk.bst
  - filename: components/mdadm.bst
    junction: freedesktop-sdk.bst
  - filename: components/kernel.bst
    junction: freedesktop-sdk.bst
  - filename: components/dracut.bst
    junction: freedesktop-sdk.bst
  - filename: components/grub.bst
    junction: freedesktop-sdk.bst
  - filename: components/efibootmgr.bst
    junction: freedesktop-sdk.bst
  - filename: components/shim.bst
    junction: freedesktop-sdk.bst

  # X11 compatibility (for rofi X11 mode)
  - filename: components/libx11.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxcb.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxfixes.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxinerama.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxrandr.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxi.bst
    junction: freedesktop-sdk.bst
  - filename: components/libxtst.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util-wm.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util-image.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util-keysyms.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util-renderutil.bst
    junction: freedesktop-sdk.bst
  - filename: components/xcb-util-cursor.bst
    junction: freedesktop-sdk.bst

  # Shell utilities
  - filename: components/zsh.bst
    junction: freedesktop-sdk.bst
  - filename: components/fish.bst
    junction: freedesktop-sdk.bst
  - filename: components/tmux.bst
    junction: freedesktop-sdk.bst

  # Desktop portal
  - filename: components/xdg-desktop-portal.bst
    junction: freedesktop-sdk.bst
  - filename: components/xdg-desktop-portal-wlr.bst
    junction: freedesktop-sdk.bst
  - filename: components/xdg-desktop-portal-gtk.bst
    junction: freedesktop-sdk.bst
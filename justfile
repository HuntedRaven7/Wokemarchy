# justfile - Build automation for Wokemarchy
# https://github.com/casey/just

# Default recipe
default: build

# Build the OCI image
build:
	bst build oci/wokemarchy/image.bst

# Build just the filesystem (faster iteration)
build-fs:
	bst build oci/wokemarchy/filesystem.bst

# Build the base stack
build-base:
	bst build wokemarchy/base.bst

# Build the full application stack
build-stack:
	bst build wokemarchy/stack.bst

# Export OCI image as tar for podman load
load-image:
	bst artifact checkout --tar - oci/wokemarchy/image.bst | podman load

# Export filesystem as tar
export-fs:
	bst artifact checkout --tar - oci/wokemarchy/filesystem.bst > wokemarchy-fs.tar

# Track freedesktop-sdk junction to latest
track-fsdk:
	bst track freedesktop-sdk.bst

# Show element dependencies
show-deps:
	bst show --deps all wokemarchy/stack.bst

# Run interactive shell in the build environment
shell:
	bst shell oci/wokemarchy/filesystem.bst

# Run interactive shell in base stack
shell-base:
	bst shell wokemarchy/base.bst

# Clean build artifacts
clean:
	bst cleanup --all

# Clean project refs
clean-refs:
	rm -rf project.refs

# Show project elements
list:
	bst workspace list-elements

# Build with verbose output
build-verbose:
	bst --verbose build oci/wokemarchy/image.bst

# Build with local CAS
build-local:
	bst --cache-dir ./cache build oci/wokemarchy/image.bst

# Show element info
info:
	bst show oci/wokemarchy/image.bst

# Update all junctions
update:
	bst track freedesktop-sdk.bst

# Boot in QEMU (requires raw disk image from bootc)
boot-vm:
	@echo "Generating bootable disk image..."
	@podman load < wokemarchy-oci.tar 2>/dev/null || (echo "Run 'just load-image' first" && exit 1)
	@bootc install to-filesystem \
		--root /tmp/wokemarchy-root \
		--target-root-device /dev/loop0 \
		--wipe \
		ghcr.io/robin/wokemarchy:latest
	@qemu-system-x86_64 \
		-enable-kvm \
		-m 4G \
		-cpu host \
		-drive file=/tmp/wokemarchy-root/disk.img,format=raw,if=virtio \
		-netdev user,id=net0,hostfwd=tcp::2222-:22 \
		-device virtio-net-pci,netdev=net0 \
		-display gtk,gl=on \
		-device virtio-gpu-pci

# Generate raw disk image for testing
generate-disk:
	@echo "Loading image into podman..."
	@bst artifact checkout --tar - oci/wokemarchy/image.bst | podman load
	@echo "Generating disk image with bootc..."
	@bootc install to-filesystem \
		--root /tmp/wokemarchy-root \
		--target-root-device /dev/loop0 \
		--wipe \
		ghcr.io/robin/wokemarchy:latest
	@echo "Disk image at /tmp/wokemarchy-root/disk.img"

# Verify bootc compatibility
verify-bootc:
	@bst artifact checkout --tar - oci/wokemarchy/image.bst | podman load
	@podman run --rm ghcr.io/robin/wokemarchy:latest bootc status

# Show image size
image-size:
	@bst artifact checkout --tar - oci/wokemarchy/image.bst | podman load
	@podman images ghcr.io/robin/wokemarchy:latest

# Push to registry (requires auth)
push:
	@bst artifact checkout --tar - oci/wokemarchy/image.bst | podman load
	@podman push ghcr.io/robin/wokemarchy:latest

# Lint BST files
lint:
	bst lint

# Check for updates
check-updates:
	@echo "Checking freedesktop-sdk..."
	@curl -s https://gitlab.com/api/v4/projects/freedesktop-sdk%2Ffreedesktop-sdk/repository/tags | jq -r '.[0].name'
.PHONY: all all-before all-after action-custom
all: all-before build all-after

clean: action-custom
	rm -fr build

build: build/pkg.deb

build/pkg.deb:
	mkdir -p build/pkg/usr/share/plymouth/themes
	cp -r theme build/pkg/usr/share/plymouth/themes/debian-red
	cp -r control build/pkg/DEBIAN
	cp previews/main.png build/pkg/usr/share/plymouth/themes/debian-red/preview.png
	chmod +x build/pkg/DEBIAN/postinst
	chmod +x build/pkg/DEBIAN/prerm
	dpkg-deb -v --build build/pkg

# Maintainer: Cyole <i@cyole.me>

pkgname=pebble-bin
pkgver=
pkgrel=1
pkgdesc="Local-first desktop email client built with Tauri"
arch=("x86_64")
url="https://github.com/QingJ01/Pebble"
license=("AGPL-3.0-only")
depends=(
  "dbus"
  "fuse2"
  "hicolor-icon-theme"
  "libayatana-appindicator"
)
optdepends=(
  "gnome-keyring: credential storage backend on GNOME-like desktops"
  "kwallet: credential storage backend on KDE Plasma"
)
provides=("pebble")
conflicts=("pebble")
options=("!strip")

_appimage="Pebble_${pkgver}_amd64.AppImage"

source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "pebble-bin.sh"
  "pebble.desktop"
  "pebble.png::${url}/raw/v${pkgver}/src-tauri/icons/icon.png"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
sha256sums[0]=
sha256sums[1]=
sha256sums[2]=
sha256sums[3]=
sha256sums[4]=

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/Pebble.AppImage"
  install -Dm755 "${srcdir}/pebble-bin.sh" "${pkgdir}/usr/bin/pebble"
  install -Dm644 "${srcdir}/pebble.desktop" "${pkgdir}/usr/share/applications/pebble.desktop"
  install -Dm644 "${srcdir}/pebble.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pebble.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

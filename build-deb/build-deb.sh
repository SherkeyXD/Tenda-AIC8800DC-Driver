#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PKG_DIR="$(cd "$(dirname "$0")" && pwd)/pkg-root"
OUT_DEB="$(cd "$(dirname "$0")" && pwd)/ax300-wifi-adapter-linux-driver_1.0.13+kernel6.19-1_all.deb"

rm -rf "${PKG_DIR}"
mkdir -p "${PKG_DIR}/DEBIAN"
mkdir -p "${PKG_DIR}/usr/src/AIC8800"

cp -r "${ROOT_DIR}/drivers" "${PKG_DIR}/usr/src/AIC8800/"
cp -r "${ROOT_DIR}/fw" "${PKG_DIR}/usr/src/AIC8800/"
cp "${ROOT_DIR}/aic.rules" "${PKG_DIR}/usr/src/AIC8800/aic.rules"

cp "${ROOT_DIR}/debian-repack/DEBIAN/control" "${PKG_DIR}/DEBIAN/control"
cp "${ROOT_DIR}/debian-repack/DEBIAN/preinst" "${PKG_DIR}/DEBIAN/preinst"
cp "${ROOT_DIR}/debian-repack/DEBIAN/postinst" "${PKG_DIR}/DEBIAN/postinst"
cp "${ROOT_DIR}/debian-repack/DEBIAN/prerm" "${PKG_DIR}/DEBIAN/prerm"
cp "${ROOT_DIR}/debian-repack/DEBIAN/postrm" "${PKG_DIR}/DEBIAN/postrm"

chmod 755 "${PKG_DIR}/DEBIAN"
chmod 644 "${PKG_DIR}/DEBIAN/control"
chmod 755 "${PKG_DIR}/DEBIAN/preinst" "${PKG_DIR}/DEBIAN/postinst" "${PKG_DIR}/DEBIAN/prerm" "${PKG_DIR}/DEBIAN/postrm"

dpkg-deb --root-owner-group --build "${PKG_DIR}" "${OUT_DEB}"
echo "Built: ${OUT_DEB}"

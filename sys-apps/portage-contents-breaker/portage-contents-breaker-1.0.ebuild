# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir -p ${S}
	default
}

src_prepare() {
	default
}

src_install() {
	insinto /usr/bin
	dobin "${FILESDIR}/${PN} -> one"
	dosym "${PN} -> one" "/usr/bin/${PN} -> two"
	return
}

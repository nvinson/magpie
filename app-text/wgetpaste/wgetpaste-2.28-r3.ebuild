# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Command-line interface to various pastebins"
HOMEPAGE="http://wgetpaste.zlin.dk/"

inherit git-r3

EGIT_COMMIT=c0f3648a18ae368fbc53c71c65e5a5ef737047cf
EGIT_REPO_URI="https://github.com/nvinson/${PN}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="+ssl"

DEPEND=""
RDEPEND="net-misc/wget[ssl?]"

src_prepare() {
	sed -i -e "s:/etc:\"${EPREFIX}\"/etc:g" wgetpaste || die
	default
}

src_install() {
	dobin ${PN}
	insinto /usr/share/zsh/site-functions
	doins _wgetpaste
}

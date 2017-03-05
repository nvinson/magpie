# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils multilib-minimal

DESCRIPTION="Emulator for multiple Sega game systems"
HOMEPAGE="http://www.carpeludum.com/kega-fusion"
SRC_URI="
	http://www.carpeludum.com/download/Fusion363x.tar.gz -> ${P}.tar.gz
	http://segaretro.org/images/2/21/Fusion363x.tar.gz -> ${P}.tar.gz
"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mp3"
RESTRICT="strip"

QA_PRESTRIPPED="opt/bin/${PN}"

QA_TEXTRELS="
	usr/share/${PN}/plugins/2xPM.rpi
	usr/share/${PN}/plugins/2xPM_LQ.rpi
	usr/share/${PN}/plugins/2xSaI.rpi
	usr/share/${PN}/plugins/DoubleRaw.rpi
	usr/share/${PN}/plugins/Double.rpi
	usr/share/${PN}/plugins/hq3x.rpi
	usr/share/${PN}/plugins/hq2x.rpi
	usr/share/${PN}/plugins/hq4x.rpi
	usr/share/${PN}/plugins/MDNTSC.rpi
	usr/share/${PN}/plugins/QuadRaw.rpi
	usr/share/${PN}/plugins/Scale3x.rpi
	usr/share/${PN}/plugins/Quad.rpi
	usr/share/${PN}/plugins/Scale2x.rpi
	usr/share/${PN}/plugins/Scale4x.rpi
"

QA_EXECSTACK="${QA_TEXTRELS}"

S="${WORKDIR}/Fusion"

DOCS=( History.txt Readme.txt )

DEPEND="
	app-arch/tar
"

RDEPEND="
	virtual/opengl[abi_x86_32(-)]
	x11-libs/gtk+:2[abi_x86_32(-)]
	x11-libs/libXinerama[abi_x86_32(-)]
	media-libs/alsa-lib[abi_x86_32(-)]
	media-sound/mpg123[abi_x86_32(-)]
"

pkg_setup() {
		# x86 binary package, ABI=x86
		has_multilib_profile && ABI="x86"
}

src_install() {
		exeinto "/opt/bin"
		newexe Fusion ${PN} || die "newexe failed"

		make_desktop_entry ${PN} "Kega Fusion"
		doicon "${FILESDIR}/kega-fusion.png" || die

		dodir "/usr/share/${PN}/plugins"
		tar xvf "${FILESDIR}/plugins.tar.xz" -C \
			"${ED%/}/usr/share/${PN}/plugins" > /dev/null || die
}

pkg_postinst() {
		if use mp3 ; then
			elog "For ISO+MP3 support to work, you will"
			elog "need to set the right libmpg123path"
			elog "in ~/.Kega Fusion/Fusion.ini."
			elog ""
		fi

		elog "Additional graphics filters are available."
		elog "To use them, copy the filters from "
		elog "${ED%/}/usr/share/${PN}/plugins to "
		elog "~/.Kega Fusion/Plugins."
}

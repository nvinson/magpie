# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for Java Development Kit (JDK)"
SLOT="${PV}"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64"

RDEPEND="|| (
		dev-java/openjdk:${SLOT}[gentoo-vm(+)]
		dev-java/openjdk-bin:${SLOT}[gentoo-vm(+)]
)"

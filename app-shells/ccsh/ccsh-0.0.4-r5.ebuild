# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="UNIX Shell for people already familiar with the C language"
HOMEPAGE="https://ccsh.sourceforge.net/"
SRC_URI="mirror://sourceforge/ccsh/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"

src_compile() {
	emake CFLAGS="${CFLAGS}" CC="$(tc-getCC)"
}

src_install() {
	exeinto /bin
	doexe "${PN}"
	newman "${PN}.man" "${PN}.1"
	dodoc ChangeLog README TODO
}

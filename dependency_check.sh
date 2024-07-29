#!/bin/bash

rm -f ___TEMP

################################################################################
# CODE
################################################################################

function CODE_FOUND () {
    local version=$(code --version | grep -E ".*\..*\.*")
    echo -e "\033[1;32mcode\033[0m ${version}" >> ___TEMP
}

function CODE_NOT_FOUND () {
    echo -e "\033[1;31mcode\033[0m https://code.visualstudio.com/download" >> ___TEMP
}

code --version && CODE_FOUND || CODE_NOT_FOUND

################################################################################
# GCC
################################################################################

function GCC_FOUND () {
    local version=$(gcc --version | grep -E "gcc.exe"| sed "s/.*) //g")
    echo -e "\033[1;32mgcc\033[0m ${version}" >> ___TEMP
}

function GCC_NOT_FOUND () {
    echo -e "\033[1;31mgcc\033[0m https://winlibs.com/" >> ___TEMP
}

gcc --version && GCC_FOUND || GCC_NOT_FOUND

################################################################################
# GH
################################################################################

function GH_FOUND () {
    local version=$(gh --version | grep -E "gh version " | sed "s/gh version //g" | sed "s/ .*//g")
    echo -e "\033[1;32mgh\033[0m ${version}" >> ___TEMP
}

function GH_NOT_FOUND () {
    echo -e "\033[1;31mgh\033[0m https://cli.github.com/" >> ___TEMP
}

gh --version && GH_FOUND || GH_NOT_FOUND

################################################################################
# GIT
################################################################################

function GIT_FOUND () {
    local version=$(git --version | sed "s/git version \|.windows.*//g")
    echo -e "\033[1;32mgit\033[0m ${version}" >> ___TEMP
}

function GIT_NOT_FOUND () {
    echo -e "\033[1;31mgit\033[0m https://git-scm.com/downloads" >> ___TEMP
}

git --version && GIT_FOUND || GIT_NOT_FOUND

################################################################################
# GTKWAVE
################################################################################

function GTKWAVE_FOUND () {
    local version=$(git --version | sed "s/git version \|.windows.*//g")
    echo -e "\033[1;32mgtkwave\033[0m ${version}" >> ___TEMP
}

function GTKWAVE_NOT_FOUND () {
    echo -e "\033[1;31mgtkwave\033[0m https://sourceforge.net/projects/gtkwave/" >> ___TEMP
}

gtkwave --version && GTKWAVE_FOUND || GTKWAVE_NOT_FOUND

################################################################################
# MAKE
################################################################################

function MAKE_FOUND () {
    local version=$(make --version | grep -E "GNU Make" | sed "s/GNU Make //g")
    echo -e "\033[1;32mmake\033[0m ${version}" >> ___TEMP
}

function MAKE_NOT_FOUND () {
    echo -e "\033[1;31mmake\033[0m https://gnuwin32.sourceforge.net/downlinks/make-bin-zip.php" >> ___TEMP
}

make --version && MAKE_FOUND || MAKE_NOT_FOUND

################################################################################
# PYTHON
################################################################################

function PYTHON_FOUND () {
    local version=$(python --version | sed "s/Python //g")
    echo -e "\033[1;32mpython\033[0m ${version}" >> ___TEMP
}

function PYTHON_NOT_FOUND () {
    echo -e "\033[1;31mpython\033[0m https://www.python.org/downloads/" >> ___TEMP
}

python --version && PYTHON_FOUND || PYTHON_NOT_FOUND

################################################################################
# QUESTA
################################################################################

function QUESTA_FOUND () {
    local version=$(vsim -version | sed "s/.*vsim \| Simulator.*//g")
    echo -e "\033[1;32mquesta\033[0m ${version}" >> ___TEMP
}

function QUESTA_NOT_FOUND () {
    echo -e "\033[1;31mquesta\033[0m https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/questa-edition.html" >> ___TEMP
}

vsim -version && QUESTA_FOUND || QUESTA_NOT_FOUND

################################################################################
# RISCV_GCC
################################################################################

function RISCV_GCC_FOUND () {
    local version=$(riscv64-unknown-elf-gcc --version | grep -E "GCC" | sed "s/.* (GCC) //g")
    echo -e "\033[1;32mriscv64-unknown-elf-gcc\033[0m ${version}" >> ___TEMP
}

function RISCV_GCC_NOT_FOUND () {
    echo -e "\033[1;31mriscv64-unknown-elf-gcc\033[0m https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases" >> ___TEMP
}

riscv64-unknown-elf-gcc --version && RISCV_GCC_FOUND || RISCV_GCC_NOT_FOUND

################################################################################
# VERIBLE
################################################################################

function VERIBLE_FOUND () {
    local version=$(verible-verilog-lint --version | grep -E "v" | sed "s/v//g")
    echo -e "\033[1;32mverible\033[0m ${version}" >> ___TEMP
}

function VERIBLE_NOT_FOUND () {
    echo -e "\033[1;31mverible\033[0m https://github.com/chipsalliance/verible/releases" >> ___TEMP
}

verible-verilog-lint --version && VERIBLE_FOUND || VERIBLE_NOT_FOUND

################################################################################
# VIVADO
################################################################################

function VIVADO_FOUND () {
    local version=$(xsim --version | grep -E "Vivado " | sed "s/Vivado Simulator v//g")
    echo -e "\033[1;32mvivado\033[0m ${version}" >> ___TEMP
}

function VIVADO_NOT_FOUND () {
    echo -e "\033[1;31mvivado\033[0m https://www.xilinx.com/support/download.html" >> ___TEMP
}

xsim --version && VIVADO_FOUND || VIVADO_NOT_FOUND

################################################################################
# PRINT
################################################################################

clear
cat ___TEMP
rm -f ___TEMP


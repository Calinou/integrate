#!/bin/bash
# integrate: Integrate self-installed software into a FreeDesktop system
#
# Copyright © 2018 Hugo Locurcio and contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -euo pipefail
IFS=$'\n\t'

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.6.1
# ARG_POSITIONAL_SINGLE([program])
# ARG_HELP([Integrate self-installed software into a FreeDesktop system])
# ARG_VERSION([echo v0.1.0])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO

# [ <-- needed because of Argbash

COLOR_BLACK="\e[1;30m" # ]
COLOR_RED="\e[1;31m" # ]
COLOR_GREEN="\e[1;32m" # ]
COLOR_YELLOW="\e[1;33m" # ]
COLOR_BLUE="\e[1;34m" # ]
COLOR_MAGENTA="\e[1;35m" # ]
COLOR_CYAN="\e[1;36m" # ]
COLOR_WHITE="\e[1;37m" # ]
COLOR_RESET="\e[0m" # ]

BIN_DIR="$HOME/.local/bin"

mkdir -p "$BIN_DIR"

# Asks a question to the user, waiting for input.
ask_question() {
  echo -ne "${COLOR_CYAN}[?] ${COLOR_WHITE}${1} ${COLOR_BLACK}[$2]${COLOR_RESET}: "
  read -r "$3"
}

# Generates a launcher script to be written into a directory located
# in the PATH.
generate_launcher_script() {
  # Pass all arguments to the launcher script
  # This must be a simple-quoted string so that the current shell
  # does not attempt to interpret it
  arguments='$*'

  cat > "$BIN_DIR/$1" <<EOF
#!/bin/sh

cd "$(dirname $(readlink -e "$_arg_program"))"
./$(basename "$_arg_program") $arguments
EOF

  chmod +x "$BIN_DIR/$1"
}

# Generates a .desktop file compliant with the FreeDesktop spefification.
# <https://specifications.freedesktop.org/desktop-entry-spec/latest/>
generate_desktop_file() {
  cat > "$HOME/.local/share/applications/$2.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=$1
Comment=$3
Exec=$2
EOF
}

if [ "$_arg_program" ]; then
  ask_question "Program name" "$_arg_program" "name"
  ask_question "Program slug" "$_arg_program" "slug"
  ask_question "Program comment" "" "comment"
  ask_question "Start in working directory (y/n)" "n" "start_pwd"
  echo -ne "${COLOR_RESET}"

  if [ -z "$name" ]; then
    name="$_arg_program"
  fi

  if [ -z "$slug" ]; then
    slug="$_arg_program"
  fi

  if [ -z "$start_pwd" ]; then
    start_pwd="n"
  fi

  generate_launcher_script "$slug" "$start_pwd"
  generate_desktop_file "$name" "$slug" "$comment"
fi

# ] <-- needed because of Argbash

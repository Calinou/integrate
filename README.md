# Integrate

**Integrate self-installed software into a FreeDesktop system.**

This script creates a desktop entry and a launcher script placed into the `PATH`
for any of your self-installed applications. This is mainly useful for software
not coming from package repositories.

## Installation

### Using a pre-compiled script

1. [Download the latest compiled script](https://github.com/Calinou/integrate/releases/download/continuous/integrate).
2. Make the script executable.
3. Move it somewhere into your `PATH`.

Enter the commands below in a terminal to perform those steps:

```
wget https://github.com/Calinou/integrate/releases/download/continuous/integrate
chmod +x integrate
sudo mv integrate /usr/local/bin/
```

4. Done! See the **Usage** section below for usage instructions.

### From source

1. Install [Argbash](https://argbash.io/) somewhere in your `PATH`.
2. Clone this repository or [download a ZIP archive](https://github.com/Calinou/integrate/archive/master.zip).
3. Change into the repository's root directory then type `make && sudo make install`.
4. Done! See the **Usage** section below for usage instructions.

## Usage

```
integrate path/to/program
```

The program will ask you a few questions, such as the application name and an
optional comment. The path to the application binary or script can be absolute
or relative, it bears no importance on the final result.

## License

Copyright © 2018 Hugo Locurcio and contributors

- Unless otherwise specified, files in this repository are licensed under the
  MIT license, see [LICENSE.md](LICENSE.md) for more information.
- [Argbash](https://argbash.io/) is licensed under the
  [BSD 3-Clause](https://github.com/matejak/argbash/blob/master/LICENSE) license.

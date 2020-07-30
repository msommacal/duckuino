# Duckuino

Duckuino is a translator from Ducky Script to Arduino, using Flex and Bison.

![Screenshot](img/screenshot.png?raw=true "Screenshot")

All keywords defined in the documentation (available [here](https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Duckyscript)) are supported with the exception of *DEFAULT\_DELAY/DEFAULTDELAY* and *REPEAT*. The addition of *ALTGR* and *BACKSPACE* keys is the only freedom taken from this specification.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development purposes.

### Prerequisites

Make sure that flex, bison and gcc are installed.

### Installing

First you have to clone the git project:

```
git clone https://github.com/msommacal/duckuino.git
```

Then you can compile the project using Make:

```
make
```

### Usage

Duckuino is designed to use redirections. To convert a file written in Ducky Script to an Arduino sketch, you need to use the following command:

```
./duckuino < input.txt > output.ino
```

## License

This project is licensed under the GNU General Public License - see the [LICENSE.md](LICENSE.md) file for details.

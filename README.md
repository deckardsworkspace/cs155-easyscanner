# cs155-easyscanner

Lexical analyzer for the EASY language

submitted by DANTIS, Aurel Jared C. (SN ***REMOVED***)

in partial fulfillment of the requirements for the CS 155 course, second semester academic year 2022-2023

## Prerequisites

Ensure you have `flex` and `gcc` installed and available in your `PATH`. For macOS, these are included with the Xcode Command Line Tools, which can be installed through
    
```bash
xcode-select --install
```

or through [Homebrew](https://brew.sh):

```bash
brew install flex gcc
```

Linux users can install these through their package manager of choice. For Debian and Debian-based distributions such as Ubuntu, this can be done through:

```bash
sudo apt install flex gcc     # or sudo apt install flex build-essential
```

## Compilation

If you have GNU Make installed, `cd` into the repository directory and

```bash
make
```

Otherwise, you can compile the program using the following command:

```bash
# macOS
flex easy.lex && gcc -ll lex.yy.c -o easy
# Linux, Windows
flex easy.lex && gcc -lfl lex.yy.c -o easy
```

## Usage

To run the analyzer against any of the sample EASY files, use the following command (assuming you are in the same directory as the built `easy` binary):

```bash
./easy < samples/<filename>.easy
```

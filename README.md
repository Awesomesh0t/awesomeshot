<h1 align="center">Awesomeshot</h1>
<p align="center">A command-line screenshot tool written in bash 5.1.16+</p>

<p align="center">
<a href="./LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
<a href="https://github.com/mayTermux/awesomeshot/releases"><img src="https://img.shields.io/github/release/mayTermux/awesomeshot.svg"></a>
</p>

Awesomeshot is command-line screenshot tool written in `bash 5.1.16+`. Awesomeshot editing automatically your screenshot.

## Install Dependencies

> - [**Termux:API**](https://f-droid.org/en/packages/com.termux.api/) Application must be installed, this program call some API from Termux like
> `termux-media-scan` and `termux-open`.

- Packages

```bash
pkg i -y termux-api imagemagick inotify-tools
```

## Install This Program

- Clone or Download This Repository

```bash
git clone --depth=1 https://github.com/mayTermux/awesomeshot.git
```

- Enter Directory this program

```bash
cd awesomeshot
```

- Copy awesomeshot into binary or program folder

```bash
cp awesomeshot $PREFIX/bin/
```

or

```bash
install awesomeshot $PREFIX/bin/
```

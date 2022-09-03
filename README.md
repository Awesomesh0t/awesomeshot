<h1 align="center">Awesomeshot</h1>
<p align="center">A command-line screenshot tool written in bash 5.1.16+</p>

<p align="center">
<a href="./LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
<a href="https://github.com/Awesomesh0t/awesomeshot/releases"><img src="https://img.shields.io/github/release/Awesomesh0t/awesomeshot.svg"></a>
</p>

Awesomeshot is command-line screenshot tool written in bash 5.1.16+. Awesomeshot editing automatically your screenshot.

<img src="https://user-images.githubusercontent.com/64394320/170211137-554dfd78-8424-4699-876c-7483b45de068.png" alt="awesomeshot">

## Dependencies

<details>
<summary>Arch Linux</summary>

### Packages

```bash
sudo pacman -S imagemagick flameshot dunst bc make
```

</details>

<details>
<summary>Termux</summary>

### Application

- [Termux:API](https://f-droid.org/en/packages/com.termux.api/)

> Optional

- [Screen Master](https://play.google.com/store/apps/details?id=pro.capture.screenshot)

### Packages

```bash
pkg i -y termux-api imagemagick inotify-tools bc make
```

</details>

## Installation

<details>
<summary>Arch Linux</summary>

### Download or Clone

- Download or clone the latest release.
  <br>

```bash
git clone -b linux https://github.com/Awesomesh0t/awesomeshot
```

- Run `make install` inside the script directory to install the script.
  <br>

```bash
sudo make install
```

</details>

<details>
<summary>Termux</summary>

### Download or Clone

- Download or clone the latest release.
  <br>

```bash
git clone -b termux https://github.com/Awesomesh0t/awesomeshot
```

- Run `make install` inside the script directory to install the script.
  <br>

```bash
make install
```

</details>

## Uninstallation

> Run `make uninstall` inside the script directory to uninstall the script.
>
> _NOTE_: for linux user need `sudo` command

```bash
make uninstall
```

## More:

- [Wiki](https://github.com/Awesomesh0t/awesomeshot/wiki)
- [Customizing Config File](https://github.com/Awesomesh0t/awesomeshot/wiki/Customizing-Config-File)

## How awesomeshot work?

- [https://github.com/Awesomesh0t/awesomeshot/issues/2#issuecomment-1052047095](https://github.com/Awesomesh0t/awesomeshot/issues/2#issuecomment-1052047095)

## Showcase

**Upload your custom config or script `Awesomeshot` [here](https://github.com/Awesomesh0t/awesomeshot/issues/4)**

## Acknowledgements

| Inspiration and Resources                                                                                 |
| --------------------------------------------------------------------------------------------------------- |
| [Bandithijo](https://bandithijo.github.io/blog/memodifikasi-screenshot-dari-flameshot-dengan-imagemagick) |
| [berrabe/awesome-flameshot](https://github.com/berrabe/awesome-flameshot)                                 |
| [lwotcynna/shot-magick](https://github.com/lwotcynna/shot-magick)                                         |

| **Contributors**                      | **Contributions**                                              |
| ------------------------------------- | -------------------------------------------------------------- |
| [usernob](https://github.com/usernob) | [Title Bar](https://github.com/Awesomesh0t/awesomeshot/pull/5) |

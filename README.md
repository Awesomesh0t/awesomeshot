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
sudo pacman -S imagemagick flameshot dunst xclip bc make
```

</details>

<details>
<summary>Ubuntu</summary>

### Packages

```bash
sudo apt install imagemagick flameshot dunst xclip bc make
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
<summary>Linux</summary>

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

## Preview

- Arch Linux

https://user-images.githubusercontent.com/64394320/188277211-e4414d4e-e412-400e-8364-4162ca345d09.mp4

> For awesomeshot can run without terminal, i just made a shortcut
> ![Arch Linux](https://user-images.githubusercontent.com/64394320/189496189-0d0fbc51-91f4-4673-85ac-87fc5bc799b2.png)

- Ubuntu

https://user-images.githubusercontent.com/64394320/192626023-8c2612f2-0c19-4fae-afe0-bc084f355587.mp4

> In this option, flameshot not work at wayland (Ubuntu 22.04 Using Wayland) and i change to use `gnome-screenshot --area -f` command
> ![Ubuntu](https://user-images.githubusercontent.com/64394320/190963341-3dd96a9d-e227-4b6b-8bcb-7e9c17fb6c39.png)

- Proot Distro Termux

https://user-images.githubusercontent.com/64394320/189495213-c102c789-bae9-439e-887c-bd09b822f09b.mp4

> In this option, idk why `flameshot gui --raw` can't be run and i change to use `scrot -F` command
> ![Termux Proot Distro](https://user-images.githubusercontent.com/64394320/189495515-27430ac3-9bc7-441f-be6b-fed58c2acc32.png)

## How awesomeshot work?

- [How do i actually use this?](https://github.com/Awesomesh0t/awesomeshot/issues/2#issuecomment-1052047095)

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

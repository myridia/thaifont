# Installing ThaiFont

Step-by-step manual for installing the ThaiFont OpenType fonts on Linux
(Debian/Ubuntu first), macOS, and Windows.

The font files live in this repository:

| File | Family |
| ---- | ------ |
| `pages/public/Myridia-Normal.otf` | Myridia (demo copy) |
| `Myridia-Normal.otf` | Myridia (current export) |
| `JS-Synjai-Normal.otf` | JS-Synjai |

Pick one file or install several — the steps are identical per file.

> Web apps do **not** need installation: use `@font-face` instead (see the
> README). Installation below is for the desktop or for apps that read system
> fonts.

## 1. Get the font files

### Option A — clone the repository

```sh
git clone https://github.com/myridia/thaifont.git
cd thaifont
```

### Option B — download individual files only

```sh
mkdir -p thaifont && cd thaifont
curl -LO https://raw.githubusercontent.com/myridia/thaifont/main/Myridia-Normal.otf
curl -LO https://raw.githubusercontent.com/myridia/thaifont/main/JS-Synjai-Normal.otf
```

(The demo copy used by the web page lives at `pages/public/Myridia-Normal.otf`
and is only needed for the demo, not for installing.)

## 2. Debian / Ubuntu (and most other Linux)

You have two choices: **per-user** (your login only, no root, recommended for
single machines) or **system-wide** (every user on the machine, needs `sudo`).

### 2a. Per-user install

```sh
mkdir -p ~/.local/share/fonts
cp Myridia-Normal.otf JS-Synjai-Normal.otf ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts
```

### 2b. System-wide install

```sh
sudo mkdir -p /usr/local/share/fonts/thaifont
sudo cp Myridia-Normal.otf JS-Synjai-Normal.otf /usr/local/share/fonts/thaifont/
sudo fc-cache -fv
```

> Legacy: `~/.fonts` still works but is deprecated — prefer
> `~/.local/share/fonts` for new installs.

## 3. Other Linux distributions

The same XDG paths used above apply on **Fedora**, **Arch Linux**, **openSUSE**,
etc. Only package-manager-based font caches differ; the simplest reliable method
is still `fc-cache -fv`.

Fedora example (system-wide):

```sh
sudo mkdir -p /usr/local/share/fonts/thaifont
sudo cp Myridia-Normal.otf JS-Synjai-Normal.otf /usr/local/share/fonts/thaifont/
sudo fc-cache -fv
```

There is no dedicated `dnf`/`apk`/`pacman` package for ThaiFont — installing the
files as above is the supported way.

## 4. macOS

### 4a. Font Book (recommended)

1. Double-click the `.otf` file (Finder).
2. In the Font Book preview window click **Install Font**.
3. Repeat for each family.

### 4b. Copy into your user font folder

```sh
mkdir -p ~/Library/Fonts
cp Myridia-Normal.otf JS-Synjai-Normal.otf ~/Library/Fonts/
```

## 5. Windows

1. In File Explorer, **right-click** the `.otf` file and choose **Install**.
   * To install for all users, right-click → **Install for all users** (needs an
     admin account).
2. Restart the apps in which you want to use the font (some apps cache fonts).

## 6. Verify the install

### Linux

```sh
fc-list | grep -iE 'myrid(ia)?|synjai'
```

If installed, at least one line matching the family name prints. You can also
ask Fontconfig directly:

```sh
fc-match "Myridia"
```

> Note: the metadata inside these exports varies by file (some register as
> "Myridia", others under the "JS Synjai" family name). Harmless — just pick the
> family from the app's font list; what matters is which file got installed.

### macOS

Open **Font Book** and check the family appears in the list.

### Windows

Open *Settings → Personalization → Fonts* and search for "Myridia"; or check the
installed list in the Fonts control panel.

## 7. Uninstall

* **Linux (per-user):** `rm ~/.local/share/fonts/*.otf` then `fc-cache -fv`.
* **Linux (system):** remove the files from `/usr/local/share/fonts/thaifont/`
  then `sudo fc-cache -fv`.
* **macOS:** select the families in Font Book and press **Delete** (Backspace);
  confirm removal.
* **Windows:** *Settings → Personalization → Fonts*, select the font, and use
  **Uninstall**.

## 8. Troubleshooting

| Symptom | Fix |
| ------- | --- |
| Font not listed after installing | Rebuild the cache with `fc-cache -fv`; confirm the `.otf` files are actually in the install directory. |
| App still shows a different font | Restart the app; on Linux some apps cache fonts on start. |
| Browser page shows a fallback font | The OS-level install doesn't affect web pages — embed with `@font-face` instead. |
| Wrong/first font in `fc-list` | A system-wide copy can hide a per-user copy; uninstall one of the two. |
| Windows shows old font | Clear the Windows font cache (restart, or `C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache`) and reopen the app. |
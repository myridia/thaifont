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

### Option B — download the release

New builds of Myridia are published to a release tagged `main` on every push.
The URL below always points to the newest build:

```sh
mkdir -p thaifont && cd thaifont
curl -Lo Myridia-Normal.otf https://github.com/myridia/thaifont/releases/download/main/Myridia-Normal.otf
```

(JS-Synjai isn't published to releases yet — get `JS-Synjai-Normal.otf` from the
repo itself, see Option A. The demo copy `pages/public/Myridia-Normal.otf` is
only needed for the web demo, not for installing.)

## 2. Debian / Ubuntu (and most other Linux)

You have four installation options: Linux/macOS/FreeBSD get the one-line
installer (recommended) plus the manual per-user/system-wide methods; Windows
gets its own PowerShell installer.

### 2a. One-line installer (recommended — Linux, macOS, FreeBSD)

```sh
curl --proto '=https' --tlsv1.2 -fsSL https://thaifont.myridia.com/install.sh | sh
```

Installs the latest `Myridia-Normal.otf` for the current user and activates it
(rebuilds the font cache on Linux/FreeBSD; on macOS it installs into
`~/Library/Fonts`).

Don't want to pipe a script? This single command does the same on Linux:

```sh
mkdir -p ~/.local/share/fonts && curl -fsSL https://github.com/myridia/thaifont/releases/download/main/Myridia-Normal.otf -o ~/.local/share/fonts/Myridia-Normal.otf && fc-cache -f
```

### 2b. Per-user install

```sh
mkdir -p ~/.local/share/fonts
cp Myridia-Normal.otf JS-Synjai-Normal.otf ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts
```

### 2c. System-wide install

```sh
sudo mkdir -p /usr/local/share/fonts/thaifont
sudo cp Myridia-Normal.otf JS-Synjai-Normal.otf /usr/local/share/fonts/thaifont/
sudo fc-cache -fv
```

> Legacy: `~/.fonts` still works but is deprecated — prefer
> `~/.local/share/fonts` for new installs.

## 3. Other Unix-like systems (Fedora, Arch, openSUSE, FreeBSD)

The same XDG paths used above apply on **Fedora**, **Arch Linux**, **openSUSE**,
etc. — including the one-line installer from
[2a](#2a-one-line-installer-recommended--linux-macos-freebsd).

**FreeBSD** works identically: the installer shares the Linux branch and copies
into `~/.local/share/fonts` (it runs `fc-cache` only when fontconfig is
installed).

Fedora example (system-wide):

```sh
sudo mkdir -p /usr/local/share/fonts/thaifont
sudo cp Myridia-Normal.otf JS-Synjai-Normal.otf /usr/local/share/fonts/thaifont/
sudo fc-cache -fv
```

There is no dedicated `dnf`/`apk`/`pacman` package for ThaiFont — installing the
files as above is the supported way.

## 4. macOS

The one-line installer from
[2a](#2a-one-line-installer-recommended--linux-macos-freebsd) also works on
macOS. Manual options:

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

### 5a. One-line installer (recommended — PowerShell)

In PowerShell (no admin required):

```powershell
iwr -useb https://thaifont.myridia.com/install.ps1 | iex
```

Installs the latest `Myridia-Normal.otf` into the Windows Fonts collection for
the current user.

### 5b. Manual install

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
# ThaiFont

[![GitHub stars](https://img.shields.io/github/stars/myridia/thaifont?style=social)](https://github.com/myridia/thaifont/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/myridia/thaifont)](https://github.com/myridia/thaifont/issues)
[![GitHub license](https://img.shields.io/github/license/myridia/thaifont)](https://github.com/myridia/thaifont/blob/main/LICENSE)

A font for **vocal highlighting and Thai script learning**. ThaiFont separates
vowels and tone markers from their consonants visually, so beginners can see at
a glance which part of a syllable is the vowel. It also ships a small web demo
with a bundled Thai wordlist and a longest-match tokenizer.

* Live demo: <https://thaifont.myridia.com/>

## The idea behind ThaiFont

Reading most scripts is like singing musical notes. Thai makes this harder at
first because:

* Vowels are not always written with explicit letters — they can sit above,
  before, behind, or below the consonant.
* Tone markers are integrated into the script.
* Some vowel sounds are implied and unwritten.

ThaiFont addresses this by **visually highlighting vowels and tone markers** so
they stand out from consonants:

* **Visible vowels** — the vowel portion of each syllable is emphasized, making
  it easier to identify.
* **Better comprehension** — connecting the written script with the spoken
  sounds improves reading comprehension and pronunciation.
* **Learning-friendly** — a fresh, engaging way to approach Thai script.

## Fonts included

| Family | File | Notes |
| ------ | ---- | ----- |
| Myridia | `pages/public/Myridia-Normal.otf` | Classic vocal-highlighting face, used by the demo and this README |
| Myridia | `Myridia-Normal.otf` | Current export of the Myridia source |
| JS-Synjai | `JS-Synjai-Normal.otf` | Second family built from the same source |

All three are OpenType (`.otf`) and self-hosting-friendly. The two files in the
repository root are the most recent exports; `pages/public/` mirrors the demo
copy.

## Usage

### In a website

Serve the font with `@font-face`, then apply the family whenever you want Thai
script rendered with vocal highlighting:

```html
<style>
  @font-face {
    font-family: "Myridia";
    src: url("Myridia-Normal.otf") format("opentype");
    font-weight: normal;
    font-style: normal;
  }

  .thai {
    font-family: "Myridia", "Noto Sans Thai", sans-serif;
    font-size: 1.5rem;
    line-height: 1.6;
  }
</style>

<p class="thai">ติ่น แล้ว หรือ จ๊ะ มา มะ ลูก จํา อุม หนู ขึ้น มา</p>
```

The CSS family name is yours to choose — it does not have to match the filename.

### On the desktop

Download one of the `.otf` files and install it the normal way for your
operating system (double-click → *Install*, or copy into `~/.fonts`/`~/Library/
Fonts`/`C:\Windows\Fonts`).

## Tokenizer demo

Beyond the font itself, `pages/public/` bundles a small reading tool:

* `wordlist.js` — a Thai wordlist as a JavaScript array.
* `dict.txt` — the plain-text wordlist it was generated from.
* `index.js` — a longest-match tokenizer that splits a Thai sentence into words
  using the wordlist.
* `convert.sh` — regenerates `wordlist.js` from a plain wordlist file.

The demo page loads the font, and tokenizes sample text to stdout.

## Project layout

```
mx.glyphs                    Font source (Glyphs.app format)
Myridia-Normal.otf           Current font export
JS-Synjai-Normal.otf         Second family export
pages/
  public/                    GitHub Pages demo site (deployed automatically)
    index.html               Demo page
    index.js                 Longest-match tokenizer
    wordlist.js              Thai wordlist (array)
    dict.txt                 Wordlist source text
    convert.sh               Wordlist -> wordlist.js converter
    Myridia-Normal.otf       Demo font copy
    img/                     Site icons
dockers/                     Local nginx that serves pages/public (HTTPS-ready)
.github/workflows/pages.yml  Deploys pages/public to GitHub Pages on push
```

## Run it locally

Any static file server works, e.g.:

```sh
cd pages/public
python3 -m http.server 8080
```

or use the provided nginx compose stack (HTTPS-ready, self-signed certs in
`dockers/etc/nginx/conf.d/certs`):

```sh
cd dockers
docker compose up
```

## Building the font

The font design source lives in `mx.glyphs` (Glyphs format). The `.otf` files at
the repository root are exports of that source; regenerate and re-export them if
you change the glyphs. Editing the source requires Glyphs (or a compatible
`.glyphs` editor).

## License

GPLv3 — see [LICENSE](LICENSE). You are free to use, share, and modify the font
and its sources, provided derivative works keep the same license and are
distributed with access to their source.

## Contributing

* **Report issues** via the [issue tracker](https://github.com/myridia/thaifont/issues) — bugs, missing glyphs, spacing issues.
* **Submit pull requests** for font improvements, new glyphs, or demo/wordlist fixes.
* **Spread the word** with anyone learning to read Thai.
# Dream Sounds: Harmony 2

## Sound theme for KDE Plasma 6

- Instrumental and skeuomorphic sounds;
- Designed for [KDE Plasma 6](https://kde.org/plasma-desktop/);
- Follows [freedesktop's sound naming spec](https://specifications.freedesktop.org/sound-naming-spec/sound-naming-spec-latest.html);
- Made with [LMMS](https://lmms.io/) and [Tenacity](https://tenacityaudio.org/).

## Installation

### Pling/KDE Store

Get the theme from [here](https://www.pling.com/p/2134858/) or look it up in a KGetNewStuff interface.

### This repo

1. Download a package from the releases or clone the repository;
2. Copy the `stereo` folder and the `index.theme` file in `/usr/share/sounds/harmony2` or `~/.local/share/sounds/harmony2`;
3. Set the theme in your System Settings under the "Sound theme" section.

## Exporting

To export all the sounds from LMMS:

0. Make sure the various tracks (each corresponding to one sound) you want to export are enabled (their green light on the left must be on);
1. Go to File > Export Tracks... and choose a directory to export the sounds in;
2. In the encoding settings choose "Compressed OGG-File (*.ogg)" as the file format, 48000 Hz as the samplerate and 320 KBit/s as the bitrate in order to match the official sounds;
3. Click "Start" and wait for the process to finish.

One annoying thing is that LMMS always exports the tracks with a number prefix in front of every file name, to solve this I found a simple Bash routine to rename all the files and get rid of the prefix:

```bash
for fp in ./*_*; do
  mv "$fp" "${fp#*_}"
done
```

---

🄯 2024 Gianmarco Gargiulo - CC BY-SA 4.0 International (check the LICENSE file)

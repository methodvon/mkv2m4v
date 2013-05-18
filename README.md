# mkv2m4v [![Gem Version](https://badge.fury.io/rb/mkv2m4v.png)](http://badge.fury.io/rb/mkv2m4v) [![Code Climate](https://codeclimate.com/github/rmm5t/mkv2m4v.png)](https://codeclimate.com/github/rmm5t/mkv2m4v)

Converts audio and video tracks from a MKV (Matroska Media) container into a
format compatible with Apple TVs.

It attempts to pass through as many codecs as possible.

* It assumes that the video track is already in H.264/MPEG-4 (Advanced Video
  Codec).
* It will convert a DTS audio track into separate AAC and AC3 tracks.
* If no DTS, it will pass through the original AAC and/or AC3 tracks.

**If you like this project, please help by donating.**

* Gittip: https://www.gittip.com/rmm5t/
* Bitcoin: `1wzBnMjWVZfpiFMc5i2nzKT7sCBaZNfLK`

## Installation

mkv2m4v is dependent upon `mediainfo`, `mkvextract`, `ffmpeg`, and `MP4Box`.

```bash
$ brew install mediainfo
$ brew install gpac
$ brew install mkvtoolnix
$ gem install mkv2m4v
```

_Note: `gpac` includes `MP4Box` and is dependent on `ffmpeg`, so `ffmpeg`
should install automatically. If not, you should manually install `ffmpeg`:_

```bash
# ffmpeg should already be installed, but just in case:
$ brew install ffmpeg --with-tools
```

## Usage

```bash
$ mkv2m4v some-video.mkv
```

## Background

I got fed up with the reliability of the conversion tools out there for
converting MKV video containers to Apple TV compatible videos. Many of the
existing tools appear to have potential on the surface, but they fail under
certain scenarios.

[Handbrake](http://handbrake.fr/) is still the most realiable existing tool
out there, but it re-encodes h.264 video tracks, which is not ideal and very
slow.

The goal is to get a better, more automated tool to accomplish the task of
generating Apple TV compatible videos. Nothing more. It should generate an M4V
media file with the best possible quality given the original source and the
defaults should require no additional human interaction.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

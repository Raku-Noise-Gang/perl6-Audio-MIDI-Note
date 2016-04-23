[![Build Status](https://travis-ci.org/zoffixznet/perl6-Audio-MIDI-Note.svg)](https://travis-ci.org/zoffixznet/perl6-Audio-MIDI-Note)

# NAME

Audio::MIDI::Note - playable MIDI note

# NON Perl 6 REQUIREMENTS

This module uses [Audio::PortMIDI](http://modules.perl6.org/repo/Audio::PortMIDI)
under the hood, which requires [portmidi C library](http://portmedia.sourceforge.net/portmidi/).

On Debian and derivatives, you can install it with `sudo apt-get install libportmidi0`

# SYNOPSIS

```perl6
use Audio::MIDI::Note;
```

# DESCRIPTION

This module lets you play notes on a MIDI hardware or software device.

# METHODS

## `new`

```perl6
my Audio::MIDI::Note $t .= new;
```

----

# REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-Audio-MIDI-Note

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Audio-MIDI-Note/issues

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.

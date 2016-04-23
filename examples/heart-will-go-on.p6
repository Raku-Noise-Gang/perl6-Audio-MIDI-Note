use lib 'lib';
use Audio::MIDI::Note;

my $stream = Audio::PortMIDI.new.open-output: 3, 32;
END { $stream.close }

my Audio::MIDI::Note $note .= new: :25tempo :$stream;
# 'Titanic' Theme: http://www.musicnotes.com/sheetmusic/mtd.asp?ppn=MN0062768

my &main = { # first two bars that repeat throughout the song
    .play(<F3 A3>, 1).rplay('F4', ¼+⅛).rplay('F4', ⅛).rplay('F4').rplay('F4')
    .play(<C3 G3>, 1).rplay('E4').rplay('F4', ½).rplay('E4');
};

$note   .riff(&main)
        .play(<Bb2 F3>, 1).rplay('E4').rplay('F4', ½).rplay('G4')
        .rplay(<F2 F4 A4>, ½).rplay(<C3 E4 G4>, ½)

        .riff(&main)
        .rplay(<Bb2 F3 C4>, 1).rplay('Bb2').rplay('C3').rplay('D3').rplay('G3')
;

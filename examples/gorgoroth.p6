use lib 'lib';
use Audio::MIDI::Note;

my $stream = Audio::PortMIDI.new.open-output: 3, 32;
END { $stream.close }

my Audio::MIDI::Note $note .= new: :31tempo :30instrument :$stream :value(⅔ * ⅛);

# Looping `Gorgoroth - A World to Win` solo with organ chord in the background.
# We use tripplet notes and save repeating pieces into variables for reuse
my &rhythm = *.rplay('D#5').rplay('D5').rplay('C5');
my &riff = {
    .play(<C4 E4 G4>, 4, :19instrument, :40velocity)

    .rplay('C5',  ⅔*(¼+⅛) )
    .riff(&rhythm).rplay('C5',  ⅔*(¼+⅛) )
    .riff(&rhythm).rplay('G#4', ⅔*(¼+⅛) )
    .riff(&rhythm).rplay('A#4', ⅔*(¼+⅛) )
    .riff(&rhythm).rplay('C5',  ⅔*(¼+⅛) )
    .riff(&rhythm).rplay('C5',  ⅔*(¼+⅛) )
    .riff(&rhythm);
};

$note   .riff(&riff)
            .rplay('G5',  ¼, :on).rplay('F5', ¼, :off)
            .rplay('D#5', ¼     ).rplay('D5', ¼, :off)
        .riff(&riff)
            .rplay('F5', ¼, :on ).rplay('D#5', ¼, :off)
            .rplay('D5', ¼      ).rplay('A#4', ¼, :off)
for ^10;

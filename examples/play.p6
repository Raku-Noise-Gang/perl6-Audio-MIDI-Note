use lib 'lib';
use Audio::MIDI::Note;

my $stream = Audio::PortMIDI.new.open-output: 3, 32;
END { $stream.close }

my Audio::MIDI::Note $note .= new: :31tempo :42instrument :$stream :value(⅔ * ⅛);

my &main-bars = sub {
    $note .play('C4', 4, :19instrument, :60velocity)

          .rplay('C5', ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5').rplay('C5',  ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5').rplay('G#4', ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5').rplay('A#4', ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5').rplay('C5',  ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5').rplay('C5',  ⅔*(¼+⅛) )
          .rplay('D#5').rplay('D5').rplay('C5')
    ;
}

for ^10 {
    main-bars;
    $note.rplay('G5', ¼, :on).rplay('F5', ¼, :off)
        .rplay('D#5', ¼).rplay('D5', ¼, :off);

    main-bars;
    $note.rplay('F5', ¼, :on).rplay('D#5', ¼, :off)
        .rplay('D5', ¼).rplay('A#4', ¼, :off);
}

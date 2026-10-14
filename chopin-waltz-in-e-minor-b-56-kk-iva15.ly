\version "2.26.0"
\language "nederlands"
#(ly:set-option 'midi-extension "mid")
\pointAndClickOff

Cresc = #(make-music 'CrescendoEvent 'span-direction START 'span-type 'text)
Decresc = #(make-music 'DecrescendoEvent 'span-direction START 'span-type 'text)

hideNote =
  \tweak Dots.transparent ##t
  \tweak NoteHead.transparent ##t
  \tweak NoteHead.no-ledgers ##t
  \tweak Accidental.transparent ##t
  \tweak Rest.transparent ##t
  \tweak TabNoteHead.transparent ##t \etc

toUp = { \change Staff = "up" }
toDown = { \change Staff = "down" }

\header {
  title = "Waltz in E Minor"
  subtitle = "B. 56, KK IVa/15 — Opus Posthumous"
  composer = "Frédéric François Chopin (1810–1849)"
  tagline = ##f
}

#(set-global-staff-size 18.0)
\paper {
  #(set-paper-size "a4")
  top-margin = 12\mm
  bottom-margin = 12\mm
  left-margin = 13\mm
  right-margin = 13\mm
  indent = 0\mm
  short-indent = 0\mm
  ragged-last-bottom = ##t
  system-system-spacing =
    #'((basic-distance . 14)
       (minimum-distance . 10)
       (padding . 2.5)
       (stretchability . 8))
  markup-system-spacing =
    #'((basic-distance . 10)
       (minimum-distance . 8)
       (padding . 3)
       (stretchability . 0))
}
\layout {
  \context {
    \Score
    autoBeaming = ##f
    doubleRepeatBarType = ":|.|:"
  }
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \PianoStaff
    \override StaffGrouper.staff-staff-spacing =
      #'((basic-distance . 12)
         (minimum-distance . 9)
         (padding . 2.5)
         (stretchability . 1))
  }
}

melody = \relative b, {
  \autoLineBreaksOff
  \autoPageBreaksOff

  \mark \markup \small "E Minor" \time 3/4 \key e \minor \partial 4 \stemUp \toUp \toDown b4 -2 _\p | % 1
  \tag #'printOnly { \set Score.currentBarNumber = #2 }
  dis8 ^( [ e8 g8 -1 e'8 b8 -3 g8 -1 ] | % 2
  fis8 [ g8 -1 \oneVoice \stemUp \toUp b8 g'8 e8 -4 b8 -1
  ] \toDown | % 3
  \toUp ais8 [ b8 e8 -1 b'8 g8 -3 e8 -1 ) ]
  \toDown | % 4
  \toUp dis8 _( [ e8 g8 e'8-\tag #'midiOnly _\Cresc
  b8 g8 ) ] \toDown | % 5
  \stemNeutral
  \toUp fis8 ^( [ g8 b8 g'8 e8 b8 ) ] \toDown \break | % 6

  \toUp ais8 ^( [ b8 e8 b'8 g8 e8 ] <>-\tag #'midiOnly \! \toDown \toUp | % 7
  dis8 [ _\f e8 g8 b8 e8 r16 \ottava #1 e'16 ) ] \toDown | % 8
  \toUp <g, b>4 \ottava #0 r4 r4 \toDown \toUp | % 9

  b,,4 -1 -. _\p ^\markup \fontsize #0.049 \italic grazioso b8 -3 -. [ b8 -2 -. ] b4 -1 -. \toDown | % 10
  \toUp ais8 -2 ^( [ b8 -1 e8 g8 ) ] b4 -. \toDown \toUp | % 11
  \ottava #1 \appoggiatura { c16 -1 [ d16 -3 ] } c8 -2 ^( [ b8 ais8
  -2 b8 -1 <dis fis>8 b'8 ) ] \toDown \break | % 12

  \toUp <e, g -4>4 r4 b4 -2 \toDown | % 13
  \toUp \acciaccatura { c8 } b'4 -. \voiceTwo \tag #'silent \hideNote a8 [ fis8 ] c4 \toDown | % 14
  \oneVoice \toUp \acciaccatura { b8 } a'4 -. \toDown \toUp \voiceTwo \tag #'silent \hideNote g8 [ e8 ]
  b4 \toDown | % 15
  \oneVoice \toUp \acciaccatura { a8 } g'4
  -. \toDown \toUp \voiceTwo \tag #'silent \hideNote fis8 [ dis8 ] a4 \ottava #0 \toDown | % 16
  \oneVoice \toUp <g e'>8 ^( [ c8 -4 b8 g8 -2 e8 c8
  -2 ) ] \toDown | % 17
  \toUp b4 -. b8 -. [ b8 -. ] b4 -. \toDown \break | % 18

  \toUp ais8 ^( [ b8 e8 g8 ) ] b4 -. \toDown \toUp | % 19

  \ottava #1 \appoggiatura { c16 [ d16 ] } c8 ^( [ b8 ais8 b8
  <dis fis>8 b'8 ) ] \toDown | % 20
  \toUp <e, g>4 r4 b4 \toDown | % 21
  \toUp \acciaccatura { c8 } b'4 -. \voiceTwo \tag #'silent \hideNote a8 [ fis8 ] c4 \toDown | % 22
  \oneVoice \toUp \acciaccatura { b8 } a'4 -. \toDown \toUp \voiceTwo \tag #'silent \hideNote g8 [ e8 ]
  b4 \toDown | % 23
  \oneVoice \toUp \acciaccatura { a8 } g'4
  -. \toDown \toUp \voiceTwo \tag #'silent \hideNote fis8 [ dis8 ] a4 \toDown \break | % 24

  \oneVoice \toUp <g e'>4 \ottava #0 r4 b,4 -2 \toDown \repeat volta 2 {
    | % 25
    \toUp c8 -1 ^( [ _\markup \fontsize #0.049
    \italic "dolce e legato" fis!8 -3 a8 g8 e8 c8 ) ] \toDown | % 26
    \toUp c2 -2 -> b4 \toDown | % 27
    \toUp bes8 -1 ^( [ e8 -3 g8 f8 d8 bes8 ) ]
    \toDown | % 28
    \toUp bes2 -2 ^( -> a4 ) \toDown | % 29

    \toUp a8 ^( [ dis8 fis8 e8 c8 a8 ) ] \toDown | % 30
    \toUp a2 _( -> g4 ) \toDown \pageBreak | % 31

    \toUp fis8 -2 _( [ g8 -1 a8 -3 ais8 b8 fis8 )
    ] \toDown | % 32
    \toUp a!2 _( -> g4 ) \toDown \toUp | % 33
    \ottava #1 c8 [ _\f g'8 c8 -5 c8 -1 g'8 c8 ] \toDown | % 34
    \toUp b8 -4 [ fis8 -2 b,8 b8 -5 fis8 b,8 ]
    \toDown | % 35
    \toUp bes8 [ f'8 bes!8 -5 bes8 -1 f'!8 bes!8 ]
    \toDown | % 36
    \toUp a8 -4 [ e8 -2 a,8 a8 -5 e8 a,8 ] \toDown \break | % 37

    \toUp a8 [ e'8 a8 a8 e'8 -2 a8 ] \toDown | % 38
    \toUp g8 -4 [ e8 -2 g,8 g8 -5 e8 g,8 ] \ottava
    #0 \toDown | % 39

    \toUp fis'8 -4 [ fis,8 b8 fis'8 -4 ] <a, g'>8 [
    fis'8 ] \toDown | % 40
    \toUp <g, e' -3>4 es'8 ^( [ _\> d8 cis8 -3 c8 ) ]
    \toDown <>\! \toUp | % 41
    b4 -. ^\markup \fontsize #0.049 \italic dolce b8 -. [ b8 -. ] b4
    -. \toDown | % 42
    \toUp ais8 ^( [ b8 e8 g8 ) ] b4 -. \toDown \toUp \break | % 43

    \ottava #1 \appoggiatura { c16 [ d16 ] } c8 [ b8 ais8 b8
    <dis fis>8 b'8 ] \toDown | % 44
    \toUp <e, g>4 r4 b4 \toDown | % 45
    \toUp \acciaccatura { c8 } b'4 -. \voiceTwo \tag #'silent \hideNote a8 [ fis8 ] c4 \toDown | % 46
    \oneVoice \toUp \acciaccatura { b8 } a'4 -. \toDown \toUp \voiceTwo \tag #'silent \hideNote g8 [ e8 ] b4 \toDown | % 47
    \oneVoice \toUp \acciaccatura { a8 } g'4
    -. \toDown \toUp \voiceTwo \tag #'silent \hideNote fis8 [ dis8 ] a4 \ottava #0 \toDown | % 48
    \oneVoice \toUp <g e'>8 ^( [ c8 b8 g8 e8 c8 )
    ] \toDown \break | % 49

    \toUp b4 -. b8 -. [ b8 -. ] b4 -.
    \toDown | % 50
    \toUp ais8 ^( [ b8 e8 g8 ) ] b4 -. \toDown \toUp | % 51
    \ottava #1 \appoggiatura { c16 [ d16 ] } c8 ^( [ b8 ais8 b8
    <dis fis>8 b'8 ) ] \toDown | % 52
    \toUp <e, g>4 r4 b4 \toDown | % 53
    \toUp \acciaccatura { c8 } b'4 -. \voiceTwo \tag #'silent \hideNote a8 [ fis8 ] c4 \toDown | % 54
    \oneVoice \toUp \acciaccatura { b8 } a'4 -. \toDown \toUp \voiceTwo \tag #'silent \hideNote g8 [ e8 ] b4 \toDown \break | % 55

    \oneVoice \toUp \acciaccatura { a8 } g'4
    -. \toDown \toUp \voiceTwo \tag #'silent \hideNote fis8 [ dis8 ] a4 \toDown \alternative {
      \volta 1 {
        | % 56
        \oneVoice \toUp <g e'>4 \ottava #0 \toDown
        \toUp r4 ais,8 -2 [ b8 -3 ] \toDown }
      \volta 2 {
        \toUp | % 57
        \ottava #1 <g' e'>4 \toDown \toUp
        r4 \ottava #0 r4 \toDown }
    }
  }
  \repeat volta 2 {
    | % 58
    \toUp \key e \major
    \mark \markup \small "E Major"
    \slashedGrace { dis,16 _( [ fis16 ] }
    \fixed c' { cis'2. ) ^( \p ^\markup \italic "dolce" }
    \toDown | % 59
    \toUp
    \fixed c' { b2. ^\markup \finger "4-1" }
    \toDown \break | % 60

    \toUp cis'8 [ _\< dis8 \toDown
    \toUp e8 -1 fis8 gis8 a8 -1 ] \toDown <>\! | % 61
    \toUp cis2 -> b4 ) \toDown | % 62
    \toUp \slashedGrace { gis,8 _( }
    \fixed c' { gis'2. -5 ) ^( }
    \toDown | % 63
    \toUp \slashedGrace { ais8 _\=2( } g'2. -4
    \=2) \toDown | % 64
    \toUp \slashedGrace { a,!8 _\=2( } fis'8 -3 \=2) [ gis!8
    fis8 e8 dis8 -1 cis8 -3 ) ] \toDown | % 65
    \toUp \slashedGrace { gis8 } cis2 -4 b4 \toDown \toUp \pageBreak | % 66

    \toUp \slashedGrace { dis,16 _( [ fis16 ] }
    \fixed c' { cis'2. ) ^( \p }
    \toDown | % 67
    \toUp
    \fixed c' { b2. }
    \toDown | % 68
    \toUp cis'8 [ _\< dis8 \toDown
    \toUp e8 fis8 gis8 a8 ] \toDown <>\! | % 69

    \toUp cis2 -> b4 ) \toDown | % 70
    \toUp \slashedGrace { gis,8 _( }
    \fixed c' { gis'2. ) ^( }
    \toDown | % 71
    \toUp \slashedGrace { ais8 _\=2( } g'2. \=2)
    \toDown \break | % 72

    \toUp \slashedGrace { fis8 [ a,!8 gis'!8 ] } fis4
    eis8 [ fis8 a!8 gis8 ] \toDown \alternative {
      \volta 1 {
        | % 73
        \toUp <gis, e'!>8 [ fis'8 gis8 dis8 -3 e8
        dis8 ) ] \toDown }
      \volta 2 {
        | % 74
        \toUp <gis, e'!>4 r4 gis4 \toDown }
    }
  }
  \repeat volta 2 {
    \toUp | % 75
    <gis, bis dis gis>2. _\ff \toDown | % 76
    \toUp <bis dis gis>2 <gis cis e gis>4 \toDown | % 77
    \toUp <gis bis dis gis>2. \toDown \break | % 78

    \toUp <bis dis gis>2 <gis cis e gis>4 \toDown | % 79

    \toUp <gis b! dis>2. \toDown \toUp | % 80
    <gis' b>2. _\> \toDown \toUp | % 81
    <cis, fisis dis'>2. -> \toDown | % 82
    \toUp <b gis' b>4 r4 s4 \toDown <>\! \toUp | % 83
    \toUp \voiceOne
    \fixed c' { cis'2. ^( \p }
    \toDown | % 84
    \toUp \voiceOne
    \fixed c' { b2. }
    \toDown \break | % 85

    \toUp \oneVoice cis'8 [ _\< dis8 \toDown \toUp e8 fis8 gis8 a8 ) ]
    \toDown <>\! | % 86
    \toUp cis2 ^( b4 ) \toDown | % 87
    \toUp \slashedGrace { gis,8 _( }
    \fixed c' { gis'2. ) ^( }
    \toDown | % 88
    \toUp \slashedGrace { ais8 _\=2( } g'2. \=2)
    \toDown | % 89

    \toUp \slashedGrace { a,!8 _\=2( } fis'8 \=2) [ gis!8
    fis8 e8 dis8 cis8 ) ] \toDown | % 90
    \toUp \acciaccatura { gis8 } cis2 ^( b4 ) \toDown \toUp \break | % 91

    \slashedGrace { dis,16 _( [ _\pp fis16 ] } cis'2. ) ^( \toDown | % 92
    \toUp b2. \toDown \toUp | % 93
    cis8 [ _\< dis8 e8 fis8 gis8 a8 ) ] \toDown <>\!
    | % 94
    \toUp cis2 ^( b4 ) \toDown | % 95
    \toUp \acciaccatura { gis,8 } gis'2. ^( \toDown \break | % 96

    \toUp \slashedGrace { ais,8 _\=2( } g'2. \=2) \toDown | % 97
    \toUp \slashedGrace { fis8 [ a,!8 gis'!8 ] } fis4
    eis8 [ fis8 a!8 gis8 ] \toDown \alternative {
      \volta 1 {
        | % 98
        \toUp <gis, e'!>4 ) r4 gis4 \toDown }
      \volta 2 {
        | % 99

        \toUp <gis e'!>4 r4 b4 -2 \toDown \bar "||" % 100
      }
    }
  }
  \toUp \key e \minor \mark \markup \small "E Minor" b4 -1 -. _\p \toDown \toUp b8 -. [ b8
  -. ] b4 -. \toDown \pageBreak | % 101

  \toUp ais8 ^( [ b8 \toDown \toUp e8 g8 ) ] b4 -. \toDown | % 102
  \toUp \ottava #1 \appoggiatura { c16 [ d16 ] } c8 [ b8 \toDown \toUp ais8 b8
  <dis fis>8 b'8 ] \toDown | % 103
  \toUp <e, g>4 r4 b4 \toDown | % 104
  \toUp \slashedGrace { c8 } b'4 -. \voiceTwo \tag #'silent \hideNote a8 [ fis8 ] c4 \toDown | % 105
  \oneVoice \toUp \slashedGrace { b8 } a'4 -. \voiceTwo \tag #'silent \hideNote g8 [ e8 ] b4 \toDown | % 106
  \oneVoice \toUp \slashedGrace { a8 } g'4 -.
  \toDown \toUp \voiceTwo \tag #'silent \hideNote fis8 [ dis8 ] a4 \ottava #0 \toDown \break | % 107

  \oneVoice \toUp <g e'>8 ^( [ c8 b8 g8 e8 c8 ) ]
  \toDown | % 108
  \toUp b4 -. \toDown
  \toUp b8 -. [ b8 -. ] b4 -. \toDown | % 109

  \toUp ais8 ^( [ b8 \toDown \toUp e8 g8 ) ] b4 -. \toDown | % 110
  \toUp \ottava #1 c8 ^( ^\prall [ _\< b8 \toDown \toUp ais8 b8 <dis fis>8 b'8 ) ] \toDown <>\! \toUp | % 111
  <d,! f d'!>4 \ottava #0 r4 d4
  \toDown | % 112
  \toUp f8 -> [ _\f <c e>8 f,!8 <c' e>8 f8 e8 ] \toDown
  \toUp \break | % 113

  fis!8 -> [ \tweak text \markup \normal-text \fontsize #0.802 \italic
  "cresc." _\Cresc <cis eis>8 fis,!8 <cis' eis>8 fis8 eis8 ]
  \toDown | % 114
  \toUp g8 -> [ <b, e>8 g8 <b e>8 g'8 <b, e>8 ]
  \toDown | % 115
  \toUp g'8 -> [ <ais, e'>8 g8 <ais e'>8 g'8 <>\!
  <ais, e'>8 ] \toDown \toUp | % 116
  g'8 -> [ _\ff g,8 cis8 e8 g8 g,8 ] \toDown | % 117
  \toUp g'8 -> [ e,8 ais8 cis8 g'8 e,8 ] \toDown \break | % 118

  \toUp cis'8 -> [ cis,!8 g'8 ais8 cis8 cis,8 ]
  \toDown | % 119

  \toUp ais'8 -> [ ais,!8 e'8 g8 -3 ais8 -4 ais,8
  ] \toDown \toUp | % 120
  <b b'>4 b'8 -> [ g8 fis8 e8 ] \toDown | % 121
  \toUp dis8 -4 [ c8 -2 ] b8 -> [ a8 -4 g8 fis8 ]
  \toDown | % 122
  \toUp e4 -. ais'8 -4 [ _\f b8 <c, fis>8 g'8 ]
  \toDown | % 123
  \toUp <b, e>8 [ b'8 ais8 b8 <c, fis>8 g'8 ]
  \toDown \break | % 124

  \toUp <b, e>8 [ b'8 ais8 b8 <c, fis>8 g'8 ]
  \toDown | % 125
  \toUp <b, e>8 [ b'8 ais8 b8 <c, fis>8 g'8 ]
  \toDown | % 126
  \toUp <b, e>4 e,8 _( [ g8 b8 e8 -1 ) ] \toDown \toUp | % 127
  g8 ^( [ b8 e8 -1 \ottava #1
  e'8 b8 g8 ) ] \ottava #0 \toDown | % 128
  \toUp e8 ^( [ b8 g8 e8-\tag #'midiOnly _\Decresc
  b8 g8 ) ] \toDown \pageBreak | % 129

  \toUp \voiceOne
  \once \override Beam.positions = #'(0 . 0)
  e8 ^( [ b8 \toDown g8 e8
  b8 g8 ) ] \toUp <>-\tag #'midiOnly \! \toDown \toUp | % 130
  \oneVoice <> R2. | % 131
  \toDown \toUp | % 131
  <b'' dis fis b>4 _\f _\< r4 r4
  \toDown | % 132
  \toUp <e g b e>4 r4 r4 \toDown \toUp | % 133
  \ottava #1 <b' dis fis b>4 r4 \ottava #0 r4 \toDown \toUp | % 134
  \ottava #1 <e g b e>4 r4 \! \ottava
  #0 r4 \toDown | % 135
  \toUp R2. | % 136
  \toDown \bar "|."

}

accompaniment = \relative c, {
  \clef "bass" \time 3/4 \key e \minor \partial 4 c4\rest | % 1
  <e b'>2. | % 2
  <e b'>2. | % 3
   \oneVoice <e b' g'>2. \arpeggio
   <>  | % 4
  <e b' e g>2. \arpeggio | % 5
  <e b' e g>2. \arpeggio | % 6
  <e b' e g>2. \arpeggio | % 7
  <e ~ b' ~ e ~ g ~>2. \arpeggio | % 8
  <e b' e g>4 r4 r4 | % 9

  dis'4 -.  <fis' a>4 ^( b,4 ) <>  | % 10
  e,4 -.  <e' g>4 ^( b4 ) <>  | % 11
  fis4 -.  <dis' a'>4 ^( b4 ) <>  | % 12
  g4 -.  <e' g>4 ^( b4 ) <>  | % 13
  a4 -.  <e' fis>4 ^( c4 ) <>  | % 14
  b4 -.  \clef "treble" <g' b>4 _( e4 ) <>  | % 15
  \clef "bass" b,4 -.  \clef "treble" <fis'' a>4 _( b,4 ) <>
   | % 16
  <e g>4 r4 r4 | % 17
  \clef "bass" dis,4 -.  <fis' a>4 ^( b,4 ) <>
  | % 18
  e,4 -.  <e' g>4 ^( b4 ) <>  | % 19

  fis4 -.  <dis' a'>4 ^( b4 ) <>  | % 20
  g4 -.  <e' g>4 ^( b4 ) <>  | % 21
  a4 -.  <e' fis>4 ^( c4 ) <>  | % 22
  b4 -.  \clef "treble" <g' b>4 _( e4 ) <>  | % 23
  \clef "bass" b,4 -.  \clef "treble" <fis'' a>4 _( b,4 ) <>
   | % 24
  <e g>4 r4 r4 \repeat volta 2 {
    | % 25
    \clef "bass" e,4 <c' g'>4 e,4 | % 26
    dis4 <b' fis'>4 dis,4 | % 27
    d!4 <bes' f'>4 d,4 | % 28
    cis4 <a' e'>4 cis,4 | % 29

    c!4 <a' e'>4 c,4 | % 30
    b4 <g' e'>4 b,4 | % 31
    b4 <fis' b>4 dis4 | % 32
    e4 e'4 b4 | % 33
    e,,4 -. c''4 ^( g4 ) | % 34
    dis,4 -.  b''4 ^( fis4 ) <>  | % 35
    d,!4 -.  bes''4 ^( f4 ) <>  | % 36
    cis,4 -.  a''4 ^( e4 ) <>  | % 37
    c,!4 -.  a''4 ^( e4 ) <>  | % 38
    b,4 -.  g''4 ^( e4 ) <>  | % 39

    b4 -.  \voiceTwo e'4 ^( dis4 ) <>  | % 40
    \oneVoice <e, e'>4 r4 r4 | % 41
    dis4 -.  <fis' a>4 ^( b,4 ) <>  | % 42
    e,4 -.  <e' g>4 ^( b4 ) <>  | % 43
    fis4 -.  <dis' a'>4 ^( b4 ) <>  | % 44
    g4 -.  <e' g>4 ^( b4 ) <>  | % 45
    a4 -.  <e' fis>4 ^( c4 ) <>  | % 46
    b4 -.  \clef "treble" <g' b>4 _( e4 ) <>  | % 47
    \clef "bass" b,4 -.  \clef "treble" <fis'' a>4 _( b,4 )
    <>  | % 48
    <e g>4 r4 r4 | % 49

    \clef "bass" dis,4 -.  <fis' a>4 ^( b,4 ) <>
    | % 50
    e,4 -.  <e' g>4 ^( b4 ) <>  | % 51
    fis4 -.  <dis' a'>4 ^( b4 ) <>  | % 52
    g4 -.  <e' g>4 ^( b4 ) <>  | % 53
    a4 -.  <e' fis>4 ^( c4 ) <>  | % 54
    b4 -.  \clef "treble" <g' b>4 _( e4 ) <>
    | % 55
    \clef "bass" b,4 -.  \clef "treble" <fis'' a>4 _( b,4 )
    <>  \alternative {
      \volta 1 {
        | % 56
        <e g>4 \clef "bass" e,4 -. r4 }
      \volta 2 {
        | % 57
        \clef "treble" <e' g>4 \clef "bass" e,4 -. r4 }
    }
  }
  \repeat volta 2 {
    | % 58
    \key e \major \grace { s8 } b4 -.  \clef "treble" a''4 _\=2( b,4 \=2)
    <>  | % 59

    \clef "bass" b,4 -.  \clef "treble" a''4 _\=2( b,4 \=2)
    <>  | % 60
    \clef "bass" e,4 -.  \clef "treble" gis'4 _\=2( b,4 \=2)
    <>  | % 61
    gis4 -.  b'4 _( e,4 ) <>  | % 62
    \clef "bass" b,4 -.  \clef "treble" b''4 _\=2( b,4 \=2)
    <>  | % 63
    \clef "bass" b,4 -.  cis'4 ^\=2( b4 \=2) <>  | % 64
    b,4 -.  dis'4 ^( b4 ) <>  | % 65
    e,4 -.  e'4 ^( b4 ) <>  | % 66
    b,4 -.  \clef "treble" a''4 _\=2( b,4 \=2) <>
    | % 67
    \clef "bass" b,4 -.  \clef "treble" a''4 _\=2( b,4 \=2)
    <>  | % 68
    \clef "bass" e,4 -.  \clef "treble" gis'4 _\=2( b,4 \=2)
    <>  | % 69

    gis4 -.  b'4 _( e,4 ) <>  | % 70
    \clef "bass" b,4 -.  \clef "treble" b''4 _\=2( b,4 \=2)
    <>  | % 71
    \clef "bass" b,4 -.  <cis' e>4 ^\=2( b4 \=2) <>
     | % 72
    b,4 -. <dis' fis>4 ^\=2( b4 \=2) \alternative {
      \volta 1 {
        | % 73
        <e, b' e>4 r4 r4 }
      \volta 2 {
        | % 74
        <e b' e>4 r4 r4 }
    }
  }
  \repeat volta 2 {
    | % 75
    fisis,,8 _5 _( [ gis8 bis8 dis8 _1 fisis!8 _5 gis8 ) ] | % 76
    gis'4 r4 cis,,4 | % 77
    fisis,8 _( [ gis8 bis8 dis8 fisis!8 gis8 ) ] | % 78
    gis'2 cis,4 _3 | % 79

    dis4 cisis8 ^( [ dis8 e8 dis8 ) ] | % 80
    dis'4. ^( -> b8 [ gis8 _2 dis8 _3 ) ] | % 81
    dis,4. _1 _( cis8 [ b8 ais8 ] | % 82
    gis4 ) r4 r4 | % 83
    b'4 -.  \clef "treble" a''4 _\=2( b,4 \=2) <>
    | % 84
    \clef "bass" b,4 -.  \clef "treble" a''4 _\=2( b,4 \=2)
    <>  | % 85
    \clef "bass" e,4 -.  \clef "treble" gis'4 _( b,4 ) <>
     | % 86
    gis4 -.  b'4 _( e,4 ) <>  | % 87
    \clef "bass" b,4 -.  \clef "treble" b''4 _\=2( b,4 \=2)
    <>  | % 88
    \clef "bass" b,4 -.  cis'4 ^\=2( b4 \=2) <>  | % 89

    b,4 -.  dis'4 ^( b4 ) <>  | % 90
    e,4 -.  e'4 ^( b4 ) <>  | % 91
    b,8 ^\=2( [  fis'8 a8 b8 a8 fis8 \=2) ] <>
     | % 92
    b,8 ^\=2( [  fis'8 a8 b8 a8 fis8 \=2) ] <>
     | % 93
    b,8 ^( [  e8 gis8 b8 gis8 e8 ) ] <>
    | % 94
    b8 ^( [  e8 gis8 e'8 gis,8 e8 ) ] <>
    | % 95
    b8 ^\=2( [  e8 gis8 b8 gis8 e8 \=2) ] <>
     | % 96
    b8 ^\=2( [  e8 g8 cis8 g8 e8 \=2) ] <>
     | % 97
    b8 ^\=2( [  fis'8 a8 dis8 a8 fis8 \=2) ] <>
     \alternative {
      \volta 1 {
        | % 98
        <e e'>4 r4 r4 }
      \volta 2 {
        | % 99

        <e e'>4 r4 r4 <> \bar "||" % 100
      }
    }
  }
  \key e \minor dis4 -.  \clef "treble" <fis' a>4 _( b,4 ) <>
   | % 101
  \clef "bass" e,4 -.  \clef "treble" <e' g>4 _( b4 ) <>
   | % 102
  \clef "bass" fis4 -.  \clef "treble" <dis' a'>4 _( b4 ) <>
   | % 103
  g4 -.  <e' g>4 _( b4 ) <>  | % 104
  a4 -.  <e' fis>4 _( c4 ) <>  | % 105
  b4 -.  <g' b>4 _( e4 ) <>  | % 106
  \clef "bass" b,4 -.  \clef "treble" <fis'' a>4 _( b,4 ) <>
   | % 107
  <e g>4 r4 r4 | % 108
  \clef "bass" dis,4 -.  \clef "treble" <fis' a>4 _( b,4 ) <>
   | % 109

  \clef "bass" e,4 -.  \clef "treble" <e' g>4 _( b4 ) <>
   | % 110
  \clef "bass" fis4 -.  \clef "treble" <dis' a'>4 _( b4 ) <>
   | % 111
  <gis d'! f d'>4 \arpeggio r4 r4 | % 112
  \clef "bass" <a, a'>4  <c' e f>2 -> <>  | % 113
  <ais, ais'>4  <cis' e fis!>2 -> <>  | % 114
  <b, b'>4  <b' e g>2 -> <>  | % 115
  <c,! c'!>4  <c' e g>2 -> <>  | % 116
  <cis, g' ais e'>2  <e, e'>4 | % 117
  <g g'>2 <ais ais'!>4 | % 118
  <cis cis'>2 <e e'>4 | % 119

  <g g'>4 -> r4 <c,! g' ais e'>4 <>  | % 120
  <b g' b e>4 \arpeggio -.  r4 r4 <>  | % 121
  <b fis' a dis>4 \arpeggio -.  r4 r4 <>  | % 122
  <e g>4 -. r4 <e a dis>4 -. | % 123
  <e g e'>4 -. r4 <e a dis>4 -. | % 124
  <e g e'>4 -. r4 <e a dis>4 -. | % 125
  <e g e'>4 -. r4 <e a dis>4 -. | % 126
  <e g e'>4  r4 <e a dis>4 -. | % 127
  e,4 r4 r4 | % 128
  R2. | % 129

  \tweak Y-offset #-3.0 R2. | % 130
  <e, e'>4 r4 <>  r4 | % 131
  <b'' dis fis b>4 r4 r4 | % 132
  <e, g b e>4 r4 r4 | % 133
  <b dis fis b>4 r4 r4 | % 134
  <e, e'>4 r4 r4 | % 135
  R2. \bar "|."

}

rightSupport = \absolute {
  \clef "treble" \time 3/4 \key e \minor
  \partial 4 s4 | % 1
  s2. | % 2
  s2. | % 3
  s2. | % 4
  s2. | % 5
  s2. | % 6
  s2. | % 7
  s2. | % 8
  s2. | % 9
  s2. | % 10
  s2. | % 11
  s2. | % 12
  s2. | % 13
  \voiceOne s4 a'''2 -4 | % 14
  \voiceOne s4 g'''2 | % 15
  \voiceOne s4 fis'''2 | % 16
  s2. | % 17
  s2. | % 18
  s2. | % 19
  s2. | % 20
  s2. | % 21
  \voiceOne s4 a'''2 | % 22
  \voiceOne s4 g'''2 | % 23
  \voiceOne s4 fis'''2 | % 24
  s2. | % 25
  \repeat volta 2 {
    s2. | % 26
    s2. | % 27
    s2. | % 28
    s2. | % 29
    s2. | % 30
    s2. | % 31
    s2. | % 32
    s2. | % 33
    s2. | % 34
    s2. | % 35
    s2. | % 36
    s2. | % 37
    s2. | % 38
    s2. | % 39
    s2. | % 40
    s2. | % 41
    s2. | % 42
    s2. | % 43
    s2. | % 44
    s2. | % 45
    \voiceOne s4 a'''2 | % 46
    \voiceOne s4 g'''2 | % 47
    \voiceOne s4 fis'''2 | % 48
    s2. | % 49
    s2. | % 50
    s2. | % 51
    s2. | % 52
    s2. | % 53
    \voiceOne s4 a'''2 | % 54
    \voiceOne s4 g'''2 | % 55
    \voiceOne s4 fis'''2 | % 56
    \alternative {
      \volta 1 {
        s2. | % 57
      }
      \volta 2 {
        s2. | % 58
      }
    }
  }
  \repeat volta 2 {
    \grace { s8 } s2. | % 59
    s2. | % 60
    s2. | % 61
    s2. | % 62
    s2. | % 63
    s2. | % 64
    s2. | % 65
    s2. | % 66
    s2. | % 67
    s2. | % 68
    s2. | % 69
    s2. | % 70
    s2. | % 71
    s2. | % 72
    s2. | % 73
    \alternative {
      \volta 1 {
        s2. | % 74
      }
      \volta 2 {
        s2. | % 75
      }
    }
  }
  \repeat volta 2 {
    s2. | % 76
    s2. | % 77
    s2. | % 78
    s2. | % 79
    s2. | % 80
    s2. | % 81
    s2. | % 82
    \voiceTwo s2 \stemUp b4 _( \stemNeutral | % 83
    \voiceTwo <b dis' fis'>2. ) ~ | % 84
    \voiceTwo <b dis' fis'>2. | % 85
    s2. | % 86
    s2. | % 87
    s2. | % 88
    s2. | % 89
    s2. | % 90
    s2. | % 91
    s2. | % 92
    s2. | % 93
    s2. | % 94
    s2. | % 95
    s2. | % 96
    s2. | % 97
    s2. | % 98
    \alternative {
      \volta 1 {
        s2. | % 99
      }
      \volta 2 {
        s2. | % 100
      }
    }
  }
  s2. | % 101
  s2. | % 102
  s2. | % 103
  s2. | % 104
  \voiceOne s4 a'''2 | % 105
  \voiceOne s4 g'''2 | % 106
  \voiceOne s4 fis'''2 | % 107
  s2. | % 108
  s2. | % 109
  s2. | % 110
  s2. | % 111
  s2. | % 112
  s2. | % 113
  s2. | % 114
  s2. | % 115
  s2. | % 116
  s2. | % 117
  s2. | % 118
  s2. | % 119
  s2. | % 120
  s2. | % 121
  s2. | % 122
  s2. | % 123
  s2. | % 124
  s2. | % 125
  s2. | % 126
  s2. | % 127
  s2. | % 128
  s2. | % 129
  s2. | % 130
  s2. | % 131
  s2. | % 132
  s2. | % 133
  s2. | % 134
  s2. | % 135
  s2. | % 136
  \bar "|."
}

leftSupport = \absolute {
  \clef "bass" \time 3/4 \key e \minor
  \partial 4 s4 | % 1
  s2. | % 2
  s2. | % 3
  s2. | % 4
  s2. | % 5
  s2. | % 6
  s2. | % 7
  s2. | % 8
  s2. | % 9
  s2. | % 10
  s2. | % 11
  s2. | % 12
  s2. | % 13
  s2. | % 14
  s2. | % 15
  s2. | % 16
  s2. | % 17
  s2. | % 18
  s2. | % 19
  s2. | % 20
  s2. | % 21
  s2. | % 22
  s2. | % 23
  s2. | % 24
  s2. | % 25
  \repeat volta 2 {
    s2. | % 26
    s2. | % 27
    s2. | % 28
    s2. | % 29
    s2. | % 30
    s2. | % 31
    s2. | % 32
    s2. | % 33
    s2. | % 34
    s2. | % 35
    s2. | % 36
    s2. | % 37
    s2. | % 38
    s2. | % 39
    \voiceOne s4 fis2 | % 40
    s2. | % 41
    s2. | % 42
    s2. | % 43
    s2. | % 44
    s2. | % 45
    s2. | % 46
    s2. | % 47
    s2. | % 48
    s2. | % 49
    s2. | % 50
    s2. | % 51
    s2. | % 52
    s2. | % 53
    s2. | % 54
    s2. | % 55
    s2. | % 56
    \alternative {
      \volta 1 {
        s2. | % 57
      }
      \volta 2 {
        s2. | % 58
      }
    }
  }
  \repeat volta 2 {
    \grace { s8 } s2. | % 59
    s2. | % 60
    s2. | % 61
    s2. | % 62
    s2. | % 63
    s2. | % 64
    s2. | % 65
    s2. | % 66
    s2. | % 67
    s2. | % 68
    s2. | % 69
    s2. | % 70
    s2. | % 71
    s2. | % 72
    s2. | % 73
    \alternative {
      \volta 1 {
        s2. | % 74
      }
      \volta 2 {
        s2. | % 75
      }
    }
  }
  \repeat volta 2 {
    s2. | % 76
    s2. | % 77
    s2. | % 78
    s2. | % 79
    s2. | % 80
    s2. | % 81
    s2. | % 82
    s2. | % 83
    s2. | % 84
    s2. | % 85
    s2. | % 86
    s2. | % 87
    s2. | % 88
    s2. | % 89
    s2. | % 90
    s2. | % 91
    s2. | % 92
    s2. | % 93
    s2. | % 94
    s2. | % 95
    s2. | % 96
    s2. | % 97
    s2. | % 98
    \alternative {
      \volta 1 {
        s2. | % 99
      }
      \volta 2 {
        s2. | % 100
      }
    }
  }
  s2. | % 101
  s2. | % 102
  s2. | % 103
  s2. | % 104
  s2. | % 105
  s2. | % 106
  s2. | % 107
  s2. | % 108
  s2. | % 109
  s2. | % 110
  s2. | % 111
  s2. | % 112
  s2. | % 113
  s2. | % 114
  s2. | % 115
  s2. | % 116
  s2. | % 117
  s2. | % 118
  s2. | % 119
  s2. | % 120
  s2. | % 121
  s2. | % 122
  s2. | % 123
  s2. | % 124
  s2. | % 125
  s2. | % 126
  s2. | % 127
  s2. | % 128
  s2. | % 129
  s2. | % 130
  s2. | % 131
  s2. | % 132
  s2. | % 133
  s2. | % 134
  s2. | % 135
  s2. | % 136
  \bar "|."
}

expressionPrint = {
  \partial 4 s4 | % 1
  s2.*3 | % 2--4
  \override TextSpanner.direction = #DOWN
  \override TextSpanner.style = #'dashed-line
  \override TextSpanner.breakable = ##t
  \override TextSpanner.staff-padding = #3
  \override TextSpanner.padding = #0.5
  \override TextSpanner.font-size = #1
  \override TextSpanner.bound-details.left.text = \markup \normal-text \italic "cresc."
  \override TextSpanner.bound-details.left-broken.text = \markup \normal-text \italic "(cresc.)"
  \override TextSpanner.bound-details.left.attach-dir = #LEFT
  \override TextSpanner.bound-details.left.padding = #0.6
  \override TextSpanner.bound-details.left-broken.padding = #0.6
  \override TextSpanner.bound-details.right.text = ##f
  \override TextSpanner.bound-details.right-broken.text = ##f
  \override TextSpanner.bound-details.right.padding = #0.4
  \override TextSpanner.to-barline = ##t
  s4. s4.\startTextSpan | % 5
  s2. | % 6
  s2. <>\stopTextSpan | % 7
  s2.*18 | % 8--25
  \repeat volta 2 {
    s2.*31 | % 26--56
    \alternative {
      \volta 1 {
        s2. | % 57
      }
      \volta 2 {
        s2. | % 58
      }
    }
  }
  \repeat volta 2 {
    \grace { s8 } s2. | % 59
    s2.*14 | % 60--73
    \alternative {
      \volta 1 {
        s2. | % 74
      }
      \volta 2 {
        s2. | % 75
      }
    }
  }
  \repeat volta 2 {
    s2.*23 | % 76--98
    \alternative {
      \volta 1 {
        s2. | % 99
      }
      \volta 2 {
        s2. | % 100
      }
    }
  }
  s2.*28 | % 101--128
  \override TextSpanner.direction = #DOWN
  \override TextSpanner.style = #'dashed-line
  \override TextSpanner.breakable = ##t
  \override TextSpanner.staff-padding = #3
  \override TextSpanner.padding = #0.5
  \override TextSpanner.font-size = #1
  \override TextSpanner.bound-details.left.text = \markup \normal-text \italic "dim."
  \override TextSpanner.bound-details.left-broken.text = \markup \normal-text \italic "(dim.)"
  \override TextSpanner.bound-details.left.attach-dir = #LEFT
  \override TextSpanner.bound-details.left.padding = #0.6
  \override TextSpanner.bound-details.left-broken.padding = #0.6
  \override TextSpanner.bound-details.right.text = ##f
  \override TextSpanner.bound-details.right-broken.text = ##f
  \override TextSpanner.bound-details.right.padding = #0.4
  \override TextSpanner.to-barline = ##t
  s4. s4.\startTextSpan | % 129
  s2. <>\stopTextSpan | % 130
  s2.*6 | % 131--136
}

pedalPrint = {
  \set Staff.pedalSustainStyle = #'text
  \override Staff.SustainPedal.self-alignment-X = #LEFT
  \override Staff.SustainPedal.parent-alignment-X = #LEFT
  \partial 4 s4 | % 1
  s2.*2 | % 2--3
  s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.46 . 0) s8 \sustainOff | % 4
  s2.*5 | % 5--9
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 10
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 11
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 12
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 13
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 14
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 15
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 16
  s2. | % 17
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 18
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 19
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 20
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 21
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 22
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 23
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 24
  s2. | % 25
  \repeat volta 2 {
    s2.*9 | % 26--34
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 35
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 36
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 37
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 38
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 39
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 40
    s2. | % 41
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 42
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 43
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 44
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 45
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 46
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 47
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 48
    s2. | % 49
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 50
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 51
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 52
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 53
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 54
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 55
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 56
    \alternative {
      \volta 1 {
        s2. | % 57
      }
      \volta 2 {
        s2. | % 58
      }
    }
  }
  \repeat volta 2 {
    \grace { s8 } s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 59
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 60
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 61
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 62
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 63
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 64
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 65
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 66
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 67
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 68
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 69
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 70
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 71
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 72
    s2. | % 73
    \alternative {
      \volta 1 {
        s2. | % 74
      }
      \volta 2 {
        s2. | % 75
      }
    }
  }
  \repeat volta 2 {
    s2.*8 | % 76--83
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 84
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 85
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 86
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 87
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 88
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 89
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 90
    s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 91
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 92
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 93
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 94
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 95
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 96
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 97
    s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s8 \sustainOff | % 98
    \alternative {
      \volta 1 {
        s2. | % 99
      }
      \volta 2 {
        s2. | % 100
      }
    }
  }
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 101
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 102
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 103
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 104
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 105
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 106
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 107
  s2. | % 108
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 109
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 110
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 111
  s2. | % 112
  s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.46 . 0) s8 \sustainOff | % 113
  s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(3.54 . 0) s8 \sustainOff | % 114
  s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(2.63 . 0) s8 \sustainOff | % 115
  s8*5 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(3.08 . 0) s8 \sustainOff | % 116
  s2. \sustainOn | % 117
  s2.*2 | % 118--119
  s2 \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 120
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 121
  s2 \sustainOn \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s4 \sustainOff | % 122
  s2.*4 | % 123--126
  s2. \sustainOn | % 127
  s2.*3 | % 128--130
  s4 \once \override Staff.SustainPedal.extra-offset = #'(1.32 . 0) s2 \sustainOff | % 131
  s2.*5 | % 132--136
}

pedalMidi = {
  \partial 4 s4 | % 1
  s2.*2 | % 2--3
  s2. \sustainOn <> \sustainOff | % 4
  s2.*5 | % 5--9
  s2. \sustainOn <> \sustainOff | % 10
  s2. \sustainOn <> \sustainOff | % 11
  s2. \sustainOn <> \sustainOff | % 12
  s2. \sustainOn <> \sustainOff | % 13
  s2. \sustainOn <> \sustainOff | % 14
  s2. \sustainOn <> \sustainOff | % 15
  s2. \sustainOn <> \sustainOff | % 16
  s2. | % 17
  s2. \sustainOn <> \sustainOff | % 18
  s2. \sustainOn <> \sustainOff | % 19
  s2. \sustainOn <> \sustainOff | % 20
  s2. \sustainOn <> \sustainOff | % 21
  s2. \sustainOn <> \sustainOff | % 22
  s2. \sustainOn <> \sustainOff | % 23
  s2. \sustainOn <> \sustainOff | % 24
  s2. | % 25
  \repeat volta 2 {
    s2.*9 | % 26--34
    s2. \sustainOn <> \sustainOff | % 35
    s2. \sustainOn <> \sustainOff | % 36
    s2. \sustainOn <> \sustainOff | % 37
    s2. \sustainOn <> \sustainOff | % 38
    s2. \sustainOn <> \sustainOff | % 39
    s2. \sustainOn <> \sustainOff | % 40
    s2. | % 41
    s2. \sustainOn <> \sustainOff | % 42
    s2. \sustainOn <> \sustainOff | % 43
    s2. \sustainOn <> \sustainOff | % 44
    s2. \sustainOn <> \sustainOff | % 45
    s2. \sustainOn <> \sustainOff | % 46
    s2. \sustainOn <> \sustainOff | % 47
    s2. \sustainOn <> \sustainOff | % 48
    s2. | % 49
    s2. \sustainOn <> \sustainOff | % 50
    s2. \sustainOn <> \sustainOff | % 51
    s2. \sustainOn <> \sustainOff | % 52
    s2. \sustainOn <> \sustainOff | % 53
    s2. \sustainOn <> \sustainOff | % 54
    s2. \sustainOn <> \sustainOff | % 55
    s2. \sustainOn <> \sustainOff | % 56
    \alternative {
      \volta 1 {
        s2. | % 57
      }
      \volta 2 {
        s2. | % 58
      }
    }
  }
  \repeat volta 2 {
    \grace { s8 } s2. \sustainOn <> \sustainOff | % 59
    s2. \sustainOn <> \sustainOff | % 60
    s2. \sustainOn <> \sustainOff | % 61
    s2. \sustainOn <> \sustainOff | % 62
    s2. \sustainOn <> \sustainOff | % 63
    s2. \sustainOn <> \sustainOff | % 64
    s2. \sustainOn <> \sustainOff | % 65
    s2. \sustainOn <> \sustainOff | % 66
    s2. \sustainOn <> \sustainOff | % 67
    s2. \sustainOn <> \sustainOff | % 68
    s2. \sustainOn <> \sustainOff | % 69
    s2. \sustainOn <> \sustainOff | % 70
    s2. \sustainOn <> \sustainOff | % 71
    s2. \sustainOn <> \sustainOff | % 72
    s2. | % 73
    \alternative {
      \volta 1 {
        s2. | % 74
      }
      \volta 2 {
        s2. | % 75
      }
    }
  }
  \repeat volta 2 {
    s2.*8 | % 76--83
    s2. \sustainOn <> \sustainOff | % 84
    s2. \sustainOn <> \sustainOff | % 85
    s2. \sustainOn <> \sustainOff | % 86
    s2. \sustainOn <> \sustainOff | % 87
    s2. \sustainOn <> \sustainOff | % 88
    s2. \sustainOn <> \sustainOff | % 89
    s2. \sustainOn <> \sustainOff | % 90
    s2. \sustainOn <> \sustainOff | % 91
    s2. \sustainOn <> \sustainOff | % 92
    s2. \sustainOn <> \sustainOff | % 93
    s2. \sustainOn <> \sustainOff | % 94
    s2. \sustainOn <> \sustainOff | % 95
    s2. \sustainOn <> \sustainOff | % 96
    s2. \sustainOn <> \sustainOff | % 97
    s2. \sustainOn <> \sustainOff | % 98
    \alternative {
      \volta 1 {
        s2. | % 99
      }
      \volta 2 {
        s2. | % 100
      }
    }
  }
  s2. \sustainOn <> \sustainOff | % 101
  s2. \sustainOn <> \sustainOff | % 102
  s2. \sustainOn <> \sustainOff | % 103
  s2. \sustainOn <> \sustainOff | % 104
  s2. \sustainOn <> \sustainOff | % 105
  s2. \sustainOn <> \sustainOff | % 106
  s2. \sustainOn <> \sustainOff | % 107
  s2. | % 108
  s2. \sustainOn <> \sustainOff | % 109
  s2. \sustainOn <> \sustainOff | % 110
  s2. \sustainOn <> \sustainOff | % 111
  s2. | % 112
  s2. \sustainOn <> \sustainOff | % 113
  s2. \sustainOn <> \sustainOff | % 114
  s2. \sustainOn <> \sustainOff | % 115
  s2. \sustainOn <> \sustainOff | % 116
  s2. \sustainOn | % 117
  s2.*2 | % 118--119
  s2. <> \sustainOff | % 120
  s2. \sustainOn <> \sustainOff | % 121
  s2. \sustainOn <> \sustainOff | % 122
  s2.*4 | % 123--126
  s2. \sustainOn | % 127
  s2.*3 | % 128--130
  s4 s2 \sustainOff | % 131
  s2.*5 | % 132--136
}

pianoMusic = \new PianoStaff <<
  \new Staff = "up" <<
    \mergeDifferentlyDottedOn
    \mergeDifferentlyHeadedOn
    \new Voice = "rightSupport" { \voiceOne \rightSupport }
    \tag #'printOnly \new Voice = "expressionPrint" { \expressionPrint }
  >>
  \new Staff = "down" <<
    \mergeDifferentlyDottedOn
    \mergeDifferentlyHeadedOn
    \new Voice = "melody" { \voiceOne \melody }
    \new Voice = "accompaniment" { \voiceTwo \accompaniment }
    \new Voice = "leftSupport" { \voiceThree \leftSupport }
    \tag #'printOnly \new Voice = "pedalPrint" { \pedalPrint }
    \tag #'midiOnly \new Voice = "pedalMidi" { \pedalMidi }
  >>
>>

\score {
  \removeWithTag #'midiOnly
  \pianoMusic
  \layout { }
}

\score {
  \unfoldRepeats
  \removeWithTag #'printOnly
  \replaceWithTag #'silent { s8 }
  \pianoMusic
  \midi {
    \tempo 4 = 240
    \context {
      \Staff
      midiInstrument = "acoustic grand"
    }
    \context {
      \Score
      midiChannelMapping = #'instrument
    }
  }
}

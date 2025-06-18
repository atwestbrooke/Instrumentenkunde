\language deutsch

\header {
  tagline = ""
}
\layout {
 \context {
   \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
    \override SpacingSpanner.shortest-duration-space = 5
 }
}

\score {
  \new StaffGroup <<
    
    \new Staff \with {instrumentName="Piccolofl."} {
    \once \hide Staff.TimeSignature
    \set StaffGroup.ottavationMarkups = #ottavation-ordinals
    \override TextScript.staff-padding = #8
    d'1*7/8^\markup{\bold Notation} \glissando a'''1*1/8 \bar "||" s32  d''1*29/32^\markup{\bold Klang} \glissando \ottava #1 a''''1*1/16 \bar "" }

    \new Staff \with {instrumentName="gr. Fl."}  {
    \once \hide Staff.TimeSignature
    h1*7/8  \glissando d''''1*1/8 \bar "||" s32 h1*29/32 \glissando d''''1*1/16 \bar "" }

    \new Staff \with {instrumentName="Altfl."} {
    \once \hide Staff.TimeSignature
    c'1*7/8 \glissando c''''1*1/8 \bar "||" \transpose c g, { s32 c'1*29/32 \glissando c''''1*1/16 \bar "" } }

    \new Staff \with {instrumentName="Baßfl."} {
    \once \hide Staff.TimeSignature
    c'1*7/8 \glissando a'''1*1/8 \bar "||" \transpose c c, { s32 \clef "bass"  c'1*29/32 \glissando \clef "treble" a'''1*1/16 \bar "" } }

    \new Staff \with {instrumentName="Kb-Fl."} {
    \once \hide Staff.TimeSignature
    c'1*7/8 \glissando a'''1*1/8 \bar "||" \transpose c c,, { s32 \clef "bass"  c'1*29/32 \glissando a'''1*1/16 \bar "" } }
  
  >>
}

\version "2.22.0"
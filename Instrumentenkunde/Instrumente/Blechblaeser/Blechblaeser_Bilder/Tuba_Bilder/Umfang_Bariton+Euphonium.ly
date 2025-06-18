\language deutsch

\header {
  tagline = ""
}
\score {
  \relative c, { 
    \set Staff.ottavationMarkups = #ottavation-ordinals 
    \clef "bass"
    \hide Staff.TimeSignature
    \hide Stem  e,4 \ottava #0 h'1*3/4\glissando \bar "" s1 \bar "" \clef "treble" b'''1*1/4 e4*3 \bar ""
  }
} 
  \version "2.23.82"
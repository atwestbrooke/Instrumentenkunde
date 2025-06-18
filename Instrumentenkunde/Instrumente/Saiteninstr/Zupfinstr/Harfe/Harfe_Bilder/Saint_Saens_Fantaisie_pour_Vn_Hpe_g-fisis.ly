\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 7.5 in) (* 3.8 in))) paper-alist))
\paper {
#(set-paper-size "dynamic")
#(define top-margin (* 4))
#(define bottom-margin (* 2))
#(define left-margin (* 5))
#(define right-margin (* 5))
	tagline = ##f
} 

\layout {
 indent = 0\cm
 \context {
  \Score
   \remove "Bar_number_engraver" 
    \remove "Time_signature_engraver" }
 \context {
  \Staff
   \remove "Time_signature_engraver" }
}

rhmusik = {
	\time 5/4
	 \key d \major
	  \clef "treble"
	   << 
		 { \autoBeamOff fis8 a d fis e d cis h a g | \repeat unfold 4 { fis8 } \once \override Accidental.color = #red \once \override NoteHead.color = #red g \repeat unfold 5 { g } }
		 \\
		 { fis32[ fis, a d] a'[ a, d fis] d'[ d, fis a] fis'[ fis, a d] e[ e, a cis] d[ d, fis a] cis[ cis, e a] h[ h, d fis] a[ a, cis e] g[ g, cis e] | { fis[ fis, \once \override Accidental.color = #(x11-color 'SeaGreen) \once \override NoteHead.color = #(x11-color 'SeaGreen) ais d] } { fis[ fis, ais d] } { fis[ fis, ais \once \override Accidental.color = #(x11-color 'SeaGreen) \once \override NoteHead.color = #(x11-color 'SeaGreen) \once \override NoteHead.color = #(x11-color 'SeaGreen) dis] } { fis[ fis, ais dis] } \override Accidental.color = #red \override NoteHead.color = #red g[ g, ais dis ] \override Accidental.color = #black \override NoteHead.color = #black \repeat unfold 5 { g[ g, ais dis ] } } >> | 

        }

lhmusik = {
	\time 5/4
	 \key d \major
	  \clef "bass"
	   <a a,>8 \clef "treble" d' fis a g fis e d cis r | r4 r8 ais \override Accidental.color = #red \override NoteHead.color = #red dis g, ais dis, g ais, | 

        }

\score {
		\new PianoStaff <<
		 \new Staff = "up" 
		  \relative fis'' {
		  \rhmusik 
		  } 
		 \new Staff = "down" 
		  \relative a {
		  \lhmusik
		  } >>
	    }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

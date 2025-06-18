\language "deutsch"
#(set! paper-alist (cons '("dynamic" . (cons (* 7.5 in) (* 5 in))) paper-alist))
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
   \remove "Bar_number_engraver" }
 \context {
  \Staff
   \remove "Time_signature_engraver" }
}

global = {
		   \time 4/4
	 	   \key f \major
		   \tempo "Poco a poco più animato"
}
	   
vnmusik = {
       \clef "treble"
	   f4. e8 f2~| f d | e4 f8 g a2~ | a( g) | f4 r8 d' f2~ | \repeat unfold 2 { f4 e8 d } | dis( e) f e a2~ | a( g)\bar "||"

}

rhmusik = {
	  \clef "treble"
	   \repeat unfold 2 { \repeat unfold 2 { r8 <d f a> r <d f b> r <d f a> r <d f gis> } \repeat unfold 2 { r8 <cis e a> r <cis e b'> r <cis e a> r <cis e gis> } } \bar "||"

}

lhmusik = {
	  \clef "bass"
	   \repeat unfold 8 { a4 \open b \open a \open gis \open } \bar "||"

}

\score {
        \new GrandStaff <<
        \new Staff {
		 \global
		  \relative f''
		   \vnmusik }

		\new PianoStaff <<
		 \new Staff = "up" 
		  {
		   \global
 	        \relative d' 
		     \rhmusik 
		  } 
		 \new Staff = "down" 
		  {
		   \global
		    \relative a
		     \lhmusik
		  } >>
        >>
		
	    } 

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

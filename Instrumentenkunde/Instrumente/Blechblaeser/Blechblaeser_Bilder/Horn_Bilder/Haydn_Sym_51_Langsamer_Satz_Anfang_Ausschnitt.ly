\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 13.5 in) (* 4.5
 in))) paper-alist))

\paper { tagline = ##f
#(set-paper-size "mein Format")
system-system-spacing.basic-distance = #30
system-separator-markup = \bigSeparator 
}

\layout {
 \context {
  \Score
   \remove "Bar_number_engraver"
	}
}
global = {
	\tempo "Adagio"
	  \time 2/4
}

continuo = { es4-.\pp r | d-. r | es8-. r c-. as-. | b-. b'-. b as-. | g4-. r | f8 r b, r | es r b r | es4-. r | es-. r | d-. r | c8 r f, r | b4 r \bar "" }

CornoI = \relative c'' {
\set Staff.instrumentName = "I "
 \clef "treble"
  \transposition es
   \key c \major
	c2 | d | e4 f32 g f g a16 f | e4( d8) r8 | g4. c8 | c h32( c d                e) f8-. r16 d, | e8. g16 g( f e d) | c4 r4 | R2*4 \bar "" 
}

CornoII = \relative c, {
\set Staff.instrumentName = "II "
 \clef "treble"
  \transposition es
   \key c \major
	R2*8 | \clef "bass" c2 | h | a | g \bar "" 
}
VioliniI = \relative g {
\set Staff.instrumentName = "Violini I "
 \clef "treble"
  \key es \major
   r8^\markup "con sord." g\p-. b-. es-. | r8 b-. f'-. as-. | r8 g-. as-. c16( as) | g4( f8) r | r8 b,-. es-. g-. | r8 as,-. d-. as'-. | r8 g16( b) b( as g f) | es8-. g,-. b-. es-. | r8 b-. es-. g-. | r8 b,-. f' b-. | r8 es,-. a-. es'-. | r8 d,-. f-. d'-. \bar ""
  } 

VioliniII = \relative g {
\set Staff.instrumentName = "Violini II "
 \clef "treble"
  \key es \major
   r8^\markup { con sord. } g\p-. b-. es-. | r8 b-. d-. f-. | r8 es-. es-. as16( f) | es4( d8) r | r8 b-. g'-. es-. | r8 b-. f'-. d-. | r8 b16( g') g( f es d) | es8-. g,-. b-. es-. | r8 b-. g'-. es-. | r8 b-. f' d-. | r8 c-. es-. a,-. | r8 b-. d-. f-. \bar ""
  }

Viole = \relative es' {
\set Staff.instrumentName = "Viole " 
 \clef "alto"
  \key es \major
  \continuo
  } 

Bassi = \relative es {
\set Staff.instrumentName = \markup {
			\center-column { "Basso" }
			\line { "continuo" }
			} 
 \clef "bass"
  \key es \major
   \continuo
}

\score {
   \new GrandStaff \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #14 }

  <<
	\new StaffGroup \with { instrumentName = \markup {
			\center-column {
				\line { "Corni" }
				\line { \concat { "in Mi" \super { \flat } " / Es" } }
			    }
		      }
		  }
	\with {
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
	<<		    
	\new Staff = "CornoI" \with {
\override InstrumentName.self-alignment-X = #RIGHT } {
		 \global
		  \CornoI
		}

	\new Staff  = "CornoII" \with {
\override InstrumentName.self-alignment-X = #RIGHT } {
		 \global
		  \CornoII
		}
	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
		\new GrandStaff 
		<<
    	\new Staff = "VioliniI" {
		 \global
		  \VioliniI
		}

    	\new Staff = "VioliniII" {
		 \global
		  \VioliniII
		}
		>>
	 
	\new Staff = "Viole" {
		 \global
		  \Viole
		}
	 
	\new Staff = "Bassi" {
		 \global
		  \Bassi
		}
  >>
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions




\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 19 in) (* 8.5
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
	\tempo "Andante con moto"
	  \time 2/2
}

Bass = \relative as, { as2(\pp g | f2. des4) | es1( | as) | b2( as | fis e) | dis1( | cis2 h' | e,2.) r4 | }

Floete = \relative c'' {
\set Staff.instrumentName = "2 gr. Fl."
 \clef "treble"
   \key as \major
	R1 | <c as>2\pp r | R1 | <c as>2 r | R1 | <cis a!>2 r | R1 | 
	<<
	{ cis2( dis | gis) }  
	\\
	{ a,2( h | e) }
	>>
	r2
    \bar "" 
}

BClar = \relative d' {
\set Staff.instrumentName = "2 B-Clar."
 \clef "treble"
  \transposition b
   \key b \major
	<d b> 4 r4 r2 | R1*8 \bar "" 
}

Bassethorn = \relative b {
\set Staff.instrumentName = "Basseth."
 \clef "treble" 
  \transposition f
   \key es \major
	b4 r r2 | R1*8 \bar "" 
}

BassClar = \relative c'' {
\set Staff.instrumentName = "Baßclar. (B)"
 \clef "bass"
  \transposition b
   \key b \major
	\transpose as ges \relative { \Bass } \bar "" 
}

Horn = \relative g' {
\set Staff.instrumentName = "Horn in F"
 \clef "treble"
  \transposition f
   \key c \major
	g2--_\markup { \concat { \dynamic { pp } \italic { " espr." } } } g-- | g2.( c4 | es,4.) es8~( es g4 f8 | b2~ b8 c d es) | as,2-- as-- | as2. gis4( | cis fis,~ fis8) e'( dis cis | h ais gis fis e4. fis8 | dis2.) es4 \bar "" 
}

ViolinI = \relative c' {
\set Staff.instrumentName = "I. Viol."
 \clef "treble"
  \key as \major
   c2~(\pp c8 es c' r | c,2~ c8 f des') r | as,2~( as8 c g') r | c,4.( es8 c') r r4 | des,2~( des8 f des') r | cis,2~( cis8 fis cis') r | h,2~( h8 fis' h) r | a,2~( a8 h a') r | gis,2~( gis8 h gis') r \bar ""
  } 

ViolinII = \relative as {
\set Staff.instrumentName = "II. Viol."
 \clef "treble"
  \key as \major
   as2~(\pp as8 es' as r | as,2~ as8 f' as) r | as,2~( as8 c es) r | as,4.( es'8 as) r r4 | b,2~( b8 f' b) r | a,2~( a8 fis' a) r | a,2~( a8 h dis) r | a2~( a8 dis fis) r | gis,2~( gis8 h e) r \bar ""
  }

Bratsche = \relative c' {
\set Staff.instrumentName = "Br." 
 \clef "alto"
  \key as \major
  <c as>8\pp( es, es'4 <c as>2~| <c as>8 f, f'4) <c as>4( <f as,>8 <des f,> | <as c,>2. <g es>4 | <as c,> <c es,> <es as,>2) | <des b>8( f, f'4 <des b>2~| <cis a>8 fis, fis'4 <cis a>2) |
	<<
	  { \voiceOne h4( fis' h,2 }
	  \new Voice { \voiceTwo dis,8 fis a fis dis2 }
	>>
   \oneVoice <cis' e,>8 a e a <dis h> fis, dis fis | <h e,>2~ <h e,>8) r r4 \bar ""
  } 

Celli = \relative c' {
\set Staff.instrumentName = "Celli"
 \clef "bass"
  \key as \major
   <c as>8(\pp es, as, es' <c' as> es, as, es' | <c' as> f, c f <c' as> f, <as des,>4) | <as c,>8( es c es <as c,> <c es,> g <b des,> | <c c,> es, c es <c' as>2) | <des b>8( f, b, f' <des' b>8 f, b, f' | <cis' ais> fis, cis fis  <cis' ais> fis, c fis) | <h a>( fis h, fis' <h a> fis h, fis' | <a e>4 a,8 e' <a fis> dis, h dis | <gis e> h, e, h' <gis' e>) r r4 |
}

Contrabass = \relative as, {
\set Staff.instrumentName =  "Ctrb." 
 \clef "bass"
  \key as \major
   \Bass \bar ""
}

\score {
   \new GrandStaff \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #16 }

  <<
	\new StaffGroup \with {
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #16 }
	<<		    
	\new Staff = "Floete" {
		 \global
		  \Floete
		}
		    
	\new Staff = "BClar" {
		 \global
		  \BClar
		}
		    
	\new Staff = "Basseth." {
		 \global
		  \Bassethorn
		}
		    
	\new Staff = "BassClar" {
		 \global
		  \BassClar
		}

	>>
	\new StaffGroup \with {
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #14 }
	<<		    
	\new Staff = "Horn" {
		 \global
		  \Horn
		}

	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
		\new GrandStaff 
		<<
    	\new Staff = "ViolinI" {
		 \global
		  \ViolinI
		}

    	\new Staff = "ViolinII" {
		 \global
		  \ViolinII
		}
		>>
	 
	\new Staff = "Bratsche" {
		 \global
		  \Bratsche
		}
	 
	\new Staff = "Celli" {
		 \global
		  \Celli
		}
	 
	\new Staff = "Ctrb" {
		 \global
		  \Contrabass
		}
  >>
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions




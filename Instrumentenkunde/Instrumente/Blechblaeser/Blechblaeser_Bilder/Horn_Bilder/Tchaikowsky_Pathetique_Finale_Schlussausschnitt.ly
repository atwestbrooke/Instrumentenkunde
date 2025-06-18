\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 20 in) (* 8
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
 \context {
  \Staff
   \remove "Time_signature_engraver" 
	}

}
global = {
	\tempo "Andante ma non tanto" 4 = 60
	  \time 3/4
}

violinsnippet = { fis4--\ff\downbow e8-- d-- cis8.(--\> h16)-- }

Hornmusic = \relative cis'' {
 \clef "treble"
  \transposition f
   \key a \minor
	R2. | << { r4 cis2~^\mf^\> | cis4~ cis8\! r8 r4 | r4 cis2~^\mf^\> | cis4^\p h2~| h4 a2~^\> | a4^\pp gis2~| gis4 fis4..^\< e16 | e4^\f d8-- r8 r4 | R2.*4 }
		\\
			  { R2.*7 | r4 r8 cis8[\f-- h8.-- a16]-- | a2\cresc gis8. g16 | g2 g8.\ff fis16 | fis4.. eis16 eis4~| eis2~\> eis8\mf r8 }
	        >>
 \bar "" 
}

Fag = \relative e, {
\set Staff.instrumentName = "Fag. 1. 2."
 \clef "bass"
  \key h \minor
   R2.*10 | e2.~\ff^\markup "a2" | e2.~| e2~\> e8\mf r|  \bar ""
}

ViolinI = \relative fis'' {
\set Staff.instrumentName = "Viol. I "
 \clef "treble"
  \key h \minor
   \violinsnippet | cis2~\f\> cis8\! r | \violinsnippet | d8(\f-> cis8~ cis4~ cis8)\! r | g4.(\p\downbow g8[)-- g8.(-- a16]) | fis2~fis8 r | e4.(\pp\downbow e8[)-- e8.(-- fis16])-- | d2~\< d8 r | d2\mf\upbow\cresc e4(\downbow | fis2.) | fis4(\f\< e2) | cis'2.~\ff | cis2~\> cis8\mf r \bar ""
  } 

ViolinII = \relative h' {
\set Staff.instrumentName = "Viol. II "
 \clef "treble"
  \key h \minor
   \repeat unfold 2 { h4--\ff\downbow ais8-- gis-- eis8.(--\> eis16)-- | e!2~\f\> e8\! r | } h4.(\p\downbow h8[)-- h8.(-- a16]) | a2~a8 r | R2.*2 | h2\mf\cresc\downbow h4(~ | h ais2)\downbow\! | g'2.~\f\<| g4\! fis2~\ff | fis2~\> fis8\mf r \bar ""
  }

Viola = \relative gis' {
\set Staff.instrumentName = "Vla. " 
 \clef "alto"
  \key h \minor
  \repeat unfold 2 { gis4--\ff\downbow fis8-- eis8-- h8.(--\> h16)-- | ais2~\f\> ais8\! r | } g4.(\p\downbow g8[)-- g8.(-- g16]) | fis2~fis8 r | e4.(\pp\downbow e8[)-- e8.(-- e16])-- | fis2~\< fis8 r | d2\mf\upbow\cresc e4(\downbow | fis2.) | g'~\f\<| g4\! fis2~\ff | fis2~\> fis8\mf r
  } 

Cello = \relative d' {
\set Staff.instrumentName = "Vc."
 \clef "bass"
  \key h \minor
   \repeat unfold 2 { d4--\ff\downbow cis8-- h-- gis8.(--\> g16)-- | fis2~\f\> fis8\! r | } d4.(\p\downbow d8[)-- d8.(-- cis16]) | d2~ d8 r | <h g'>4.(\pp\downbow <h g'>8[)-- <h g'>8.(-- <ais fis'>16])-- | <h d>2~\< <h d>8\> r | g2.\mf\cresc\upbow | fis2.\downbow\! | fis4(\f\< e2) | cis'2.~\ff | cis2~\> cis8\mf r  \bar ""
}

Bass = \relative d {
\set Staff.instrumentName = "Kb." 
 \clef "bass"
  \key h \minor
   R2.*4 | d4.(\p\downbow d8[)-- d8.(-- cis16]) | d2~d8 r | h4.(\pp\downbow h8[)-- h8.(-- ais16])-- | h2~\< h8\> r | g2.\mf\cresc\upbow | fis2.\downbow\! | e2.\f\< | e''2.~\ff | e2~\> e8\mf r  \bar "" 
}

\score {
   \new GrandStaff \with { 
\override StaffGrouper.staff-staff-spacing.basic-distance = #14 }

  <<

   	\new Staff = "Fagott" {
	 \global
	  \Fag
		}
	\new StaffGroup \with { instrumentName = "Hrn." }
	\with {
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
	<<		    
	\new Staff = "HornI+II" \with { instrumentName = "1. 2. in F" } {
		 \global
		  \Hornmusic
		}

	\new Staff  = "CornoII" \with { instrumentName = "3. 4. in F" } {
		 \global
		  \Hornmusic
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
	 
	\new Staff = "Viola" {
		 \global
		  \Viola
		}
	 
	\new Staff = "Cello" {
		 \global
		  \Cello
		}
	 
	\new Staff = "Bass" {
		 \global
		  \Bass
		}
  >>
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions




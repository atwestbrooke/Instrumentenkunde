\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 21 in) (* 15
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
   subdivideBeams = ##t
   baseMoment = #(ly:make-moment 1/8)
   \remove "Time_signature_engraver" 
	}

}
global = {
	\tempo "Andante" 4 = 80
	  \time 3/4
}

%  Violine 1 separat
Soprana = \relative fis' { \tuplet 3/2 { fis16( gis ais } h32 cis d e) | }
SopranaI = \relative fis' { \tuplet 3/2 { fis16(\upbow gis ais } h32 cis d e) | }
Sopranb = \relative fis'' { fis4-> e8-- d-- cis(-- h)-- | d(-> cis--) r4 }

Sopranc = \relative h { \tuplet 3/2 {h16( cis d } e32 fis g a) | }
Soprand = \relative h' { h4-> a8-- g-- fis(-- e)-- | g[(-> fis])-- r4 }

%  Violine 2 separat
Alta = \relative cis' { \tuplet 3/2 { cis16( d e } f32 fis gis ais) | }
AltaI = \relative cis' { \tuplet 3/2 { cis16(\upbow d e } f32 fis gis ais) | }
Altb = \relative h' { h4-> ais8-- gis-- fis(-- eis)-- | e4-> r4 }

Altc = \relative fis { \tuplet 3/2 { fis16( g gis } ais32 h cis dis) | }
AltcI = \relative h { \tuplet 3/2 { h16( g gis } ais32 h cis dis) | }
Altd = \relative e' { e4-> dis8-- cis-- h(-- ais)-- | cis4-> r4 }

%  Viola separat
Tena = \relative ais { \tuplet 3/2 { ais16( h cis } d32 e f g) | }
TenaI = \relative ais { \tuplet 3/2 { ais16(\upbow h cis } d32 e f g) | }
%  Viola separat
Tenb = \relative gis' { gis4-> fis8-- eis-- e(-- d)-- | fis,4-> r4 }
TenbI = \relative gis' { gis4-> fis8-- eis-- e(-- d)-- | <gis, fis'>4-> r4 }

Tenc = \relative d { \tuplet 3/2 { d16( e f } g32 as b c) | }
TencI = \relative fis { \tuplet 3/2 { fis16( e f } g32 as b c) | }
Tend = \relative cis' { cis!4-> c8-- ais-- gis(-- g)-- | e4-> r4 }

%  Cello separat
Bassa = \relative e { \tuplet 3/2 { e16( eis fis } gis32 ais h cis) | }
BassaI = \relative e { \tuplet 3/2 { e16(\upbow eis fis } gis32 ais h cis) }
Bassb = \relative d' { d4-> cis8-- h-- ais(-- gis)-- | fis4-> r4 }
% Fag.
BassbI = \relative d' { d4-> cis8-- h-- ais(-- gis)-- | ais4-> r4 }

Bassc = \relative gis, { \tuplet 3/2 {gis16( ais h } cis32 d e fis) | }
Bassd = \relative g { g4-> fis8-- e-- d(-- cis)-- | h[(-> ais])-- r4 }


HornmusicI = \relative fis' {
 \clef "treble"
  \transposition f
   \key a \minor
	fis8 r8 r4 r4 | R2. | cis'8~\ff-> cis16 r16 r4 r4 | R2. | cis8~-> cis16 \clef "bass" r16 r4 r4 | R2. | gis,,8~ gis16 r16 r4 r4 | R2. | gis8~ gis16 r16 <<
{ r4 r4 }
\\
{ \once \hideNotes cis2 }
>>
\bar "" 
}


HornmusicII = \relative fis {
 \clef "treble"
  \transposition f
   \key a \minor
	fis8 r cis'2~-\markup { \dynamic "ff" \italic "gestopft" } | cis2.~ | cis4 cis2~ | cis2.~ | cis4 \clef "bass" \repeat unfold 2 { cis,,2~ | cis2.~ | cis4 } \stemDown { cis2 }\bar "" 
}

FluteAll = \relative fis' {
 \set Staff.instrumentName = "Fl. 1. 2. 3."
  \clef "treble"
   \key h \minor
    fis8 r r4 s4*0\fff \repeat unfold 2 { \Soprana \Sopranb } r4 | R2.*4
}

OboeAll = \relative h {
 \set Staff.instrumentName = "Ob. 1. 2."
  \clef "treble"
   \key h \minor
    <h d>8 r r4 s4*0\fff \repeat unfold 2 { \Alta \Altb } r4 | R2.*4
}

AClarAll = \relative a {
 \set Staff.instrumentName = \markup {
							   \center-column {
								\line { Cl. 1. 2. }
								\line { in A }
							   }
							  }
 \clef "treble"
  \transposition a
   \key d \minor
    a8 r r4 s4*0\fff \transpose ais cis' { \relative { \repeat unfold 2 { \Tena \Tenb }
	 << { \repeat unfold 2 { \Sopranc \Soprand } }
	  \\
	    { \repeat unfold 2 { \Altc \Altd } }
	 >>
r4 \bar "" } }
}

FagAll = \relative fis, {
\set Staff.instrumentName = "Fag. 1. 2."
 \clef "bass"
  \key h \minor
	fis8 r8 r4 s4*0\fff  \repeat unfold 2 { \Bassa \BassbI } 
	<< { \repeat unfold 2 { \Tenc \Tend } }
	 \\
	   { \repeat unfold 2 { \Bassc \Bassd } }
	>>
 r4 \bar ""
}

ATptAll = \relative f' {
 \set Staff.instrumentName = \markup {
							   \center-column {
								\line { Tpt. 1. 2. }
								\line { in A }
							    }
							  }
 \clef "treble"
  \transposition a
   \key d \minor
	<f a>8 r r4 r4 | R2.*8 \bar ""
}

PosAT = \relative d {
 \set Staff.instrumentName = "A. T."
  \clef "tenor"
   \key h \minor
	<d fis>8 r r4 r4| R2.*8 \bar ""
}

PosB = \relative fis, {
  \clef "bass"
   \key h \minor
	fis2.~\> | fis~\mf | fis~ | fis~ | fis~\> | fis8\p r r4 r4 | R2.*3 \bar ""
}

Timp = \relative fis, {
 \set Staff.instrumentName = "Pk."
  \clef "bass"
   \key h \minor
	fis2.:32\> | fis:32\mf | fis:32 | fis:32 | fis:32 | fis:32_\markup { \italic "sempre" \dynamic "mf" } | \repeat unfold 2 {  fis:32 | }  fis:32\dim \bar "" fis2.*0\! 
}

ViolinI = \relative fis' {
\set Staff.instrumentName = "Viol. I "
 \clef "treble"
  \key h \minor
   fis8 r r4 s4*0\fff \repeat unfold 2 { \SopranaI \Sopranb } \repeat unfold 2 { \Sopranc \Soprand } r4 \bar ""
  } 

ViolinII = \relative h {
\set Staff.instrumentName = "Viol. II "
 \clef "treble"
  \key h \minor
   h8 r r4 s4*0\fff \repeat unfold 2 { \AltaI \Altb } \repeat unfold 2 { \AltcI \Altd } r4 \bar ""
  }

Viola = \relative fis {
\set Staff.instrumentName = "Vla. " 
 \clef "alto"
  \key h \minor
   fis8 r r4 s4*0\fff \repeat unfold 2 { \TenaI \TenbI } \repeat unfold 2 { 
	<< { \TencI }
	\\ 
	   { \Tenc }
	>>
	\Tend
	}
r4  \bar ""
  } 

Cello = \relative h, {
\set Staff.instrumentName = "Vc."
 \clef "bass"
  \key h \minor
   fis8 r r4 s4*0\fff \BassaI \Bassb \Bassa \Bassb \repeat unfold 2 { \Bassc \Bassd } r4 \bar ""
}

Bass = \relative fis, {
\set Staff.instrumentName = "Kb." 
 \clef "bass"
  \key h \minor
	fis2.~\fff | fis~ | fis~ | fis~ | fis~ | \repeat unfold 3 { fis~ | }  fis\dim \bar ""  fis2.*0\!
}

\score {
   \new GrandStaff 

    <<

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #16 }
	<<

   	\new Staff = "Floete" {
	 \global
	  \FluteAll
	    }

   	\new Staff = "Oboe" {
	 \global
	  \OboeAll
		}

   	\new Staff = "Klar" {
	 \global
	  \AClarAll
		}

   	\new Staff = "Fagott" {
	 \global
	  \FagAll
		}

	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #14 }

	<<

		\new GrandStaff \with { 
		\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8 }
	 \with { instrumentName = "Hrn." }
		<<		    
			\new Staff = "HornI+II" \with { instrumentName = "1. 2. in F" }
		 	 << \global \partcombine \HornmusicI \HornmusicII >>

			\new Staff  = "HornII+III" \with { instrumentName = "3. 4. in F" }
		 	 <<\global \partcombine \HornmusicI \HornmusicII >>
		>>

   		\new Staff = "Tpt" \with { 
		\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #12 } {
	 	 \global
	  	  \ATptAll
		}

		\new GrandStaff \with { 
		\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8 }
	  \with { instrumentName = "Pos." }
		<<		    
		\new Staff = "PosI+II" {
		 \global
		  \PosAT
		}

		\new Staff = "PosIII" \with { instrumentName = "B." } {
		 \global
		  \PosB
		}
		>>

   		\new Staff = "Tuba" \with { instrumentName = "B. Tuba" } {
	 	 \global
	 	  \PosB
		}
	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #16 }
 
	<<
   	\new Staff = "Timp" {
	 \global
	  \Timp
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
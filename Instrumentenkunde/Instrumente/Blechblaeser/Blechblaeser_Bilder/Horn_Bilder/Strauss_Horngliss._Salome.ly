\language deutsch

#(set! paper-alist (cons '("mein Format" . (cons (* 40 in) (* 24
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
	printPartCombineTexts = ##f
	}

}

#(define (filterOneEvent event)
  (let ((eventname (ly:music-property  event 'name)))
    (not
      (or     
        ;; add here event name you do NOT want
        (eq? eventname 'MultiMeasureTextEvent)
        (eq? eventname 'AbsoluteDynamicEvent)
        (eq? eventname 'TextScriptEvent)
		(eq? eventname 'TrillSpanEvent)
        (eq? eventname 'ArticulationEvent)))))


filtermusic = #(define-music-function (parser location music) (ly:music?)
   (music-filter filterOneEvent music))

tongue =
#(define-music-function (parser location dots) (integer?)
  #{
    \tweak stencil
      #(lambda (grob)
        (let ((stil (ly:script-interface::print grob)))
          (let loop ((count (1- dots)) (new-stil stil))
            (if (> count 0)
                (loop (1- count)
                      (ly:stencil-combine-at-edge new-stil X RIGHT stil 0.2))
                (ly:stencil-aligned-to new-stil X CENTER)))))
     \staccato
  #})

global = {
	\tempo "bewegt"
	 \time 4/4
}

PiccolomusicI = \relative e''' { 
   r4 r8 e16(\ff gis e2~ | e8 h) r4 r8 e16( gis e4~ | e8 h ) r4 r8 e16( gis e4~ |
	\repeat unfold 4 { \tuplet 3/2 { e8 h) e16( gis } }
}

PiccolomusicII = \relative e''' {
\tuplet 3/2 { e8 h) e-. } \tuplet 3/2 { gis,-. cis-. e,-. } \tuplet 3/2 { a-. h,-. e-. } \tuplet 3/2 { gis,-. cis-. fis-. } | \tuplet 3/2 { a-. h-. e-. } \tuplet 3/2 { gis,-. cis-. e,-. } \tuplet 3/2 { a-. h,-. e'-. } \tuplet 3/2 { gis,-. cis-. e,-. } 
}

FloeteIImusicII = \relative e''' {
\tuplet 3/2 { e8) gis-. g-. } \tuplet 3/2 { e-. dis-. cis-. } \tuplet 3/2 { c-. gis-. g-. } \tuplet 3/2 { e-. dis-. gis-. } | \tuplet 3/2 { h-.  gis'-. g-. } \tuplet 3/2 { e-. dis-. cis-. } \tuplet 3/2 { c-. gis-. g-. } \tuplet 3/2 { e-. dis-. gis-. } 
}


FloeteIIImusicII = \relative e''' {
\tuplet 3/2 { e8) h-. e-. } \tuplet 3/2 { gis,-. cis-. e,-. } \tuplet 3/2 { a-. h,-. e-. } \tuplet 3/2 { gis,-. cis-. fis-. } | \tuplet 3/2 { a-. h-. e-. } \tuplet 3/2 { gis,-. cis-. e,-. } \tuplet 3/2 { a-. h,-. e'-. } \tuplet 3/2 { gis,-. cis-. e,-. } 
}
OboeImusicII = \relative e'' {
\tuplet 3/2 { e8) d'-. cis-. } \tuplet 3/2 { h-. a-. gis-. } \tuplet 3/2 { fis-. e-. d-. } \tuplet 3/2 { cis-. a'-. cis-. } | \tuplet 3/2 { e-. d-. cis-. } \tuplet 3/2 { h-. a-. gis-. } \tuplet 3/2 { fis-. e-. d'-. } \tuplet 3/2 { cis-. h-. a-. } 
}

OboeIImusicII = \relative e'' {
\tuplet 3/2 { e8) h'-. a-. } \tuplet 3/2 { gis-. fis-. e-. } \tuplet 3/2 { d-. cis-. h-. } \tuplet 3/2 { a-. fis'-. a-. } | \tuplet 3/2 { cis-. h-. a-. } \tuplet 3/2 { gis-. fis-. e-. } \tuplet 3/2 { d-. cis-. h-. } \tuplet 3/2 { a-. gis'-. fis-. }
}

Esklarfloskel = \relative cis'' { r8 cis32( dis eis a! gis8) r }

Aklarfloskel = \relative g' { \tuplet 7/4 { g16( as a b h c cis } d8) r }

FagKontraFag = \relative d' { d1~_\markup { \concat { "(" \dynamic { p } ")" }  } | d1~ | d1 | d1~ | d1~ | d1 | d1~ | d1 }

EHornIfloskel = \relative g' { g16( c es as | g4) }

EHornIIfloskel = \relative g' { g16( c es f | e4) }

HornDmusic = \relative c { c1_\markup { \concat { "(" \dynamic { p } ")" } } | c~ | c~ | c | c~ | c~ | c | c }

Bassposaune = \relative c { r8 \repeat unfold 2 { c4.~\fp |c2~ | \repeat unfold 2 { c1~ } | c8 } c4.~\fp c2~ | c1 }

Piccolo = {
 \set Staff.instrumentName = "kl. Fl."
  \clef "treble"
   \key c \major
    R1*2 \PiccolomusicI \PiccolomusicII \bar ""
}

FloeteI = {
 \set Staff.instrumentName = "1."
  \clef "treble"
   \key c \major
    R1*2 \PiccolomusicI \PiccolomusicII \bar ""
}

FloeteII = {
  \clef "treble"
   \key c \major
    R1*2 \PiccolomusicI \FloeteIImusicII \bar ""
}

FloeteIII = \relative h {
  \clef "treble"
   \key c \major
    R1*2 \PiccolomusicI \FloeteIIImusicII \bar ""
}

OboeI = \relative des'' {
  \clef "treble"
   \key c \major
    R1 | des4(\ff g!8) r r2 | \transpose e''' e'' { \relative { \PiccolomusicI } } \OboeImusicII \bar ""
}

OboeII = \relative b' {
  \clef "treble"
   \key c \major
    R1 | b4(\ff e!8) r r2 | \transpose e''' e'' { \relative { \PiccolomusicI } } \OboeIImusicII \bar ""
}

EnglHn =  \relative as'' {
 \set Staff.instrumentName = "engl. Horn"
  \clef "treble"
   \transposition f
    \key g \major
     R1 | as4(\ff d!8) r r2 | R1*4 | h2.\ff r4 | h2. r4 \bar ""  
}

Heckelphon =  \relative f'' {
 \set Staff.instrumentName = "Heckelphon"
  \clef "treble"
   \key g \major
    R1 | f4(\ff b,8) r r2 | R1*4 | h2.\ff r4 | h2. r4 \bar ""  
}

EsClar =  \relative f'' {
 \set Staff.instrumentName = "Es-Clar."
  \clef "treble"
  \transposition es
   \key a \major
    R1*2 | r8 cis32(\ff dis eis a gis8) r r2 | \repeat unfold 6 { \Esklarfloskel } | \transpose d' h' { \relative { \tuplet 3/2 { r8 d'-. cis-. } \tuplet 3/2 { h-. a-. gis-. } \tuplet 3/2 { fis-. e-. d-. } \tuplet 3/2 { cis-. a'-. cis-. } | \tuplet 3/2 { e-. d-. cis-. } \tuplet 3/2 { h-. a-. gis,-. } \tuplet 3/2 { fis-. e-. d'-. } \tuplet 3/2 { cis-. h-. a-. } 
    }
  } \bar ""  
}

AClarI = \relative es' {
 \clef "treble"
  \transposition a
   \key es \major
    \once \override DynamicText.extra-offset = #'( 1.2 . -1.5 ) r8\ff es4.~(\sfz \tuplet 6/4 { es16 f ges as b ces } des32 es f ges as b c des | es8) r r4 r2 | \tuplet 7/4 { g,,16(\ff as a b h c cis } d8) r r2 | \repeat unfold 6 { \Aklarfloskel } | g2.\ff r4 | g2.\ff r4 \bar ""
}

AClarII = \relative es' {
 \clef "treble"
  \transposition a
   \key es \major
    r8\ff des4.~(\sfz \tuplet 6/4 { des16 es f ges as b  } ces32 des es f ges as b c | des8) r r4 r2 | \tuplet 7/4 { g,,16(\ff as a b h c cis } d8) r r2 | \repeat unfold 6 { \Aklarfloskel } | d2.\ff r4 | d2.\ff r4 \bar ""
}

BClar = \relative a {
 \clef "treble"
  \transposition b
   \key d \major
	<< 
    { \pitchedTrill a1\startTrillSpan_\markup { \concat { \italic "(" \dynamic { p } \italic ")" } } b \repeat unfold 6 { a1 } a a1*0\stopTrillSpan }
	\\
	{ s1 | \repeat unfold 3 { s2.. s8^\markup { \concat { "1. " \musicglyph "scripts.upedaltoe"} } | s2.. s8_\markup { \concat { "2. " \musicglyph "scripts.upedaltoe" } } | } s1 }
>>

 \bar ""
}

BassClar = \relative a, {
 \set Staff.instrumentName = "Basscl. (B)"
  \clef "bass"
   \transposition b
    \key d \major
	<<
	 { \pitchedTrill a1\startTrillSpan_\markup { \concat { \italic "(" \dynamic { p } \italic ")" } } b \repeat unfold 6 { a1 } a a1*0\stopTrillSpan }
	\\
	{ s1 | \repeat unfold 3 { s2.... s32^\markup { \musicglyph "scripts.upedaltoe" } | s1 | } s1 } 
	>>
\bar ""
}

FagI = \relative b' {
 \set Staff.instrumentName = "1."
  \clef "tenor"
   \key c \major
    R1 | b4(\ff e,!8) r r2 \clef "bass" r1*0 | R1*4 | e2.\ff r4 | e1 \bar ""
}

FagII = \relative d' {
  \clef "bass"
   \key c \major
    \FagKontraFag \bar ""
}

FagIII = \relative d' {
  \clef "bass"
   \key c \major
    \transpose d' d \relative {  \FagKontraFag } \bar ""
}

Cfg = \relative d' {
  \clef "bass"
   \key c \major
    \transpose d' d, \relative { \FagKontraFag }  \bar ""
}

EHornI = \relative g' {
   \clef "treble"
	\transposition e
	 \key c \major
	  R1*2 | r2 r4 g16(\ff c es as | g4) \repeat unfold 5 { \EHornIfloskel }  g,16(\ff c es as | g2.)  g,16(\ff c es as | g2) \pitchedTrill g\trill as \bar ""
}

EHornII = \relative g' {
   \clef "treble"
	\transposition e
	 \key c \major
	  R1*2 | r2 r4 g16(\ff c es f | e!4) \repeat unfold 5 { \EHornIIfloskel }  g,16(\ff c es f | e!2.)  g,16(\ff c es f | e!2) \pitchedTrill e\trill f \bar ""
}

DHornI = \relative c {
    \transposition d
	 \clef "bass"
	  \HornDmusic \bar ""
}

DHornII = \relative c {
    \transposition d
	 \clef "bass"
	  \transpose c c, \relative { \HornDmusic } \bar ""
}

CTptI = \relative c' {
	 \clef "treble"
	  \key c \major
	   R1 c16\ff->^\markup { \italic "marcato" } ges'-> b-> des-> g!2.~(->\> | g4 h2~\mf h8) r | R1*5 \bar ""
}

CTptII = \relative c' {
	 \clef "treble"
	  \key c \major
	   R1 c16\ff->^\markup { \italic "marcato" } ges'-> b-> des-> g!2.~(->\> | g4 gis2~\mf gis8) r | R1*5 \bar ""
}

ETpt = \relative c'' {
   \set Staff.instrumentName = "3. 4. (E)"
	\clef "treble"
	 \key c \major
	 R1*1 |
	 << { s2. s4^\markup "(E)" r4 c2~\mf c8 r | s4^\markup "(in B)" s2. | }
	  \\
		{ R1 | r4 g2~ g8 r | R1 | }
	 >>
	  R1*4 \bar ""
}

PosI = \relative gis' {
   \set Staff.instrumentName = "1. 2."
	\clef "bass"
	 \key c \major
	 R1*2 |
	 << { r4 \clef "tenor" gis2~\mf gis8 r }
	  \\
		{ r4 e2~ e8 r |}
	 >>
	  R1*5 \bar ""
}

PosIII = \relative c {
    \transposition d
	 \clef "bass"
	  \key c \major
	   \Bassposaune \bar ""
}

PosIV = \relative c {
    \transposition d
	 \clef "bass"
	  \key c \major
	  \transpose c b, \relative { \Bassposaune } \bar ""
}

Pauke = \relative d {
	\set Staff.instrumentName = "Pauke"
	 \clef "bass"
	  d1\startTrillSpan_\markup { \concat { "(" \dynamic { pp } ")" } } | d8\stopTrillSpan r8 r4 r2 | R1*6 \bar ""
}

ViolineI = \relative des'' {
	\set Staff.instrumentName = "Viol. I"
	 \clef "treble"
	  \key c \major
	   R1 | des4(\ff^\markup "arco" g,8) r r2 |
	   \transpose g' e' { \relative { \Aklarfloskel } } r2 |
	   \repeat unfold 6 { \transpose g' e' { \relative { \Aklarfloskel } } } |
	   \tuplet 3/2 { r8 r8 e''16-.\ff e-. } \tuplet 3/2 { gis8:16\tongue #2 cis:\tongue #2 e,:\tongue #2 } \tuplet 3/2 { a:\tongue #2 h,:\tongue #2 e:\tongue #2 } \tuplet 3/2 { gis,:\tongue #2 cis:\tongue #2 fis:\tongue #2 } \tuplet 3/2 { a:\tongue #2 h:\tongue #2 e:\tongue #2 } \tuplet 3/2 { gis,8:\tongue #2 cis:\tongue #2 e,:\tongue #2 } \tuplet 3/2 { a:\tongue #2 h,:\tongue #2 e:\tongue #2 } \tuplet 3/2 { gis,8:\tongue #2 cis:\tongue #2 e,:\tongue #2 }
\bar ""
}

ViolineII = \relative des'' {
	\set Staff.instrumentName = "Viol. II"
	 \clef "treble"
	  \key c \major
	   R1 | b4(\ff^\markup "arco" e,8) r r2 |
	   \transpose cis' e' \relative { \Esklarfloskel }  r2 |
	   \repeat unfold 6 { \transpose cis'' e'' \relative { \Esklarfloskel } } |
	   \tuplet 3/2 { e''8:\tongue #2 gis:\tongue #2 g:\tongue #2 } \tuplet 3/2 { e:\tongue #2 dis:\tongue #2 cis:\tongue #2 } \tuplet 3/2 { c:\tongue #2 gis:\tongue #2 g:\tongue #2 } \tuplet 3/2 { e:\tongue #2 dis:\tongue #2 gis:\tongue #2 } | \tuplet 3/2 { h:\tongue #2  gis':\tongue #2 g:\tongue #2 } \tuplet 3/2 { e:\tongue #2 dis:\tongue #2 cis:\tongue #2 } \tuplet 3/2 { c:\tongue #2 gis:\tongue #2 g:\tongue #2 } \tuplet 3/2 { e:\tongue #2 dis:\tongue #2 gis:\tongue #2 }
\bar ""
}

Bratsche = \relative f' {
	\set Staff.instrumentName = "Br."
	 \clef "alto"
	  \key c \major
	   R1 | f4(\ff^\markup "arco" b,8) r r2 |
	   r2 r4 h16(\ff e g a | gis4)
	   \repeat unfold 5 { \transpose g' h { \relative { \EHornIfloskel } } }
	   \repeat unfold 2 { h,16(\ff e g a | \afterGrace gis2\trill { fisis16[ gis] } e8) r } r4 
\bar ""
}

Celli = \relative h {
	\set Staff.instrumentName = "Celli"
	 \clef "tenor"
	  \key c \major
	   R1*2 | r2 r4^\markup "arco" h16(\ff e g c | h4)
	   \repeat unfold 5 { \transpose g' h { \relative { \EHornIIfloskel } } }
	   \repeat unfold 2 { h,16(\ff e g a | \afterGrace h2\trill { aisis16[ h] } e8) r } r4 
\bar ""
}

Contrabass = \relative d {
	 \set Staff.instrumentName = "C. B."
	  \clef "bass"
	   \key c \major
		R1*6 | \repeat unfold 2 { d4\ff^\markup "pizz" r r2 } \bar ""
}


\score {
   \new GrandStaff 

    <<

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #16 }
	<<
   	
	\new Staff = "Piccolo" {
	 \global
	  \Piccolo
		}

	  \new GrandStaff \with { 
	   \override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
		\with { instrumentName = "3 gr. Fl." }

		<<
   	     \new Staff = "FloeteI" {
	      \global
	       \FloeteI
	         }

   	      \new Staff = "FloeteRest" \with { instrumentName = "2. 3." }
	       << \global
			  \new Voice = "FloeteII" { \voiceOne \FloeteII }
			  \new Voice = "FloeteIII" { \voiceTwo \filtermusic \FloeteIII }
		   >>
	   
		>>

   	\new Staff = "Oboe"
	 \with { instrumentName = "2 Hob." }
	  << \global \partcombine \OboeI \OboeII >>

   	\new Staff = "EnglHn" {
	 \global
	  \EnglHn
		}

   	\new Staff = "Heckelphon" {
	 \global
	  \Heckelphon
		}

   	\new Staff = "EsClar" {
	 \global
	  \EsClar
		}

   	\new Staff = "AClar"
	 \with { instrumentName = "2 A-Clar." }
	  << \global
		 \new Voice = "AClarI" { \voiceOne \AClarI }
		 \new Voice = "AClarII" { \voiceTwo \filtermusic \AClarII } 
	  >>

   	\new Staff = "BClar"
	 \with { instrumentName = "2 B-Clar." }
	  << \global
		 \new Voice = "BClarI" { \voiceOne \BClar }
		 \new Voice = "BClarII" { \voiceTwo \filtermusic \BClar }
	  >>

   	\new Staff = "BassClar" {
	 \global
	  \BassClar
		}

	  \new GrandStaff \with { 
	   \override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
		\with { instrumentName = "3 Fag." }

		<<
   	     \new Staff = "FagI" {
	      \global
	       \FagI
	         }

   	      \new Staff = "FagRest" \with { instrumentName = "2. 3." }
	       << 
		 	\new Voice = "FagII" { \voiceOne \FagII }
		 	\new Voice = "FagIII" { \voiceTwo \filtermusic \FagIII }
		   >>
	   
		>>

   	\new Staff = "Cfg" {
	 \global
	  \Cfg
		}


	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #14 }

	<<

		\new GrandStaff \with { 
		 \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8 }
	     \with { instrumentName = \markup { \null \raise #6 { "6 Hörner" } } }

		<<		    
			\new Staff = "HornI+II" \with { instrumentName = "1. 2. (E)" }
		 	 << \global \partcombine \EHornI \EHornII >>

			\new Staff  = "HornIII+IV" \with { instrumentName = "3. 4. (E)" }
		 	 <<\global \partcombine \EHornI \EHornII >>

			\new Staff  = "HornV+VI" \with { instrumentName = "5. 6. (D)" }
		 	 <<\global
		 		\new Voice = "DHornI" { \voiceOne \DHornI }
			    \new Voice = "DHornII" { \voiceTwo \filtermusic \DHornII }
			 >>

		>>

	  \new GrandStaff \with { 
	   \override StaffGrouper.staff-staff-spacing.basic-distance = #8 }
		\with { InstrumentName = "4 Tromp." }

		<<

   	     \new Staff = "CTpt" \with { instrumentName = "1. 2. (C)" }
	       << \global \partcombine \CTptI \CTptII >>

   	     \new Staff = "ETpt" {
	      \global
	       \ETpt
	         }
	   
		>>

		\new GrandStaff \with { 
		 \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8 }
	  	 \with { instrumentName = "4 Pos." }
		<<		    
		  \new Staff = "PosI+II"
		   \with{ instrumentName = "1. 2." }
			{
		  	 \global
		  	 \PosI
		 	}

		  \new Staff = "PosIII+IV" \with { instrumentName = "3. 4." }
	    	  << \global \partcombine \PosIII \PosIV >>

		  >>
	   >>

	\new StaffGroup \with { 
	\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #16 }
 
	<<
   	\new Staff = "Pauke" {
	 \global
	  \Pauke
		}
	>>

	\new StaffGroup \with { 
	\override StaffGrouper.staff-staff-spacing.basic-distance = #8 }

	<<
		\new GrandStaff 
		<<
    	\new Staff = "ViolineI" {
		 \global
		  \ViolineI
		}

    	\new Staff = "ViolineII" {
		 \global
		  \ViolineII
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
	 
	\new Staff = "Contrabass" {
		 \global
		  \Contrabass
		}
  >>
>>
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions
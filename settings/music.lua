local music = {"No Music","~Game~","~Track~","==Character Themes==","==Misc=="} --The music layout is sadly hardcoded for now. You can still change these strings, though.
music.games = {
	["AA"] = {
		["Prelude"] = "Prelude(AA).mp3",
		["Trial"] = "Trial(AA).mp3",
		["Questioning (Moderato)"] = "Questioning(AA-normal).mp3",
		["Questioning (Allegro)"] = "Questioning(AA-allegro).mp3",
		["Objection"] = "OBJECTION (AA).mp3",
		["Pursuit"] = "PURSUIT(AA).mp3",
		["Pursuit - Variation"] = "PURSUIT(AA) - variation.mp3",
		["Announce The Truth"] = "Annonce The Truth(AA).mp3",
	},
	["JFA"] = {
		["Prelude"] = "Prelude(AA).mp3",
		["Trial"] = "Trial(JFA).mp3",
		["Questioning (Moderato)"] = "Questioning JFA (Moderato).mp3",
		["Questioning (Allegro)"] = "Questioning JFA (Allegro).mp3",
		["Objection"] = "OBJECTION (JFA).mp3",
		["Pursuit"] = "PURSUIT(JFA).mp3", 
		["Pursuit - Variation"] = "PURSUIT(JFA) - variation.mp3",
		["Announce The Truth"] = "Annonce The Truth(JFA).mp3",
	},
	["T&T"] = {
		["Prelude"] = "Prelude(AA).mp3",
		["Trial"] = "Trial(T&T).mp3",
		["Questioning (Moderato)"] = "Questioning T&T (Moderato).mp3",
		["Questioning (Allegro)"] = "Questioning T&T (Allegro).mp3",
		["Objection"] = "OBJECTION (T&T).mp3",
		["Pursuit"] = "PURSUIT(T&T).mp3",
		["Pursuit - Variation"] = "PURSUIT(T&T) - variation.mp3",
		["Announce The Truth"] = "Annonce The Truth(T&T).mp3",
	},
	["AJ"] = {
		["Prelude"] = "Prelude(AJ).mp3",
		["Trial"] = "Trial(AJ).mp3",
		["Questioning (Moderato)"] = "Questioning AJ (Moderato).mp3",
		["Questioning (Allegro)"] = "Questioning AJ (Allegro).mp3",
		["Objection"] = "OBJECTIOM(AJ).mp3",
		["Pursuit"] = "PURSUIT(AJ).mp3",
		["Pursuit - Variation"] = "PURSUIT(AJ).mp3",
		["Announce The Truth"] = "Annonce The Truth(AJ).mp3",
	},
	["Miles"] = {
		["Prelude"] = "Prelude(AA).mp3",
		["Trial"] = "Trial(Miles).mp3",
		["Questioning (Moderato)"] = "Questioning T&T (Moderato).mp3",
		["Questioning (Allegro)"] = "Questioning T&T (Allegro).mp3",
		["Objection"] = "OBJECTION(Miles).mp3",
		["Pursuit"] = "114 Pursuit(Miles).mp3",
		["Pursuit - Variation"] = "114 Pursuit(Miles).mp3",
		["Announce The Truth"] = "Annonce The Truth(Miles).mp3",
	},
}
music.themes = {
	"Prelude",
	"Trial",
	"Questioning (Moderato)",
	"Questioning (Allegro)",
	"Objection",
	"Pursuit",
	"Pursuit - Variation",
	"Announce The Truth"
}
music.charthemes = {
	"Godot - The Fragrance of Dark Coffee.mp3",
	"Luke Atmey ~ I Just Want Love.mp3",
	"Great Revival ~ Franziska von Karma.mp3",
	"Great Revival ~ Miles Edgeworth.mp3",
	"Others ~ Guilty love.mp3",
	"The Great Truth Burglar.mp3",
	"Speak up, Pup!.mp3",
	"Super Trixie.mp3",
}
music.misc = {
	"logic_and_trick.mp3",
	"Suspence(AA).mp3",
	
	"113 Confrontation ~ Presto 2009.mp3",
	"Crises of Fate.mp3",
	"Hotline of Fate.mp3",
	"Pursuit ~ I Want to Find the Truth(Orchestra).mp3",
	"PURSUIT(DS).mp3",
	
	"Forgotten Legend.mp3",
	
	"Interesting People.mp3",
	"Noisy People.mp3",
	
	"Ghost Trick - The World of the Dead.mp3",
	"Ghost Trick - 4 Minutes Before Death.mp3",
	"Ghost Trick - Countdown.mp3",
}
music.lengths = {
	["Prelude(AA).mp3"]=78,
	["Trial(AA).mp3"]=109,
	["Questioning(AA-normal).mp3"]=105,
	["Questioning(AA-allergo).mp3"]=127,
	["OBJECTION (AA).mp3"]=73,
	["PURSUIT(AA).mp3"]=96,
	["PURSUIT(AA) - variation.mp3"]=90,
	["Annonce The Truth(AA).mp3"]=80,
	["logic_and_trick.mp3"]=152,
	
	["Trial(JFA).mp3"]=108,
	["Questioning JFA (Moderato).mp3"]=90,
	["Questioning JFA (Allegro).mp3"]=103,
	["OBJECTION (JFA).mp3"]=94,
	["PURSUIT(JFA).mp3"]=82,
	["PURSUIT(JFA) - variation.mp3"]=76,
	["Annonce The Truth(JFA).mp3"]=98,
	
	["Trial(T&T).mp3"]=142,
	["Questioning T&T (Moderato).mp3"]=116,
	["Questioning T&T (Allegro).mp3"]=160,
	["OBJECTION (T&T).mp3"]=119,
	["PURSUIT(T&T).mp3"]=120,
	["PURSUIT(T&T) - variation.mp3"]=114,
	["Annonce The Truth(T&T).mp3"]=126,

	["Prelude(AJ).mp3"]=71,
	["Trial(AJ).mp3"]=126,
	["Questioning AJ (Moderato).mp3"]=80,
	["Questioning AJ (Allegro).mp3"]=103,
	["OBJECTIOM(AJ).mp3"]=96,
	["PURSUIT(AJ).mp3"]=109,
	["Annonce The Truth(AJ).mp3"]=60,
	
	["Trial(Miles).mp3"]=276,
	["OBJECTION(Miles).mp3"]=176,
	["114 Pursuit(Miles).mp3"]=197,
	["Annonce The Truth(Miles).mp3"]=153,
	
	["The Great Truth Burglar.mp3"]=149,
	
	["Godot - The Fragrance of Dark Coffee.mp3"]=148,
	["Great Revival ~ Franziska von Karma.mp3"]=86,
	["Great Revival ~ Miles Edgeworth.mp3"]=90,
	["Others ~ Guilty love.mp3"]=99,
	["Speak up, Pup!.mp3"]=167,
	["Luke Atmey ~ I Just Want Love.mp3"]=103,
	
	["Suspence(AA).mp3"]=93,
	
	["113 Confrontation ~ Presto 2009.mp3"]=187,
	["Crises of Fate.mp3"]=144,
	["Hotline of Fate.mp3"]=51,
	["Super Trixie.mp3"]=148,
	
	--Sad pieces.
	["Forgotten Legend.mp3"]=141,
	["Interesting People.mp3"]=143,
	["Noisy People.mp3"]=91,
	
	["Ghost Trick - The World of the Dead.mp3"]=686, 
	["Ghost Trick - 4 Minutes Before Death.mp3"]=905,
	["Ghost Trick - Countdown.mp3"]=464,
}
return music
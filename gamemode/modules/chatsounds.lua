
-- This module will make voice sounds play when certain words are typed in the chat
-- You can add/remove sounds as you wish, just follow the format used here
-- To disble them completey, use the command rp_chatsounds 0 or delete this file.
-- TODO: Add female sounds & detect gender of model, Use combine sounds for CPs.

local sounds = {}
sounds[ "hi" ] = { "vo/npc/male01/hi01.wav", "vo/npc/male01/hi02.wav" }
sounds[ "hello" ] = sounds[ "hi" ]
sounds[ "hey" ] = sounds[ "hi" ]

sounds[ "follow" ] = { "vo/coast/odessa/male01/stairman_follow01.wav", "vo/npc/male01/squad_follow02.wav", "vo/coast/cardock/le_followme.wav" }

sounds[ "wait" ] = { "vo/trainyard/man_waitaminute.wav" }
sounds[ "get in" ] = { "vo/canals/gunboat_getin.wav" }

sounds[ "not good" ] = { "vo/trainyard/male01/cit_window_use01.wav" }
sounds[ "isn't good" ] = sounds[ "not good" ]
sounds[ "isnt good" ] = sounds[ "not good" ]

sounds[ "stop it" ] = { "vo/trainyard/male01/cit_hit01.wav", "vo/trainyard/male01/cit_hit02.wav", "vo/trainyard/male01/cit_hit03.wav", "vo/trainyard/male01/cit_hit04.wav", "vo/trainyard/male01/cit_hit05.wav" }
sounds[ "cut it" ] = sounds[ "stop it" ]
sounds[ "stop that" ] = sounds[ "stop it" ]

sounds[ "same here" ] = { "vo/npc/male01/answer07.wav" }

sounds[ "shut up" ] = { "vo/npc/male01/answer17.wav" }

sounds[ "you never know" ] = { "vo/npc/male01/answer22.wav" }
sounds[ "wanna bet" ] = { "vo/npc/male01/answer27.wav" }

sounds[ "you sure" ] = { "vo/npc/male01/answer37.wav" }

sounds[ "i'm busy" ] = { "vo/npc/male01/busy02.wav" }
sounds[ "im busy" ] = sounds[ "i'm busy" ]

sounds[ "excuse me" ] = { "vo/npc/male01/excuseme01.wav", "vo/npc/male01/excuseme02.wav" }

sounds[ "fantastic" ] = { "vo/npc/male01/fantastic01.wav", "vo/npc/male01/fantastic02.wav" }

sounds[ "good god" ] = { "vo/npc/male01/goodgod.wav", "vo/npc/male01/gordead_ans04.wav" }
sounds[ "oh my god" ] = sounds[ "good god" ]
sounds[ "gosh" ] = sounds[ "good god" ]
sounds[ "omg" ] = sounds[ "good god" ]
sounds[ "omfg" ] = sounds[ "good god" ]

sounds[ "oh no" ] = { "vo/npc/male01/gordead_ans05.wav" }

sounds[ "sorry" ] = { "vo/npc/male01/sorry01.wav", "vo/npc/male01/sorry02.wav", "vo/npc/male01/sorry03.wav" }

sounds[ "uhoh" ] = { "vo/npc/male01/uhoh.wav" }
sounds[ "uh oh" ]  = sounds[ "uhoh" ]

sounds[ "oops" ] = { "vo/npc/male01/whoops01.wav" }
sounds[ "whoops" ] = sounds[ "oops" ]

sounds[ "yeah" ] = { "vo/npc/male01/yeah02.wav" }
sounds[ "yes" ] = sounds[ "yeah" ]

sounds[ "hacks" ] = { "vo/npc/male01/hacks01.wav",  "vo/npc/male01/hacks02.wav", "vo/npc/male01/thehacks01.wav", "vo/npc/male01/thehacks02.wav"}
sounds[ "hax" ] = sounds [ "hacks" ]
sounds[ "hax" ] = sounds [ "hacks" ]

sounds[ "ammo" ] = { "vo/npc/male01/ammo03.wav", "vo/npc/male01/ammo04.wav" }

sounds[ "behind you" ] = { "vo/npc/male01/behindyou01.wav", "vo/npc/male01/behindyou02.wav" }

sounds[ "freeman" ] = { "vo/npc/male01/freeman.wav", "vo/npc/male01/docfreeman01.wav", "vo/npc/male01/docfreeman02.wav" }

sounds[ "get down" ] = { "vo/npc/male01/getdown02.wav" }

sounds[ "gtfo" ] = { "gethellout.wav" }
sounds[ "get out" ] = sounds [ "gtfo" ]

sounds[ "gotta reload" ] = { "vo/npc/male01/gottareload01.wav" }

sounds[ "better reload" ] = { "vo/npc/male01/youdbetterreload01.wav" }

sounds[ "help" ] = { "vo/npc/male01/help01.wav" }

sounds[ "incoming" ] = { "vo/npc/male01/heretheycome01.wav", "vo/npc/male01/incoming02.wav" }
sounds[ "here they come" ] = sounds [ "incoming" ]

sounds[ "okay" ] = { "vo/npc/male01/ok01.wav", "vo/npc/male01/ok02.wav" }
sounds[ "ok" ] = sounds[ "okay" ]
sounds[ "kay" ] = sounds[ "okay" ]

sounds[ "run" ] = { "vo/npc/male01/strider_run.wav" }

sounds[ "watch out" ] = { "vo/npc/male01/watchout.wav" }

sounds[ "cp" ] = { "vo/npc/male01/civilprotection01.wav", "vo/npc/male01/civilprotection02.wav", "vo/npc/male01/cps01.wav", "vo/npc/male01/cps02.wav" }
sounds[ "cps" ] = sounds[ "cp" ]
sounds[ "cops" ] = sounds[ "cp" ]

sounds[ "got one" ] = { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone01.wav"}


local function CheckChat( ply, text )

	if not GAMEMODE.Config.chatsounds then return end
	local prefix = string.sub( text, 0, 1 )
	if prefix ~= "/" and prefix ~= "!" and prefix ~= "@" then -- should cover most chat commands for various mods/addons

		for k, v in pairs( sounds ) do

			local res1, res2 = string.find( string.lower( text ), k )
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then

				ply:EmitSound( table.Random( v ), 80, 100 )
				break
			end

		end

	end

end

hook.Add("PlayerSay", "ChatSounds", CheckChat )
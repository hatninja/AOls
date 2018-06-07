# AOls
This is an Attorney Online server written entirely in Lua. It uses luasocket and luaJIT.

## Running

1. Put the server folder somewhere.
2. Configure your server with the `settings` folder.
3. Then run with `luajit /path/to/AOls/init.lua`

## Features
* WebAO support
* Dynamic rooms
* Music selector
* Auto-coloring text
* Spam/lag prevention

## Commands
**/motd, /help, /rules, /files** -
Each display a text message if it is set.
`/motd` is the message you get when you join.

**/area** -
Without arguments, it displays the area list.
With a numbered argument, it joins the room with that id.
With +, it makes a new room.
With a string, it will join a room by name.

**/whois** or **/getarea** - 
Gets the list of people in the room with you.
You can add an id to get a certain user's status.

**/getareas** - 
Lists every user by every room.

**/players** - 
Gets amount of people online.

**/g** - 
Sends a server-wide message.

**/need** - 
Sends a server-wide need advertisement.

**/pm (id) (message)** - 
Sends a private message to a user. Only supports user id for now.

**/coinflip** - 
Flips a coin.

**/roll (sides)** - 
Rolls a 6-sided die by default.

**/randomchar** - 
Selects a random character for you.

**/switch** - 
Selects a character by search string.

**/pos** - 
Sets your character's position within the courtroom.

**/desk** - 
Sets your desk's visibility.
0 forces desk off, 1 forces desk on.
default is normal

**/bg (filename)** - 
Sets the background for the room. Only server-supported ones can be used.

**/nick (name)** - 
Sets your nickname.
Use with no arguments to clear it.

**/name (name)** - 
Sets the room's name.
Use with no arguments to return the name of the room.

**/desc (description)** - 
Sets the room's description.
Use with no arguments to return the description of the room.

**/status** - 
Sets the status of a courtroom.
Default choices: IDLE, BUILDING, RUNNING, RECESS, FINISHED

**/doc (link)** - 
Sets the room's doc.
Use with no arguments to return the doc.

**/leave** - 
Shortcut for `/area 1`

**/lock (password)** - 
Locks a room with a password.
Users entering will be required to add the password as a third argument to `/area`

**/unlock** - 
Unlocks a room.

#### Mod commands
**/modpass (passcode)** - 
Logs you in as moderator.

**/mute (id)** - 
Stops a user from using IC features.

**/unmute (id)** - 
Unmutes.

**/kick (id)** - 
Boots the user off the server.

**/ban (id)** - 
Bans the users ip from the server, they will not be able to rejoin.
Their IP will be given once you do this.

**/unban (ip)** - 
Unbans the specified IP, users using the ip will be able to join again.

**/move (id) (room id)** - 
Moves a user to the specified room.

**/trap (id) (room id)** - 
Traps a user to the specified room, they will not be able to change rooms.

**/untrap (id)** - 
Untraps a user.

**/muteroom** - 
Mutes a room so that only moderators can speak.

**/unmuteroom** - 
Unmutes a room.

**/modlock** - 
Locks a room so only moderators can enter. Users that are already in the room will stay, however.

**/unmodlock** - 
Unlocks a mod-locked room.

**/reload** - 
Reloads the server. This will disconnect every client.

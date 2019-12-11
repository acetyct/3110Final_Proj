(**This module represents weapons in the game*)

(**The abstract type that represents the weapon *)
type t = {weapon_type: string; power: int}

(**[make_weapon name power] creates a weapon with the name [name] and 
   power [power] *)
val make_weapon:  string -> int ->t

(**[get_weapon_type a] returns the weapon type or name of [a]*)
val get_weapon_type: t -> string

(**[get_power a] returns the power of [a]*)
val get_power: t -> int 

(**[weapon_string list] returns the display output for weapons in [list] *)
val weapon_string: t list -> string
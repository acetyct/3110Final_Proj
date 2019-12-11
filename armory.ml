open Player 
open Weapon

type t = {mutable weapons: (Weapon.t * int) list; count: int}

let make_armory =
  let dagger = Weapon.make_weapon "Dagger" 50 in 
  let sword = Weapon.make_weapon "Sword" 100 in
  let gun = Weapon.make_weapon "Gun" 150 in  
  let fireball = Weapon.make_weapon "Fireball" 200 in 
  let iceball = Weapon.make_weapon "Iceball" 250 in 
  let plasmaball = Weapon.make_weapon "Plasmaball" 300 in 
  let bow = Weapon.make_weapon "Bow" 25 in
  let axe = Weapon.make_weapon "Axe" 75 in
  let bomb = Weapon.make_weapon "Bomb" 125 in
  let saw = Weapon.make_weapon "Saw" 75 in
  let arr = [(bow, 10);(dagger, 10);(axe,9); (saw,9); 
             (sword, 8); (bomb,8); (gun, 7); 
             (fireball, 7); 
             (iceball, 6); (plasmaball, 4)] in
  {weapons = arr; count = 37}

(** [remove_weapon_helper lst weapon] is [lst], an association list of 
    weapons and their quantities, with the quantity of [weapon] decremented by 
    1. However, if the number of [weapon] would becomes 0, the entire pair of
    [weapon] and its quantity is removed from [lst].
    Raises a failure if [lst] is empty. *)
let rec remove_weapon_helper lst weapon_type= 
  match lst with 
  | []-> failwith "Sorry, there aren't any more weapons of this type"
  | (a,b)::y -> if ((a = weapon_type) && (b > 0)) 
    then 
      if b-1 = 0 
      then y 
      else (a, b-1)::y 
    else (a,b)::(remove_weapon_helper y weapon_type)

let armory_remove_weapon t weapon =
  let lst = t.weapons in 
  let new_lst = remove_weapon_helper lst weapon in 
  if t.count < 1 then 
    failwith "Sorry my Lord, the weaponry is out of stock of all weapons." 
  else {weapons = new_lst; count = t.count -1}

let armory_get_weapon t = 
  if t.count < 1 then 
    failwith "Sorry my Lord, the weaponry is out of stock of all weapons." 
  else 
    let dagger = Weapon.make_weapon "Dagger" 50 in 
    let sword = Weapon.make_weapon "Sword" 100 in
    let gun = Weapon.make_weapon "Gun" 150 in  
    let fireball = Weapon.make_weapon "Fireball" 200 in 
    let iceball = Weapon.make_weapon "IceBall" 250 in 
    let plasmaball = Weapon.make_weapon "Plasmaball" 300 in 
    let bow = Weapon.make_weapon "Bow" 25 in
    let axe = Weapon.make_weapon "Axe" 75 in
    let bomb = Weapon.make_weapon "Bomb" 125 in
    let saw = Weapon.make_weapon "Saw" 75 in
    let w_type_lst = [dagger; sword; gun; fireball;iceball;plasmaball;
                      bow; axe; bomb; saw] in 
    let ran_int = Random.int (List.length (w_type_lst)) in 
    let weapon = List.nth w_type_lst ran_int in  
    weapon 



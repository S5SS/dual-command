# Taiidan

## Race changes
> *Frigates for all races are having their scuttle damage cut so they no longer passively counter bombers. Hull defence against hw1 fighters is a little stronger as their strike is naturally so evasive.*
* **Frigate scuttle/death damage down:**
  * **Scuttle:** `945 => 130`
  * **Death:** `125 => 50`
* **Fighter EMP shield HP down:**
  * `kus_attackbomber.ship`
  * `kus_interceptor.ship`
    * **HP:** `75 => 30`
  * `kus_cloakedfighter.ship`
    * **HP:** `75 => 15`
  * `kus_scout.ship`
    * **HP:** `no effect => 15`

---

## Bombers
> *Due to the innate durability of hw1 fighters, there is very little a hw2 player can do to stop early bomber spam from sniping modules. Modules snipes are fine - however this strategy is a little overbearing*
* **Damage multiplier vs subsystems down:** `2.5x => 2.3x`

---

## Destroyers
> *See changes to Hiigaran scout EMP*
* **EMP shield HP down:** `1000 => 850` (takes 8 squads in a burst)

---

## Heavy corvettes
> *Due to its size, this unit is getting close to frigate durability with such a high HP stat. Just a little too high*
* **HP down:** `1700 => 1600`

---

## Multiguns
> *Same as Heavies*
* **HP down:** `1400 => 1300`

---

## Minelayers
> *This unit was essentially removed from competetive play to prevent abusers from forming huge mine curtains and stalling the game out indefinitely. This is a shame, because minelayers are actually a very interesting unit with a lot of rewarding micro gameplay for both the user and defender during both staged fights and backstabs. Bringing this unit back into play but cutting away its undesirable qualities is the goal here.*
* **Max strafe speed up:** `255 => 280`
* **Max speed up:** `255 => 280`
* **Cost down:** `400 => 375`
* **Build time down:** `45 => 30`
* **Weapon (mine) changes:** (*`kus_mine.miss`*)
  * **Lifetime down:** `200s => 60s` // Minelayers are able keep about 8 mines active (compared to perhaps 20 previously)

---

## Missile Destroyers
> *Fix to an error in 7.0, the speed of the missiles is now actually changed.*
* **Burst fire missile speed fixed:** `425 => 850`
* **EMP shield down:** `1000 => 700` // See changes to Hiigaran scout EMP

---

## Resource Collectors
> *Jumping targeted collectors is working as a get-out-of-jail-free card. The cost of a collector jump should possibly be even greater, but a smaller change for now*
* **Minimum HS jump cost up:** `300 => 450`
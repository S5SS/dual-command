# Hiigaran

## Race Changes
> *Hiigaran and Vaygr inhibs are getting a small radius reduction. Hyperspace is far too rare to see outside of hypertorp or all-ins. This is partly due to pricing, but its also because hs inhibs are **gigantic**. On medium maps such as Fallen Lords, a single inhib can cover the entire front side of your base. Slightly smaller inhibs allow for more aggressive backstabs with hyperspacing capitals etc. Frigates for all races are having their scuttle damage cut so they no longer passively counter bombers. Finally, hull defence against hw1 fighters is a little stronger as their strike is naturally so evasive.*
* **HS inhib radius down:** `12000 => 10500`
  * `hgn_mothership.ship`
  * `hgn_carrier.ship`
  * `hgn_battlecruiser.ship`
  * `hgn_shipyard.ship`
* **Frigate scuttle/death damage down:**
  * **Scuttle:** `945 => 130`
  * **Death:** `125 => 50`
* **Hull defence:**
  * `hgn_mshulldefensegun.wepn` (mothership)
  * `hgn_mshulldefensegun2.wepn` (carriers, mobile refs)
  * `hgn_mshulldefensegunside.wepn` (shipyards)
    * **Acurracy vs hw1 fighters up:** `0.17 => 0.34`

---

## Destroyers
> *See changes to Hiigaran scout EMP*
* **EMP shield HP down:** `1000 => 850` (takes 8 squads in a burst)

---

## Gunships
> *Despite QOL buffs, this unit is still utter trash and is categorically outclassed by interceptors. This is partly due to their inability to chase down bombers, but mostly due to their horrendus time-to-kill against all fighters. This results in a unit which works fine if the opponent a) lets you mass up to 6 or so squads, and b) tries to fight your gunships head on without trying to snipe collectors or etc. Gunships are also expensive and slow to produce, pushing them into a section of the game which will soon involve strong anti-vette options such as pulsars, missiles, torpedoes and assaults (not to mention lances). More buffs here.*
* **HP upgrade:**
  * **Cost down:** `800 => 650`
  * **Time down:** `40 => 35`
* **Base max speed up:** `232 => 254`
* **Weapon:** (*`hgn_vulcankineticturret.wepn`*)
  * **Range up:** `2000 => 2200`
  * **Projectile speed up:** `1600 => 1800`

---

## Gun platforms
> *When was the last time gun platforms swung a game? In a skilled matchup, maybe not since HW2 classic. More changes are likely coming down the line, but for now some touch ups will do.*
* **Weapon changes:**
  * **Damage per shot up:** `40 => 60` // As interceptors have `110` HP, gun platforms now take two shots instead of three to score a kill.
  * **Accuracy vs hw1 fighters up:** `0.85 => 0.95`
  * **Projectile speed up:** `2200 => 2300`

---

## Marine frigates
> *Marines are very underused and for good reason. They have extremely thin niche timings where they can threaten carrier captures on tiny maps such as shield or microbond, but outside this they lose to every unit in the game, including unassisted destroyers (2 marines lose to 1 kited destroyer).*
* **HP up:** `20000 => 23500`
* **Max speed up:** `230 => 270`
* **Max strafe speed up:** `230 => 270`
* **Max rotation speed up:** `22 => 35`
* **Strafe acceleration time down:** `7 => 6`
* **Forward acceleration time down:** `8 => 5`

---

## Sensor distortion probes
> *Part of a war on vision control, SD probes currently aren't worth the cost at all (aside from on very large maps). Buffs here to try bringing this unit out of obscurity **(SD probes are hard-countered by proximity sensors fyi)***
* **Enemy ship sensor range multiplier stronger:** `0.6 => 0.3` // (enemies in radius have sensor range cut by 70%)
* **Sensor distortion effect radius up:** `6000 => 8000`

---

## Scouts
> *Hiigaran scout EMP is another never-used upgrade (aside from die-hards like Cloaked). It nearly always misses fighters, and due to how corvettes are larger and generally spread more for all races, its not worth its price to disable one or two squads. This is quite a large change for the ability - instead of trying to match the Vaygr EMP, the Hiigaran EMP is now extremely potent, but will almost always miss fighters due to its much smaller burst radius. This defines it as a much more reliable corvette-stunner - and frigates too. Finally, last patch included an oversight which missed nerfing Hiigaran scout speed in tandem with other scout speed nerfs. This is finally included here.*
* **Base max speed down:** `512 => 485`
* **EMP projectile changes:**
  * **Projectile speed up:** `900 => 1800`
  * **Range down:** `3000 => 1500`
  * **Missed shot damage down:** `1.0x => 0.1x`
  * **Accuracy vs fighters down:** `0.05 => 0.01`
  * **Accuracy vs corvettes up:** `0.15 => 1.0`
* **EMP burst effect changes:**
  * **Radius down significantly:** `500 => 85`
  * **Shield damage up significantly:** `20 => 50` // Vettes take one scout squad to stun, frigates take three, missile destroyers take 6, and regular destroyers take 8. Destroyers in particular regenerate their shields very quickly, so all squads must hit within a small window.
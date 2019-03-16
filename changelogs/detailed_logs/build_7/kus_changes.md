# Kushan

## Cloaked Fighters
> *Even with perma-cloak, this unit has no viable niche in normal gameplay due to its high cost (time and ru).*
* **Build time down:** `15 => 12`
* **Cost down:** `130 => 120`
* **Research time down:** `100 => 80`

---

## Defenders
> *Research cost is way too high for a unit primarily designed to hold or bolster rush tactics. Defenders have very little other practical use, they don't need pushing further into obscurity.*
* **Research cost down:** `1000 => 650`
* **Research time down:** `75 => 60`
* **Projectile speed waaaay up:** `1200 => 1750`

---

## Multiguns
> *This unit was spending a ton of time trying to track units juust out of range (hw1 fighters have long arcs, as to hw2 evasive fighters), resulting in extremely long kill times - far too long to outpace re-enforcing fighters. The script used by multiguns has also been tweaked to make the unit more aggressive in chasing its targets.*
* `kus_multigun1.wepn, kus_multigun2.wepn`:
  * **Range up:** `1600 => 2000`
  * **Damage up:** `[8-10] => 12`
  * **Penetration vs hw1 fighters up:** `1.1 => 1.2`
  * **Turret ranges up:**
    * **Firing cone (radius) up:** `4 => 5`
    * **Vertical (upwards) declination up**: `33° => 50°`
  * **Turret turning speed up:**
    * **Horizontal:** `50 => 75`
    * **Vertical:** `50 => 75`
  * **Fire at at nearby (even if not bandboxed) targets if primary is out of range:** `0 => 1`
* `frontal_multiguncorvette.lua`:
  * **Distance mult during engagement to move closer to out-of-range targets down:** `1.5 => 1.1` (`3000 => 2200`)
  * **Wait time before giving chase to faster targets down:** `8s => 2s`

---

## Drone Frigates
> *Still extremely undesirable in comparison to other anti-fighter options, drone frigates simply struggle far too much to kill the unit they are designed to counter.*
* **Build time down:** `60 => 50`
* **Max speed up:** `206 => 230`
* **Drone shot projectile speed up:** `1700 => 2000` (*`kus_drone.wepn`*) For comparison, an interceptor shot moves at `1900` units/s

---

## Heavy Cruisers
> *The idea of HC being a real threat in combination with support frigates is definitely valid; however making the unit cost so much its a completely unviable option (aka removing it from the game) is really not a great solution.*
* **Research cost down:** `6000 => 5000`

---

## Ion Cannon Frigates
> *HW1 ions currently rock the competition, especially when paired with repairers (rep vettes get a bonus here since they are very resilient to the type of units ion cannons are built to fight such as other ions)*
* **Build cost up:** `700 => 750`

---

## Missile Destroyers
> *MDDs kill corvettes. They kill them **extremely well**, to the point where a single MDD on the field can remove corvettes as a viable unit class altogether. These changes don't aim to take away MDD dominance against strike - rather they aim to make MDDs more vulnerable to being sniped by heavy ordinance. The range of the standard weapon has dropped significantly to prevent MDDs from sitting safetly behind an ion curtain. In addition, the burst fire is now a significant option available to MDD users as it can deal decent damage to heavier targets - choosing whether to use this burst on strikecraft or a valuable capital target could swing fights. The cooldown has gone up to increase the weight of this decision.*
* **HP down:** `79500 => 75000`
* **Main weapon** (*`kus_destroyerlauncher.wepn`*):
  * **Range down:** `4500 => 3900` Slightly less than hgn ions (`4000`)
  * **Fire at at nearby (even if not bandboxed) targets if primary is out of range:** `0 => 1`
* **Burst attack** (*`kus_destroyerlaunchervolley.wepn`*):
  * **Cooldown increased:** `30s => 50s`
  * **Range increased:** `4500 => 5500`
  * **Missile speed increased:** `675 => 1000`
  * **Penetration vs frigates up:** `0.98 => 5.0`
  * **Penetration vs capitals up:** `1.0 => 7.0`

---

## Scouts
> *Scouts currently provide totally free and nigh-undeniable vison for the user if waypointed in a double-passive circle. Even in a freak accident where your opponent is able to snipe a scout squad, they're easily replaced. Vision is a resource to be fought for.*
* **No longer get a max speed boost from evasive tactics:** `1.1 => 1.0`
* **Primary sensor radius down (blue sphere in manager):** `8000 => 7000`
* **Secondary sensor radius down (works the same, but invisible):** `10000 => 8500`

---

## Support Frigates
> *Worth a little too much; a little too good, a little too cheap*
* **Build cost up:** `600 => 700`
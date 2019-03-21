# Vaygr

## Race changes
> *Hiigaran and Vaygr inhibs are getting a small radius reduction. Hyperspace is far too rare to see outside of hypertorp or all-ins. This is partly due to pricing, but its also because hs inhibs are **gigantic**. On medium maps such as Fallen Lords, a single inhib can cover the entire front side of your base. Slightly smaller inhibs allow for more aggressive backstabs with hyperspacing capitals etc. Finally, Vaygr fire control is a core aspect of their design in the lategame. Emphasising this strength for the race should help them out against units such as defence fields.*
* **HS inhib radius down:** `12000 => 10500`
  * `vgr_mothership.ship`
  * `vgr_carrier.ship`
  * `vgr_battlecruiser.ship`
  * `vgr_shipyard.ship`
* **Frigate scuttle/death damage down:**
  * **Scuttle:** `945 => 130`
  * **Death:** `125 => 50`
* **Hull defence:** // Vaygr use the same weapons as Hiigaran here
  * `hgn_mshulldefensegun.wepn` (flagship)
  * `hgn_mshulldefensegun2.wepn` (carriers, mobile refs)
  * `hgn_mshulldefensegunside.wepn` (shipyards)
    * **Acurracy vs hw1 fighters up:** `0.17 => 0.34`
* **Fire control fields:**
  * `vgr_commandcorvette.ship`
  * `vgr_c_module_firecontrol.subs`
  * `vgr_ms_module_firecontrol.subs`
    * **Multipliers up:**
      * **Damage:** `1.07x => 1.10x`
      * **Accuracy:** `1.07x => 1.10x`


---

## Research changes
> *Vaygr vettes are a little too paper mache now - they were utter monsters before but this nerf was a little hard on them. Bringing this number back up a little. Frigates are prohibitvely expensive to use earlygame - unupgraded assaults should be a fair answer for fighter spam.*
* **Corvette armor:**
  * **HP multiplier for upgrade up slightly:** `1.3 => 1.35`
* **Frigate chassis:**
  * **Cost down:** `1800 => 1600`
  * **Time down:** `120s => 110s`
* **Assault frigate tech:**
  * **Cost down:** `650 => 550`
  * **Time down:** `45s => 35s`
* **Platform armor:**
  * **Cost down:** `1600 => 1350`
  * **Time down:** `150s => 135s`

---

## Assault craft
> *Assault craft are designed to be outclassed 1-1 - however they are utterly bottom tier by a huge margin at this point. These changes don't bring them to equalise, but hopefull allow vaygr to use interceptors as a response to enemy fighter spam (especially with extra queues, fire control, or EMP)*
* **Damage mult versus fighters up:**
  * **vs HW1 fighters:** `0.57 => 0.6`
  * **vs HW2 fighters:** `0.24 => 0.3`
* **Accuracy vs HW1 fighters up:** `0.96 => 1.0`
* **Speed bracket for enemy ships to be easier to hit lowered to include hw1 ints:** `487 => 486`

---

## Assault frigates
> *Losing hard to hw1 bombers is not a great look for one of the best anti-fighter units in the game.*
* **Max base HP up a little:** `17000 => 17500`
* **Max base forward speed up:** `176 => 195`
* **Max base strafe speed up:** `176 => 195`
* **Weapon changes:**
  * `vgr_flechettecannonassaultfrigatebottom.wepn`
  * `vgr_flechettecannonassaultfrigateleft.wepn`
  * `vgr_flechettecannonassaultfrigateright.wepn`
    * **Accuracy vs hw1 fighters up:** `0.72 => 0.85`
    * **Accuracy vs all corvettes up:** `0.14 => 0.35`
    * **Accuracy vs frigates up:** `0.8 => 1.0`
    * **Accuracy vs capitals up:** `0.8 => 1.0`

---

## Destroyers
> *See changes to Hiigaran scout EMP*
* **EMP shield HP down:** `1000 => 850` (takes 8 squads in a burst)

---

## Gun platforms
> *When was the last time gun platforms swung a game? In a skilled matchup, maybe not since HW2 classic. More changes are likely coming down the line, but for now some touch ups will do.*
* **Weapon changes:**
  * **Damage per shot up:** `40 => 60` // As interceptors have `110` HP, gun platforms now take two shots instead of three to score a kill.
  * **Accuracy vs hw1 fighters up:** `0.85 => 0.95`
  * **Projectile speed up:** `2200 => 2300`

---

## Hyperspace platforms
> *This unit really stinks huh? If only they could penetrate through inhibs. Barring that, reducing the cost of something which has a barely superior effect to simply moving your production ships is another avenue.*
* **Max speed up:** `600 => 800`
* **Link formation cost down:** `1000 => 750`

---

## Infiltrator frigates
> *This unit, while superior to marines in many ways, is also inferior in others - mainly the timing which it hits the field. In order to have an upgrade infiltrator on the map, several logistical hurdles have to be overcome, meaning they rarely make an appearance until a time where the map is swarming with units excellent at killing them. Some small touch ups.*
* **Base HP up:** `20000 => 21000` (Upgraded: `28000 => 29400`)
* **Base max speed up:** `230 => 240` (Upgraded: `288 => 300`)
* **Base max strafe speed up:** `230 => 240` (Upgraded: `288 => 300`)
* **Max rotation speed up:** `22 => 35`
* **Strafe acceleration time down:** `7 => 6`
* **Forward acceleration time down:** `8 => 5`

---

## Lance fighters
> *Being slow means a lot more received damage for a fighter - this stat affects durablity far more than any other for this unit class. Lances **are** slow - and there's only five per squad to boot. As such this unit is exrtemely fragile and loses often to the most gentle of checks (such as missile vettes). Some love is needed.*
* **Max HP up:** `90 => 110` so a squad: `450 => 550`
* **Weapon changes:**
  * **Damage mult vs corvettes:**
    * **vs HW1:** `1.4 => 1.45`
    * **vs HW2:** `0.7 => 1.0`
  * **No longer receive accuracy falloff with range**
  * **Now use accuracy lookup tables rather than physics-based ballistics**

---

## Sensor distortion probes
> *Part of a war on vision control, SD probes currently aren't worth the cost at all (aside from on very large maps). Buffs here to try bringing this unit out of obscurity **(SD probes are hard-countered by proximity sensors fyi)***
* **Enemy ship sensor range multiplier stronger:** `0.6 => 0.3` // (enemies in radius have sensor range cut by 70%)
* **Sensor distortion effect radius up:** `6000 => 8000`
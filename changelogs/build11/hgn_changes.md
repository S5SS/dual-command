## Flak Frigates
> *Not technically a bad unit, the flak frigate is severely underrepresented to to its highly unreliable performance against fighters (how often does a squadron fly away with 1 member left?).
* **Attack script slightly altered so that flaks will stick a little better to targets:** `tooLongOutOfRange = 2.5 => tooLongOutOfRange	= 1.5` This means frigates are less happy to wait in place for targets that have moved out of range
* **Thruster (strafing) max speed up:** `178 => 200 (+12.4%)`
* **Thruster (strafing) acceleration time down:** `7s => 6s (-14.3%)`
* **Forwards max speed up:** `178 => 200 (+12.4%)`
* **Forwards acceleration time down:** `8s => 6s (-25%)`
* **Build time down:** `50s => 47s (-6%)` with imp.: `35s => 32s`
* **Weapon changes:**
  * `hgn_kineticburstcannon.wepn` (the projectile itself)
    * **Rate of fire up:** `0.125 shots/s => 0.5 shots/s (+300%)`
    * **Range up:** `2200 => 2300 (+4.5%)`
    * **Now automatically fires at available targets when possible (not just those bandboxed)**
    * **Accuracy vs mines up a lot:** vs `munition`: `0.05 => 1.0 (+1900%)`
  * `hgn_burstcannonburst.wepn` (the flak burst)
    * **Damage down:** `100 => 50 (-50%)`
    * **Damage multiplier changes:**
      * vs `unarmoured`: `0.28 => 0.2 (-28%)` homeworld 2 fighters
      * vs `unarmoured_hw1`: `0.46 => 0.45 (-2%)` homeworld 1 fighters
      * vs `lightarmour`: `0.16 => 0.2 (+25%)` homeworld 2 corvettes
      * vs `lightarmour_hw1`: `0.38 => 0.4 (+5.3%)` homeworld 1 corvettes
      * vs `mediumarmour`: `2.5 => 1.25 (-50%)` frigates
      * vs `heavyarmour`: `2.5 => 1.25 (-50%)` capitals

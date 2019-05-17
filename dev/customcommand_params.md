This is all I've been able to discover:

```lua
addAbility
(
	NewShipType,
	"CustomCommand",
	<default_availability>		: boolean, 	// ability is enabled (appears in the UI, can be activated/deactivated etc)
	<ui_display_name>		: string,       // name of ability on ui
	<unknown>			: unknown,      // ??
	<default_state>			: boolean,      // whether the ability is active by default
	<max_energy>			: number,       // maximum energy store for ability
	<min_energy_disengage>		: number,       // if the remaining energy is <=[maximum - this], you can turn the ability off yourself
	<usage_per_tenth> 		: number,       // energy usage per 1/10th of a second
	<recharge_per_tenth> 		: number,       // energy recharge per 1/10th of a second
	<min_required_energy> 		: number,       // if the remaining energy is >=[maximum - this], you can engage the ability. Ex: Max energy is 200, this value is set to 50. Therefore, the unit cannot activate its ability unless it has [200 - 50 = 150] energy.
	<path_to_script_file> 		: string,    	// Script file containing the functions referenced in the following parameters. Typically, this is "ship:race_shiptype/race_shiptype.lua" (ex: "ship:Kus_Gravwell/Kus_Gravwell.lua")
	<start_func_name>, 		: string,	// name of the 'Start' function, called once at start of ability. Typically, this is "Start_Race_Shipname" (ex: "Start_Kus_Gravwell")
	<update_func_name> 		: string,       // name of the 'Update' function, call periodically according to param <update_period> (#19). Typically, this is "Update_Race_Shipname" (ex: "Update_Kus_Gravwell")
	<finish_func_name> 		: string,       // name of the 'Finish' function name as found in the corresponding .lua script. Called once at end of ability. Typically, this is "Finish_Race_Shipname" (ex: "Finish_Kus_Gravwell")
	<group_name> 			: string,       // Fills in the 'CustomGroup' parameter for the Start, Do and Finish functions.
	<update_period> 		: number,       // 'update' function periodicity in seconds
	<ui_order>			: number,       // ui ordering
	<run_concurrent> 		: boolean,      // ability can run concurrent to other abilities
	<display_custom> 		: boolean,	// if 0 (false), the ability will not display its custom icon or name and defaults will be used
	<unknown> 			: unknown 	// ??
)
```

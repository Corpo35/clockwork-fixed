
local Clockwork = Clockwork
local type = type
local string = string
local math = math

Clockwork.animation = Clockwork.kernel:NewLibrary("Animation");
Clockwork.animation.sequences = Clockwork.animation.sequences or {};
Clockwork.animation.override = Clockwork.animation.override or {};
Clockwork.animation.models = Clockwork.animation.models or {};
Clockwork.animation.stored = Clockwork.animation.stored or {};
Clockwork.animation.convert = {
	[ACT_HL2MP_IDLE_CROSSBOW] = "ar2",
	[ACT_HL2MP_IDLE_SUITCASE] = "suitcase",
	[ACT_HL2MP_IDLE_GRENADE] = "grenade",
	[ACT_HL2MP_IDLE_SHOTGUN] = "shotgun",
	[ACT_HL2MP_IDLE_PHYSGUN] = "heavy",
	[ACT_HL2MP_IDLE_PISTOL] = "pistol",
	[ACT_HL2MP_IDLE_MELEE2] = "melee",
	[ACT_HL2MP_IDLE_MELEE] = "melee",
	[ACT_HL2MP_IDLE_KNIFE] = "melee",
	[ACT_HL2MP_IDLE_FIST] = "fist",
	[ACT_HL2MP_IDLE_SLAM] = "slam",
	[ACT_HL2MP_IDLE_SMG1] = "smg",
	[ACT_HL2MP_IDLE_AR2] = "ar2",
	[ACT_HL2MP_IDLE_RPG] = "heavy",
	[ACT_HL2MP_IDLE] = "fist",
	["gravitygun"] = "heavy",
	["crossbow"] = "ar2",
	["physgun"] = "heavy",
	["grenade"] = "grenade",
	["shotgun"] = "shotgun",
	["pistol"] = "pistol",
	["normal"] = "fist",
	["melee"] = "melee",
	["knife"] = "melee",
	["suitcase"] = "suitcase",
	["melee2"] = "melee",
	["slam"] = "slam",
	["smg"] = "smg",
	["ar2"] = "ar2",
	["357"] = "pistol",
	["rpg"] = "heavy"
};

Clockwork.animation.holdTypes = {
	["gmod_tool"] = "pistol",
	["gmod_camera"] = "slam",
	["cw_suitcase"] = "suitcase",
	["weapon_357"] = "pistol",
	["weapon_ar2"] = "ar2",
	["weapon_smg1"] = "smg",
	["weapon_frag"] = "grenade",
	["weapon_slam"] = "slam",
	["weapon_pistol"] = "pistol",
	["weapon_crowbar"] = "melee",
	["weapon_physgun"] = "heavy",
	["weapon_rpg"] = "heavy",
	["weapon_shotgun"] = "shotgun",
	["weapon_crossbow"] = "ar2",
	["weapon_stunstick"] = "melee",
	["weapon_physcannon"] = "heavy"
};

Clockwork.animation.stored.combineOverwatch = {
	["crouch_grenade_aim_idle"] = ACT_COVER_LOW,
	["crouch_grenade_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_grenade_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_grenade_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_grenade_aim_run"] = ACT_RUN_AIM_SHOTGUN,
	["crouch_grenade_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_grenade_idle"] = ACT_COVER_LOW,
	["stand_grenade_idle"] = "Idle_Unarmed",
	["stand_grenade_walk"] = "WalkUnarmed_all",
	["stand_grenade_run"] = ACT_RUN_RIFLE,
	["grenade_attack"] = ACT_RANGE_ATTACK_THROW,
	["grenade_reload"] = ACT_RANGE_ATTACK_THROW,
	
	["crouch_pistol_aim_idle"] = ACT_CROUCHIDLE,
	["crouch_pistol_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_pistol_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_pistol_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_pistol_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_pistol_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_pistol_idle"] = ACT_CROUCHIDLE,
	["stand_pistol_idle"] = "Idle_Unarmed",
	["stand_pistol_walk"] = "WalkUnarmed_all",
	["stand_pistol_run"] = ACT_RUN_RIFLE,
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["pistol_reload"] = ACT_GESTURE_RELOAD,
	
	["crouch_heavy_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_heavy_aim_idle"] = ACT_CROUCHIDLE,
	["stand_heavy_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_heavy_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_heavy_idle"] = ACT_CROUCHIDLE,
	["crouch_heavy_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_heavy_walk"] = "WalkEasy_all",
	["stand_heavy_idle"] = ACT_IDLE,
	["stand_heavy_run"] = ACT_RUN_RIFLE,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["heavy_reload"] = ACT_GESTURE_RELOAD,
	
	["crouch_melee_aim_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_melee_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_melee_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_melee_aim_walk"] = ACT_WALK_AIM_SHOTGUN,
	["stand_melee_aim_run"] = ACT_RUN_AIM_SHOTGUN,
	["crouch_melee_idle"] = ACT_COVER_LOW,
	["crouch_melee_walk"] = ACT_WALK_CROUCH,
	["stand_melee_walk"] = "WalkUnarmed_all",
	["stand_melee_idle"] = "Idle_Unarmed",
	["stand_melee_run"] = ACT_RUN_RIFLE,
	["melee_attack"] = ACT_MELEE_ATTACK1,
	["melee_reload"] = ACT_MELEE_ATTACK1,
	
	["crouch_slam_aim_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_slam_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_slam_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_slam_aim_walk"] = ACT_WALK_AIM_SHOTGUN,
	["stand_slam_aim_run"] = ACT_RUN_RIFLE,
	["crouch_slam_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_slam_idle"] = ACT_COVER_LOW,
	["stand_slam_idle"] = "Idle_Unarmed",
	["stand_slam_walk"] = "WalkUnarmed_all",
	["stand_slam_run"] = ACT_RUN_RIFLE,
	["slam_attack"] = ACT_SPECIAL_ATTACK2,
	["slam_reload"] = ACT_SPECIAL_ATTACK2,
	
	["crouch_fist_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_fist_aim_idle"] = ACT_CROUCHIDLE,
	["stand_fist_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_fist_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_fist_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_fist_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_fist_idle"] = ACT_CROUCHIDLE,
	["stand_fist_idle"] = "Idle_Unarmed",
	["stand_fist_walk"] = "WalkUnarmed_all",
	["stand_fist_run"] = ACT_RUN_RIFLE,
	["fist_attack"] = ACT_MELEE_ATTACK1,
	["fist_reload"] = ACT_MELEE_ATTACK1,

	["crouch_smg_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_smg_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_smg_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_smg_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_smg_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_smg_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_smg_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_smg_walk"] = "WalkEasy_all",
	["stand_smg_idle"] = ACT_IDLE_SMG1,
	["stand_smg_run"] = ACT_RUN_RIFLE,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,
	
	["crouch_ar2_aim_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_ar2_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_ar2_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_ar2_aim_idle"] = ACT_IDLE_ANGRY,
	["stand_ar2_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_ar2_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_ar2_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_ar2_walk"] = "WalkEasy_all",
	["stand_ar2_idle"] = ACT_IDLE,
	["stand_ar2_run"] = ACT_RUN_RIFLE,
	["ar2_attack"] = ACT_GESTURE_RANGE_ATTACK_AR2,
	["ar2_reload"] = ACT_GESTURE_RELOAD,
	
	["crouch_shotgun_aim_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_shotgun_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_shotgun_aim_walk"] = ACT_WALK_AIM_SHOTGUN,
	["stand_shotgun_aim_idle"] = ACT_IDLE_ANGRY_SHOTGUN,
	["stand_shotgun_aim_run"] = ACT_RUN_AIM_SHOTGUN,
	["crouch_shotgun_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_shotgun_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_shotgun_walk"] = "WalkEasy_all",
	["stand_shotgun_idle"] = ACT_IDLE,
	["stand_shotgun_run"] = ACT_RUN_RIFLE,
	["shotgun_attack"] = ACT_GESTURE_RANGE_ATTACK_SHOTGUN,
	["shotgun_reload"] = ACT_GESTURE_RELOAD,
	
	["crouch_suitcase_aim_idle"] = ACT_RANGE_AIM_AR2_LOW,
	["crouch_suitcase_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["stand_suitcase_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_suitcase_aim_walk"] = ACT_WALK_AIM_SHOTGUN,
	["stand_suitcase_aim_run"] = ACT_RUN_AIM_SHOTGUN,
	["crouch_suitcase_idle"] = ACT_COVER_LOW,
	["crouch_suitcase_walk"] = ACT_WALK_CROUCH,
	["stand_suitcase_walk"] = "WalkUnarmed_all",
	["stand_suitcase_idle"] = "Idle_Unarmed",
	["stand_suitcase_run"] = ACT_RUN_RIFLE,
	
	["crouch_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_idle"] = ACT_CROUCHIDLE,
	["stand_walk"] = "WalkUnarmed_all",
	["stand_idle"] = "Idle_Unarmed",
	["stand_run"] = ACT_RUN_RIFLE,
	["jump"] = ACT_JUMP,
	["sit"] = ACT_COVER_LOW,
	["hands"] = {
		body = 0000000,
		model = "models/weapons/c_arms_combine.mdl",
		skin = 0
	}
};

Clockwork.animation.stored.civilProtection = {
	["crouch_grenade_aim_idle"] = ACT_COVER_SMG1_LOW,
	["crouch_grenade_aim_walk"] = ACT_WALK_CROUCH,
	["stand_grenade_aim_idle"] = ACT_IDLE_ANGRY_MELEE,
	["stand_grenade_aim_walk"] = ACT_WALK_ANGRY,
	["stand_grenade_aim_run"] = ACT_RUN,
	["crouch_grenade_walk"] = ACT_WALK_CROUCH,
	["crouch_grenade_idle"] = ACT_COVER_PISTOL_LOW,
	["stand_grenade_walk"] = ACT_WALK,
	["stand_grenade_idle"] = ACT_IDLE,
	["stand_grenade_run"] = ACT_RUN,
	["grenade_attack"] = ACT_COMBINE_THROW_GRENADE,
	["grenade_reload"] = ACT_COMBINE_THROW_GRENADE,

	["crouch_pistol_aim_idle"] = ACT_COVER_SMG1_LOW,
	["crouch_pistol_aim_walk"] = ACT_WALK_CROUCH,
	["stand_pistol_aim_walk"] = ACT_WALK_AIM_PISTOL,
	["stand_pistol_aim_idle"] = ACT_IDLE_ANGRY_PISTOL,
	["stand_pistol_aim_run"] = ACT_RUN_AIM_PISTOL,
	["crouch_pistol_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_pistol_walk"] = ACT_WALK_CROUCH,
	["stand_pistol_walk"] = ACT_WALK_PISTOL,
	["stand_pistol_idle"] = ACT_IDLE_PISTOL,
	["stand_pistol_run"] = ACT_RUN_PISTOL,
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_PISTOL,
	["pistol_reload"] = ACT_GESTURE_RELOAD_PISTOL,

	["crouch_heavy_aim_idle"] = ACT_COVER_SMG1_LOW,
	["crouch_heavy_aim_walk"] = ACT_WALK_CROUCH,
	["stand_heavy_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_heavy_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_heavy_walk"] = ACT_WALK_CROUCH,
	["crouch_heavy_idle"] = ACT_COVER_SMG1_LOW,
	["stand_heavy_walk"] = ACT_WALK_RIFLE,
	["stand_heavy_idle"] = ACT_IDLE_SMG1,
	["stand_heavy_run"] = ACT_RUN_RIFLE,
	["heavy_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,

	["crouch_melee_aim_idle"] = ACT_COVER_SMG1_LOW,
	["crouch_melee_aim_walk"] = ACT_WALK_CROUCH,
	["stand_melee_aim_idle"] = ACT_IDLE_ANGRY_MELEE,
	["stand_melee_aim_walk"] = ACT_WALK_ANGRY,
	["stand_melee_aim_run"] = ACT_RUN,
	["crouch_melee_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_melee_walk"] = ACT_WALK_CROUCH,
	["stand_melee_walk"] = ACT_WALK,
	["stand_melee_idle"] = ACT_IDLE,
	["stand_melee_run"] = ACT_RUN,
	["melee_attack"] = ACT_MELEE_ATTACK_SWING_GESTURE,
	["melee_reload"] = ACT_MELEE_ATTACK_SWING_GESTURE,

	["crouch_fist_aim_walk"] = ACT_WALK_CROUCH,
	["crouch_fist_aim_idle"] = ACT_COVER_SMG1_LOW,
	["stand_fist_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_fist_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_fist_aim_run"] = ACT_RUN_RIFLE,
	["crouch_fist_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_fist_walk"] = ACT_WALK_CROUCH,
	["stand_fist_walk"] = ACT_WALK,
	["stand_fist_idle"] = ACT_IDLE,
	["stand_fist_run"] = ACT_RUN,
	["fist_attack"] = ACT_MELEE_ATTACK_SWING_GESTURE,
	["fist_reload"] = ACT_MELEE_ATTACK_SWING_GESTURE,

	["crouch_slam_aim_walk"] = ACT_WALK_CROUCH,
	["crouch_slam_aim_idle"] = ACT_RANGE_AIM_PISTOL_LOW,
	["stand_slam_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["stand_slam_aim_walk"] = ACT_WALK_RIFLE,
	["stand_slam_aim_run"] = ACT_RUN_RIFLE,
	["crouch_slam_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_slam_walk"] = ACT_WALK_CROUCH,
	["stand_slam_idle"] = ACT_IDLE,
	["stand_slam_walk"] = ACT_WALK,
	["stand_slam_run"] = ACT_RUN,
	["slam_attack"] = ACT_PICKUP_GROUND,
	["slam_reload"] = ACT_PICKUP_GROUND,
	
	["crouch_smg_aim_walk"] = ACT_WALK_CROUCH,
	["crouch_smg_aim_idle"] = ACT_COVER_SMG1_LOW,
	["stand_smg_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_smg_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_smg_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_smg_walk"] = ACT_WALK_CROUCH,
	["crouch_smg_idle"] = ACT_COVER_SMG1_LOW,
	["stand_smg_idle"] = ACT_IDLE_SMG1,
	["stand_smg_walk"] = ACT_WALK_RIFLE,
	["stand_smg_run"] = ACT_RUN_RIFLE,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,

	["crouch_ar2_aim_walk"] = ACT_WALK_CROUCH,
	["crouch_ar2_aim_idle"] = ACT_COVER_SMG1_LOW,
	["stand_ar2_aim_idle"] = "SMGcover",
	["stand_ar2_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_ar2_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_ar2_walk"] = ACT_WALK_CROUCH,
	["crouch_ar2_idle"] = ACT_COVER_SMG1_LOW,
	["stand_ar2_idle"] = ACT_IDLE_SMG1,
	["stand_ar2_walk"] = ACT_WALK_RIFLE,
	["stand_ar2_run"] = ACT_RUN_RIFLE,
	["ar2_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["ar2_reload"] = ACT_GESTURE_RELOAD_SMG1,
	
	["crouch_shotgun_aim_walk"] = ACT_WALK_CROUCH,
	["crouch_shotgun_aim_idle"] = ACT_COVER_SMG1_LOW,
	["stand_shotgun_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_shotgun_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_shotgun_aim_run"] = ACT_RUN_AIM_RIFLE,
	["crouch_shotgun_walk"] = ACT_WALK_CROUCH,
	["crouch_shotgun_idle"] = ACT_COVER_SMG1_LOW,
	["stand_shotgun_idle"] = ACT_IDLE_SMG1,
	["stand_shotgun_walk"] = ACT_WALK_RIFLE,
	["stand_shotgun_run"] = ACT_RUN_RIFLE,
	["shotgun_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["shotgun_reload"] = ACT_GESTURE_RELOAD_SMG1,
	
	["crouch_suitcase_aim_idle"] = ACT_COVER_SMG1_LOW,
	["crouch_suitcase_aim_walk"] = ACT_WALK_CROUCH,
	["stand_suitcase_aim_idle"] = ACT_IDLE_ANGRY_MELEE,
	["stand_suitcase_aim_walk"] = ACT_WALK_ANGRY,
	["stand_suitcase_aim_run"] = ACT_RUN,
	["crouch_suitcase_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_suitcase_walk"] = ACT_WALK_CROUCH,
	["stand_suitcase_walk"] = ACT_WALK,
	["stand_suitcase_idle"] = ACT_IDLE,
	["stand_suitcase_run"] = ACT_RUN,

	["crouch_idle"] = ACT_COVER_PISTOL_LOW,
	["crouch_walk"] = ACT_WALK_CROUCH,
	["stand_idle"] = ACT_IDLE,
	["stand_walk"] = ACT_WALK,
	["stand_run"] = ACT_RUN,
	["jump"] = ACT_JUMP,
	["sit"] = ACT_COVER_PISTOL_LOW,
	["hands"] = {
		body = 0000000,
		model = "models/weapons/c_arms_combine.mdl",
		skin = 0
	}
};

Clockwork.animation.stored.femaleHuman = {
	["crouch_grenade_aim_idle"] = ACT_COVER_LOW,
	["crouch_grenade_aim_walk"] = ACT_WALK_CROUCH,
	["stand_grenade_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["crouch_pistol_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_grenade_aim_walk"] = ACT_WALK,
	["crouch_pistol_aim_walk"] = ACT_WALK_CROUCH_AIM_RIFLE,
	["crouch_heavy_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_melee_aim_idle"] = ACT_COWER,
	["stand_grenade_aim_run"] = ACT_RUN,
	["crouch_melee_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_pistol_aim_walk"] = ACT_WALK_AIM_PISTOL,
	["stand_pistol_aim_idle"] = ACT_IDLE_ANGRY_PISTOL,
	["crouch_fist_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["crouch_slam_aim_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_pistol_aim_run"] = ACT_RUN_AIM_PISTOL,
	["crouch_fist_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_heavy_aim_idle"] = ACT_IDLE_ANGRY_RPG,
	["stand_melee_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["crouch_slam_aim_idle"] = ACT_COVER_LOW_RPG,
	["stand_melee_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_fist_aim_idle"] = ACT_RANGE_ATTACK_SMG1,
	["crouch_smg_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["crouch_smg_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_fist_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_melee_aim_run"] = ACT_RUN,
	["stand_heavy_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_grenade_walk"] = ACT_WALK_CROUCH,
	["crouch_grenade_idle"] = ACT_COVER_LOW,
	["stand_slam_aim_idle"] = ACT_IDLE_PACKAGE,
	["stand_slam_aim_walk"] = ACT_WALK_PACKAGE,
	["stand_slam_aim_run"] = ACT_RUN_RPG,
	["stand_smg_aim_idle"] = ACT_RANGE_ATTACK_SMG1,
	["stand_smg_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_fist_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_pistol_idle"] = ACT_COVER_LOW,
	["stand_grenade_walk"] = ACT_WALK,
	["crouch_pistol_walk"] = ACT_WALK_CROUCH,
	["stand_grenade_idle"] = ACT_IDLE,
	["stand_grenade_run"] = ACT_RUN,
	["crouch_melee_idle"] = ACT_COVER_LOW,
	["stand_pistol_walk"] = ACT_WALK,
	["crouch_melee_walk"] = ACT_WALK_CROUCH,
	["crouch_heavy_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_pistol_idle"] = ACT_IDLE_PISTOL,
	["crouch_heavy_idle"] = ACT_COVER_LOW_RPG,
	["stand_smg_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["stand_heavy_walk"] = ACT_WALK_RPG_RELAXED,
	["stand_melee_walk"] = ACT_WALK,
	["stand_melee_idle"] = ACT_IDLE,
	["crouch_fist_idle"] = ACT_COVER_LOW,
	["crouch_fist_walk"] = ACT_WALK_CROUCH,
	["crouch_slam_idle"] = ACT_COVER,
	["stand_pistol_run"] = ACT_RUN,
	["stand_heavy_idle"] = ACT_IDLE_SHOTGUN_AGITATED,
	["crouch_slam_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_heavy_run"] = ACT_RUN_RPG_RELAXED,
	["stand_slam_idle"] = ACT_IDLE,
	["stand_fist_walk"] = ACT_WALK,
	["stand_slam_walk"] = ACT_WALK_SUITCASE,
	["stand_melee_run"] = ACT_RUN,
	["crouch_smg_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_smg_idle"] = ACT_COVER_LOW_RPG,
	["stand_fist_idle"] = ACT_IDLE,
	["stand_slam_run"] = ACT_RUN,
	["grenade_attack"] = ACT_RANGE_ATTACK_THROW,
	["stand_smg_idle"] = ACT_IDLE_SMG1_RELAXED,
	["stand_fist_run"] = ACT_RUN,
	["stand_smg_walk"] = ACT_WALK_RIFLE_RELAXED,
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["stand_smg_run"] = ACT_RUN_RIFLE_STIMULATED,
	["pistol_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["melee_attack"] = ACT_MELEE_ATTACK_SWING,
	["crouch_idle"] = ACT_COVER_LOW,
	["crouch_walk"] = ACT_WALK_CROUCH,
	["slam_attack"] = ACT_PICKUP_GROUND,
	["stand_idle"] = ACT_IDLE,
	["stand_walk"] = ACT_WALK,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_ar2_idle"] = ACT_COVER_LOW_RPG,
	["crouch_ar2_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_ar2_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_ar2_aim_walk"] = ACT_WALK_CROUCH_AIM_RIFLE,
	["stand_ar2_idle"] = ACT_IDLE_RPG_RELAXED,
	["stand_ar2_aim_idle"] = ACT_IDLE_AIM_RIFLE_STIMULATED,
	["stand_ar2_walk"] = ACT_WALK_RPG,
	["stand_ar2_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_ar2_run"] = ACT_RUN_RPG,
	["stand_ar2_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["ar2_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["ar2_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_shotgun_idle"] = ACT_COVER_LOW_RPG,
	["crouch_shotgun_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_shotgun_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_shotgun_aim_walk"] = ACT_WALK_CROUCH_AIM_RIFLE,
	["stand_shotgun_idle"] = ACT_IDLE_SHOTGUN_RELAXED,
	["stand_shotgun_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_shotgun_walk"] = ACT_WALK_RPG,
	["stand_shotgun_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_shotgun_run"] = ACT_RUN_RPG,
	["stand_shotgun_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["shotgun_attack"] = ACT_GESTURE_RANGE_ATTACK_SHOTGUN,
	["shotgun_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_suitcase_idle"] = ACT_COVER_LOW_RPG,
	["crouch_suitcase_aim_idle"] = ACT_COVER_LOW_RPG,
	["crouch_suitcase_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_suitcase_aim_walk"] = ACT_WALK_CROUCH,
	["stand_suitcase_idle"] = ACT_IDLE,
	["stand_suitcase_aim_idle"] = ACT_IDLE,
	["stand_suitcase_walk"] = ACT_WALK,
	["stand_suitcase_aim_walk"] = ACT_WALK,
	["stand_suitcase_run"] = ACT_RUN,
	["stand_suitcase_aim_run"] = ACT_RUN,
	["stand_run"] = ACT_RUN,
	["jump"] = ACT_JUMP,
	["sit"] = ACT_BUSY_SIT_CHAIR
};

Clockwork.animation.stored.maleHuman = {
	["crouch_grenade_aim_idle"] = ACT_COVER_LOW,
	["crouch_grenade_aim_walk"] = ACT_WALK_CROUCH,
	["stand_grenade_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["crouch_pistol_aim_idle"] = ACT_RANGE_ATTACK_PISTOL_LOW,
	["stand_grenade_aim_walk"] = ACT_WALK,
	["crouch_pistol_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["crouch_heavy_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_melee_aim_idle"] = ACT_COWER,
	["stand_grenade_aim_run"] = ACT_RUN,
	["crouch_melee_aim_walk"] = ACT_WALK_CROUCH_RIFLE,
	["crouch_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_pistol_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_pistol_aim_idle"] = ACT_RANGE_ATTACK_PISTOL,
	["crouch_fist_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["crouch_slam_aim_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_pistol_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_fist_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_heavy_aim_idle"] = ACT_IDLE_ANGRY_RPG,
	["stand_melee_aim_idle"] = ACT_IDLE_ANGRY_MELEE,
	["crouch_slam_aim_idle"] = ACT_COVER_LOW_RPG,
	["stand_melee_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_heavy_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_fist_aim_idle"] = ACT_RANGE_ATTACK_SMG1,
	["crouch_smg_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["crouch_smg_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_fist_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_melee_aim_run"] = ACT_RUN,
	["stand_heavy_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_grenade_walk"] = ACT_WALK_CROUCH,
	["crouch_grenade_idle"] = ACT_COVER_LOW,
	["stand_slam_aim_idle"] = ACT_IDLE_PACKAGE,
	["stand_slam_aim_walk"] = ACT_WALK_PACKAGE,
	["stand_slam_aim_run"] = ACT_RUN_RPG,
	["stand_smg_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_smg_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_fist_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_pistol_idle"] = ACT_COVER_LOW,
	["stand_grenade_walk"] = ACT_WALK,
	["crouch_pistol_walk"] = ACT_WALK_CROUCH,
	["stand_grenade_idle"] = ACT_IDLE,
	["stand_grenade_run"] = ACT_RUN,
	["crouch_melee_idle"] = ACT_COVER_LOW,
	["stand_pistol_walk"] = ACT_WALK,
	["crouch_melee_walk"] = ACT_WALK_CROUCH,
	["crouch_heavy_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_pistol_idle"] = ACT_IDLE,
	["crouch_heavy_idle"] = ACT_COVER_LOW_RPG,
	["stand_smg_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["stand_heavy_walk"] = ACT_WALK_RPG_RELAXED,
	["stand_melee_walk"] = ACT_WALK,
	["stand_melee_idle"] = ACT_IDLE,
	["crouch_fist_idle"] = ACT_COVER_LOW,
	["crouch_fist_walk"] = ACT_WALK_CROUCH,
	["crouch_slam_idle"] = ACT_COVER,
	["stand_pistol_run"] = ACT_RUN,
	["stand_heavy_idle"] = ACT_IDLE_SHOTGUN_AGITATED,
	["crouch_slam_walk"] = ACT_WALK_CROUCH_RPG,
	["stand_heavy_run"] = ACT_RUN_RPG_RELAXED,
	["stand_slam_idle"] = ACT_IDLE_SUITCASE,
	["stand_fist_walk"] = ACT_WALK,
	["stand_slam_walk"] = ACT_WALK_SUITCASE,
	["stand_melee_run"] = ACT_RUN,
	["crouch_smg_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_smg_idle"] = ACT_COVER_LOW_RPG,
	["stand_fist_idle"] = ACT_IDLE,
	["stand_slam_run"] = ACT_RUN,
	["grenade_attack"] = ACT_RANGE_ATTACK_THROW,
	["stand_smg_idle"] = ACT_IDLE_SMG1_RELAXED,
	["stand_fist_run"] = ACT_RUN,
	["stand_smg_walk"] = ACT_WALK_RIFLE_RELAXED,
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["stand_smg_run"] = ACT_RUN_RPG_RELAXED,
	["pistol_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_AR2,
	["melee_attack"] = ACT_MELEE_ATTACK_SWING,
	["crouch_idle"] = ACT_COVER_LOW,
	["crouch_walk"] = ACT_WALK_CROUCH,
	["slam_attack"] = ACT_PICKUP_GROUND,
	["stand_idle"] = ACT_IDLE,
	["stand_walk"] = ACT_WALK,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_ar2_idle"] = ACT_COVER_LOW_RPG,
	["crouch_ar2_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_ar2_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_ar2_aim_walk"] = ACT_WALK_CROUCH_AIM_RIFLE,
	["stand_ar2_idle"] = ACT_IDLE_RPG_RELAXED,
	["stand_ar2_aim_idle"] = ACT_IDLE_AIM_RIFLE_STIMULATED,
	["stand_ar2_walk"] = ACT_WALK_RPG_RELAXED,
	["stand_ar2_aim_walk"] = ACT_WALK_AIM_RIFLE_STIMULATED,
	["stand_ar2_run"] = ACT_RUN_RPG_RELAXED,
	["stand_ar2_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["ar2_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["ar2_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_shotgun_idle"] = ACT_COVER_LOW_RPG,
	["crouch_shotgun_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_shotgun_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_shotgun_aim_walk"] = ACT_WALK_CROUCH_AIM_RIFLE,
	["stand_shotgun_idle"] = ACT_IDLE_SHOTGUN_RELAXED,
	["stand_shotgun_aim_idle"] = ACT_IDLE_ANGRY_SMG1,
	["stand_shotgun_walk"] = ACT_WALK_RPG,
	["stand_shotgun_aim_walk"] = ACT_WALK_AIM_RIFLE,
	["stand_shotgun_run"] = ACT_RUN_RPG,
	["stand_shotgun_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["shotgun_attack"] = ACT_GESTURE_RANGE_ATTACK_SHOTGUN,
	["shotgun_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["crouch_suitcase_idle"] = ACT_COVER_LOW_RPG,
	["crouch_suitcase_aim_idle"] = ACT_COVER_LOW_RPG,
	["crouch_suitcase_walk"] = ACT_WALK_CROUCH_RPG,
	["crouch_suitcase_aim_walk"] = ACT_WALK_CROUCH,
	["stand_suitcase_idle"] = ACT_IDLE_SUITCASE,
	["stand_suitcase_aim_idle"] = ACT_IDLE_SUITCASE,
	["stand_suitcase_walk"] = ACT_WALK_SUITCASE,
	["stand_suitcase_aim_walk"] = ACT_WALK_SUITCASE,
	["stand_suitcase_run"] = ACT_RUN,
	["stand_suitcase_aim_run"] = ACT_RUN,
	["stand_run"] = ACT_RUN,
	["jump"] = ACT_JUMP,
	["sit"] = ACT_BUSY_SIT_CHAIR
};

Clockwork.animation.stored.zombie = {
	["crouch_grenade_aim_idle"] = ACT_COVER_LOW,
	["crouch_grenade_aim_walk"] = ACT_WALK,
	["stand_grenade_aim_idle"] = ACT_IDLE,
	["crouch_pistol_aim_idle"] = ACT_RANGE_ATTACK_PISTOL_LOW,
	["stand_grenade_aim_walk"] = ACT_WALK,
	["crouch_pistol_aim_walk"] = ACT_WALK,
	["crouch_heavy_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["crouch_melee_aim_idle"] = ACT_COWER,
	["stand_grenade_aim_run"] = ACT_RUN,
	["crouch_melee_aim_walk"] = ACT_WALK,
	["crouch_heavy_aim_walk"] = ACT_WALK,
	["stand_pistol_aim_walk"] = ACT_WALK,
	["stand_pistol_aim_idle"] = ACT_RANGE_ATTACK_PISTOL,
	["crouch_fist_aim_walk"] = ACT_WALK,
	["crouch_slam_aim_walk"] = ACT_WALK,
	["stand_pistol_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_fist_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_heavy_aim_idle"] = ACT_IDLE_ANGRY_RPG,
	["stand_melee_aim_idle"] = ACT_IDLE_MANNEDGUN,
	["crouch_slam_aim_idle"] = ACT_COVER_LOW_RPG,
	["stand_melee_aim_walk"] = ACT_WALK,
	["stand_heavy_aim_walk"] = ACT_WALK,
	["stand_fist_aim_idle"] = ACT_RANGE_ATTACK_SMG1,
	["crouch_smg_aim_walk"] = ACT_WALK,
	["crouch_smg_aim_idle"] = ACT_RANGE_AIM_SMG1_LOW,
	["stand_fist_aim_walk"] = ACT_WALK,
	["stand_melee_aim_run"] = ACT_RUN,
	["stand_heavy_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_grenade_walk"] = ACT_WALK,
	["crouch_grenade_idle"] = ACT_COVER_LOW,
	["stand_slam_aim_idle"] = ACT_IDLE_PACKAGE,
	["stand_slam_aim_walk"] = ACT_WALK,
	["stand_slam_aim_run"] = ACT_RUN_RPG,
	["stand_smg_aim_idle"] = ACT_RANGE_ATTACK_SMG1,
	["stand_smg_aim_walk"] = ACT_WALK,
	["stand_fist_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["crouch_pistol_idle"] = ACT_COVER_LOW,
	["stand_grenade_walk"] = ACT_WALK,
	["crouch_pistol_walk"] = ACT_WALK,
	["stand_grenade_idle"] = ACT_IDLE,
	["stand_grenade_run"] = ACT_RUN,
	["crouch_melee_idle"] = ACT_COVER_LOW,
	["stand_pistol_walk"] = ACT_WALK,
	["crouch_melee_walk"] = ACT_WALK,
	["crouch_heavy_walk"] = ACT_WALK,
	["stand_pistol_idle"] = ACT_IDLE,
	["crouch_heavy_idle"] = ACT_COVER_LOW_RPG,
	["stand_smg_aim_run"] = ACT_RUN_AIM_RIFLE_STIMULATED,
	["stand_heavy_walk"] = ACT_WALK,
	["stand_melee_walk"] = ACT_WALK,
	["stand_melee_idle"] = ACT_IDLE,
	["crouch_fist_idle"] = ACT_COVER_LOW,
	["crouch_fist_walk"] = ACT_WALK,
	["crouch_slam_idle"] = ACT_COVER,
	["stand_pistol_run"] = ACT_RUN,
	["stand_heavy_idle"] = ACT_IDLE_SHOTGUN_AGITATED,
	["crouch_slam_walk"] = ACT_WALK,
	["stand_heavy_run"] = ACT_RUN_RPG_RELAXED,
	["stand_slam_idle"] = ACT_IDLE_SUITCASE,
	["stand_fist_walk"] = ACT_WALK,
	["stand_slam_walk"] = ACT_WALK,
	["stand_melee_run"] = ACT_RUN,
	["crouch_smg_walk"] = ACT_WALK,
	["crouch_smg_idle"] = ACT_COVER_LOW_RPG,
	["stand_fist_idle"] = ACT_IDLE,
	["stand_slam_run"] = ACT_RUN,
	["grenade_attack"] = ACT_RANGE_ATTACK_THROW,
	["stand_smg_idle"] = ACT_IDLE_RPG,
	["stand_fist_run"] = ACT_RUN,
	["stand_smg_walk"] = ACT_WALK,
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["stand_smg_run"] = ACT_RUN_RPG_RELAXED,
	["pistol_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_AR2,
	["melee_attack"] = ACT_MELEE_ATTACK_SWING,
	["crouch_idle"] = ACT_COVER_LOW,
	["crouch_walk"] = ACT_WALK,
	["slam_attack"] = ACT_PICKUP_GROUND,
	["stand_idle"] = ACT_IDLE,
	["stand_walk"] = ACT_WALK,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["stand_run"] = ACT_RUN,
	["jump"] = ACT_GLIDE,
	["sit"] = ACT_BUSY_SIT_CHAIR
}

Clockwork.animation.stored.vortigaunt = {
	["crouch_grenade_aim_idle"] = "CrouchIdle",
	["crouch_grenade_aim_walk"] = ACT_WALK,
	["stand_grenade_aim_idle"] = ACT_IDLE,
	["crouch_pistol_aim_idle"] = "CrouchIdle",
	["stand_grenade_aim_walk"] = ACT_WALK,
	["crouch_pistol_aim_walk"] = "Walk_all_TC",
	["crouch_heavy_aim_idle"] = "CrouchIdle",
	["crouch_melee_aim_idle"] = "CrouchIdle",
	["stand_grenade_aim_run"] = ACT_RUN,
	["crouch_melee_aim_walk"] = "Walk_all_TC",
	["crouch_heavy_aim_walk"] = "Walk_all_TC",
	["stand_pistol_aim_walk"] = "Walk_all_TC",
	["stand_pistol_aim_idle"] = "TCidlecombat",
	["crouch_fist_aim_walk"] = "Walk_all_TC",
	["crouch_slam_aim_walk"] = "Walk_all_HoldPart",
	["stand_pistol_aim_run"] = "run_all_TC",
	["crouch_fist_aim_idle"] = "TCidlecombat",
	["stand_heavy_aim_idle"] = "TCidlecombat",
	["stand_melee_aim_idle"] = "TCidlecombat",
	["crouch_slam_aim_idle"] = "CrouchIdle",
	["stand_melee_aim_walk"] = "Walk_all_TC",
	["stand_heavy_aim_walk"] = "Walk_all_TC",
	["stand_fist_aim_idle"] = "TCidle",
	["crouch_smg_aim_walk"] = "Walk_all_TC",
	["crouch_smg_aim_idle"] = "TCidlecombat",
	["stand_fist_aim_walk"] = "Walk_all_TC",
	["stand_melee_aim_run"] = ACT_RUN,
	["stand_heavy_aim_run"] = "run_all_TC",
	["crouch_grenade_walk"] = ACT_WALK,
	["crouch_grenade_idle"] = "CrouchIdle",
	["stand_slam_aim_idle"] = "lab_partInstall_idle",
	["stand_slam_aim_walk"] = "Walk_all_HoldPart",
	["stand_slam_aim_run"] = ACT_RUN,
	["stand_smg_aim_idle"] = "TCidlecombat",
	["stand_smg_aim_walk"] = "Walk_all_TC",
	["stand_fist_aim_run"] = "run_all_TC",
	["crouch_pistol_idle"] = "CrouchIdle",
	["stand_grenade_walk"] = ACT_WALK,
	["crouch_pistol_walk"] = ACT_WALK,
	["stand_grenade_idle"] = ACT_IDLE,
	["stand_grenade_run"] = ACT_RUN,
	["crouch_melee_idle"] = "CrouchIdle",
	["stand_pistol_walk"] = ACT_WALK,
	["crouch_melee_walk"] = ACT_WALK,
	["crouch_heavy_walk"] = "Walk_all_TC",
	["stand_pistol_idle"] = ACT_IDLE,
	["crouch_heavy_idle"] = "CrouchIdle",
	["stand_smg_aim_run"] = "run_all_TC",
	["stand_heavy_walk"] = "Walk_all_TC",
	["stand_melee_walk"] = ACT_WALK,
	["stand_melee_idle"] = ACT_IDLE,
	["crouch_fist_idle"] = "CrouchIdle",
	["crouch_fist_walk"] = ACT_WALK,
	["crouch_slam_idle"] = "CrouchIdle",
	["stand_pistol_run"] = ACT_RUN,
	["stand_heavy_idle"] = "TCidle",
	["crouch_slam_walk"] = "Walk_all_TC",
	["stand_heavy_run"] = "run_all_TC",
	["stand_slam_idle"] = "lab_partInstall_idle",
	["stand_fist_walk"] = ACT_WALK,
	["stand_slam_walk"] = "Walk_all_HoldPart",
	["stand_melee_run"] = ACT_RUN,
	["crouch_smg_walk"] = "Walk_all_TC",
	["crouch_smg_idle"] = "CrouchIdle",
	["stand_fist_idle"] = ACT_IDLE,
	["stand_slam_run"] = ACT_RUN,
	["stand_smg_idle"] = "TCidle",
	["stand_fist_run"] = ACT_RUN,
	["stand_smg_walk"] = "Walk_all_TC",
	["stand_smg_run"] = "run_all_TC",
	["crouch_idle"] = "CrouchIdle",
	["crouch_walk"] = ACT_WALK,
	["stand_idle"] = ACT_IDLE,
	["stand_walk"] = ACT_WALK,
	["stand_run"] = ACT_RUN,
	["jump"] = "Walk_all_TC",
	["sit"] = "chess_wait"
}

Clockwork.animation.stored.player = {
	["crouch_grenade_aim_idle"] = "cidle_grenade",
	["crouch_grenade_aim_walk"] = "cwalk_grenade",
	["stand_grenade_aim_idle"] = "idle_grenade",
	["crouch_pistol_aim_idle"] = "cidle_revolver",
	["stand_grenade_aim_walk"] = "walk_grenade",
	["crouch_pistol_aim_walk"] = "cwalk_revolver",
	["crouch_heavy_aim_idle"] = "cidle_physgun",
	["crouch_melee_aim_idle"] = "cidle_melee",
	["stand_grenade_aim_run"] = "run_grenade",
	["crouch_melee_aim_walk"] = "cwalk_melee",
	["crouch_heavy_aim_walk"] = "cwalk_physgun",
	["stand_pistol_aim_walk"] = "walk_revolver",
	["stand_pistol_aim_idle"] = "idle_revolver",
	["crouch_fist_aim_walk"] = "cwalk_fist",
	["crouch_slam_aim_walk"] = "cwalk_slam",
	["stand_pistol_aim_run"] = "run_revolver",
	["crouch_fist_aim_idle"] = "cidle_fist",
	["stand_heavy_aim_idle"] = "idle_physgun",
	["stand_melee_aim_idle"] = "idle_melee",
	["crouch_slam_aim_idle"] = "cidle_slam",
	["stand_melee_aim_walk"] = "walk_melee",
	["stand_heavy_aim_walk"] = "walk_physgun",
	["stand_fist_aim_idle"] = "idle_fist",
	["crouch_smg_aim_walk"] = "cwalk_smg1",
	["crouch_smg_aim_idle"] = "cidle_smg1",
	["stand_fist_aim_walk"] = "walk_fist",
	["stand_melee_aim_run"] = "run_melee",
	["stand_heavy_aim_run"] = "run_physgun",
	["crouch_grenade_walk"] = "cwalk_all",
	["crouch_grenade_idle"] = "cidle_all",
	["stand_slam_aim_idle"] = "idle_slam",
	["stand_slam_aim_walk"] = "walk_slam",
	["stand_slam_aim_run"] = "run_slam",
	["stand_smg_aim_idle"] = "idle_smg1",
	["stand_smg_aim_walk"] = "walk_smg1",
	["stand_fist_aim_run"] = ACT_MP_RUN,
	["crouch_pistol_idle"] = ACT_MP_CROUCH_IDLE,
	["stand_grenade_walk"] = ACT_MP_WALK,
	["crouch_pistol_walk"] = ACT_MP_CROUCHWALK,
	["stand_grenade_idle"] = ACT_MP_STAND_IDLE,
	["stand_grenade_run"] = ACT_MP_RUN,
	["crouch_melee_idle"] = ACT_MP_CROUCH_IDLE,
	["stand_pistol_walk"] = ACT_MP_WALK,
	["crouch_melee_walk"] = "cwalk_all",
	["crouch_heavy_walk"] = "cwalk_passive",
	["stand_pistol_idle"] = ACT_MP_STAND_IDLE,
	["crouch_heavy_idle"] = "cidle_passive",
	["stand_smg_aim_run"] = "run_smg1",
	["stand_heavy_walk"] = "walk_passive",
	["stand_melee_walk"] = ACT_MP_WALK,
	["stand_melee_idle"] = ACT_MP_STAND_IDLE,
	["crouch_fist_idle"] = ACT_MP_CROUCH_IDLE,
	["crouch_fist_walk"] = "cwalk_all",
	["crouch_slam_idle"] = ACT_MP_CROUCH_IDLE,
	["stand_pistol_run"] = ACT_MP_RUN,
	["stand_heavy_idle"] = "idle_passive",
	["crouch_slam_walk"] = "cwalk_all",
	["stand_heavy_run"] = "run_passive",
	["stand_slam_idle"] = ACT_MP_STAND_IDLE,
	["stand_fist_walk"] = ACT_MP_WALK,
	["stand_slam_walk"] = ACT_MP_WALK,
	["stand_melee_run"] = ACT_MP_RUN,
	["crouch_smg_walk"] = "cwalk_passive",
	["crouch_smg_idle"] = "cidle_passive",
	["stand_fist_idle"] = ACT_MP_STAND_IDLE,
	["stand_slam_run"] = ACT_MP_RUN,
	["grenade_attack"] = ACT_RANGE_ATTACK_THROW,
	["stand_smg_idle"] = "idle_passive",
	["stand_fist_run"] = ACT_MP_RUN,
	["stand_smg_walk"] = "walk_passive",
	["pistol_attack"] = ACT_GESTURE_RANGE_ATTACK_PISTOL,
	["stand_smg_run"] = "run_passive",
	["pistol_reload"] = ACT_GESTURE_RELOAD_PISTOL,
	["heavy_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["heavy_attack"] = ACT_GESTURE_RANGE_ATTACK_AR2,
	["melee_attack"] = ACT_MELEE_ATTACK_SWING,
	["crouch_idle"] = ACT_COVER_LOW,
	["crouch_walk"] = ACT_WALK,
	["slam_attack"] = ACT_PICKUP_GROUND,
	["stand_idle"] = ACT_MP_STAND_IDLE,
	["stand_walk"] = ACT_WALK,
	["smg_attack"] = ACT_GESTURE_RANGE_ATTACK_SMG1,
	["smg_reload"] = ACT_GESTURE_RELOAD_SMG1,
	["stand_run"] = ACT_MP_RUN,
	["jump"] = ACT_MP_JUMP,
	["sit"] = ACT_BUSY_SIT_CHAIR
}

--[[
	@codebase Shared
	@details A function to set a model's menu sequence.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for sequence.
	@returns {Unknown}
--]]
function Clockwork.animation:SetMenuSequence(model, sequence)
	self.sequences[string.lower(model)] = sequence
end

--[[
	@codebase Shared
	@details A function to get a model's menu sequence.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for bRandom.
	@returns {Unknown}
--]]
function Clockwork.animation:GetMenuSequence(model, bRandom)
	local lowerModel = string.lower(model)
	local sequence = self.sequences[lowerModel]

	if sequence then
		if type(sequence) == "table" then
			if bRandom then
				return sequence[math.random(1, #sequence)]
			else
				return sequence
			end
		else
			return sequence
		end
	end
end

--[[
	@codebase Shared
	@details A function to add a model.
	@param {Unknown} Missing description for class.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddModel(class, model)
	local lowerModel = string.lower(model)
	self.models[lowerModel] = class

	return lowerModel
end

--[[
	@codebase Shared
	@details A function to add an override.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for key.
	@param {Unknown} Missing description for value.
	@returns {Unknown}
--]]
function Clockwork.animation:AddOverride(model, key, value)
	local lowerModel = string.lower(model)

	if not self.override[lowerModel] then
		self.override[lowerModel] = {}
	end

	self.override[lowerModel][key] = value
end

--[[
	@codebase Shared
	@details A function to get an animation for a model.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for key.
	@returns {Unknown}
--]]
function Clockwork.animation:GetForModel(model, key)
	if not model then
		debug.Trace()

		return false
	end

	local lowerModel = string.lower(model)
	local animTable = self:GetTable(lowerModel)
	local overrideTable = self.override[lowerModel]
	local finalAnimation = animTable[key]

	if overrideTable and overrideTable[key] then
		finalAnimation = overrideTable[key]
	end

	return finalAnimation
end

--[[
	@codebase Shared
	@details A function to get a model's class.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for alwaysReal.
	@returns {Unknown}
--]]
function Clockwork.animation:GetModelClass(model, alwaysReal)
	local modelClass = self.models[string.lower(model)]

	if not modelClass then
		if not alwaysReal then return "maleHuman" end
	else
		return modelClass
	end
end

--[[
	@codebase Shared
	@details A function to add a vortigaunt model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddVortigauntModel(model)
	return self:AddModel("vortigaunt", model)
end

-- A function to add an animal model.
function Clockwork.animation:AddWildlifeModel(model)
	return self:AddModel("wildlife", model);
end;

--[[
	@codebase Shared
	@details A function to add a Combine Overwatch model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddCombineOverwatchModel(model)
	return self:AddModel("combineOverwatch", model)
end

--[[
	@codebase Shared
	@details A function to add a Civil Protection model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddCivilProtectionModel(model)
	return self:AddModel("civilProtection", model)
end

--[[
	@codebase Shared
	@details A function to add a female human model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddFemaleHumanModel(model)
	return self:AddModel("femaleHuman", model)
end

--[[
	@codebase Shared
	@details A function to add a male human model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddMaleHumanModel(model)
	return self:AddModel("maleHuman", model)
end

--[[
	@codebase Shared
	@details A function to get a weapon's hold type.
	@param {Unknown} Missing description for player.
	@param {Unknown} Missing description for weapon.
	@returns {Unknown}
--]]
function Clockwork.animation:GetWeaponHoldType(player, weapon)
	local class = string.lower(weapon:GetClass())
	local holdType = "fist"

	if self.holdTypes[class] then
		holdType = self.holdTypes[class]
	elseif IsValid(weapon) then
		local _holdType = weapon.HoldType or weapon:GetHoldType()
		holdType = self.convert[_holdType] or _holdType
	else
		local act = player:Weapon_TranslateActivity(ACT_HL2MP_IDLE) or -1

		if act ~= -1 and self.convert[act] then
			holdType = self.convert[act]
		end
	end

	return string.lower(holdType)
end

--[[
	@codebase Shared
	@details A function to get an animation table.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:GetTable(model)
	local lowerModel = string.lower(model)
	local class = self.models[lowerModel]

	if class and self.stored[class] then
		return self.stored[class]
	elseif string.find(lowerModel, "/player/") then
		return self.stored.player
	elseif string.find(lowerModel, "female") then
		return self.stored.femaleHuman
	else
		return self.stored.maleHuman
	end
end

local handsModels = {}
local blackModels = {}

--[[
	@codebase Shared
	@details A function to add viewmodel c_arms info to a model.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for hands.
	@returns {Unknown}
--]]
function Clockwork.animation:AddHandsModel(model, hands)
	handsModels[string.lower(model)] = hands
end

--[[
	@codebase Shared
	@details A function to make a model use the black skin for hands viewmodels.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddBlackModel(model)
	blackModels[string.lower(model)] = true
end

--[[
	@codebase Shared
	@details A function to make a model use the zombie skin for citizen hands.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddZombieHands(model)
	self:AddHandsModel(model, {
		body = 0000000,
		model = "models/weapons/c_arms_citizen.mdl",
		skin = 2
	})
end

--[[
	@codebase Shared
	@details A function to make a model use the HL2 HEV viewmodel hands.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddHEVHands(model)
	self:AddHandsModel(model, {
		body = 0000000,
		model = "models/weapons/c_arms_hev.mdl",
		skin = 0
	})
end

--[[
	@codebase Shared
	@details A function to make a model use the combine viewmodel hands.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddCombineHands(model)
	self:AddHandsModel(model, {
		body = 0000000,
		model = "models/weapons/c_arms_combine.mdl",
		skin = 0
	})
end

--[[
	@codebase Shared
	@details A function to make a model use the CSS viewmodel hands.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddCSSHands(model)
	self:AddHandsModel(model, {
		body = 0000000,
		model = "models/weapons/c_arms_cstrike.mdl",
		skin = 0
	})
end

--[[
	@codebase Shared
	@details A function to make a model use the refugee viewmodel hands.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddRefugeeHands(model)
	self:AddHandsModel(model, {
		body = 01,
		model = "models/weapons/c_arms_refugee.mdl",
		skin = 0
	})
end

--[[
	@codebase Shared
	@details a function to make a model use the refugee viewmodel hands with a zombie skin.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:AddZombieRefugeeHands(model)
	self:AddHandsModel(model, {
		body = 0000000,
		model = "models/weapons/c_arms_refugee.mdl",
		skin = 2
	})
end

--[[
	@codebase Shared
	@details A function to check for stored hands info by model.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for animTable.
	@returns {Unknown}
--]]
function Clockwork.animation:CheckHands(model, animTable)
	local info = animTable.hands or {
		body = 0000000,
		model = "models/weapons/c_arms_citizen.mdl",
		skin = 0
	}

	for k, v in pairs(handsModels) do
		if string.find(model, k) then
			info = v
			break
		end
	end

	self:AdjustHandsInfo(model, info)

	return info
end

--[[
	@codebase Shared
	@details A function to adjust the hands info with checks for if a model is set to use the black skin.
	@param {Unknown} Missing description for model.
	@param {Unknown} Missing description for info.
	@returns {Unknown}
--]]
function Clockwork.animation:AdjustHandsInfo(model, info)
	if info.model == "models/weapons/c_arms_citizen.mdl" or info.model == "models/weapons/c_arms_refugee.mdl" then
		for k, v in pairs(blackModels) do
			if string.find(model, k) then
				info.skin = 1
				break
			elseif info.skin == 1 then
				info.skin = 0
			end
		end
	end

	Clockwork.plugin:Call("AdjustCModelHandsInfo", model, info)
end

--[[
	@codebase Shared
	@details A function to get the c_model hands based on model.
	@param {Unknown} Missing description for model.
	@returns {Unknown}
--]]
function Clockwork.animation:GetHandsInfo(model)
	local animTable = self:GetTable(model)

	return self:CheckHands(string.lower(model), animTable)
end

Clockwork.animation:AddBlackModel("/male_01.mdl")
Clockwork.animation:AddBlackModel("/male_03.mdl")
Clockwork.animation:AddBlackModel("/female_03.mdl")
Clockwork.animation:AddRefugeeHands("/group03/")
Clockwork.animation:AddRefugeeHands("/group03m/")
Clockwork.animation:AddZombieRefugeeHands("/Zombie/")
Clockwork.animation:AddVortigauntModel("models/vortigaunt.mdl")
Clockwork.animation:AddVortigauntModel("models/vortigaunt_slave.mdl")
Clockwork.animation:AddVortigauntModel("models/vortigaunt_doctor.mdl")
Clockwork.animation:AddCombineOverwatchModel("models/combine_soldier_prisonguard.mdl")
Clockwork.animation:AddCombineOverwatchModel("models/combine_super_soldier.mdl")
Clockwork.animation:AddCombineOverwatchModel("models/combine_soldier.mdl")
Clockwork.animation:AddCivilProtectionModel("models/police.mdl")

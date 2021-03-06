/*
    -- Credit to: MiKeY (aokmikey@gmail.com)
    DESC:
        Spawns weapons into MP

    NOTE:
        Just hand it a weapon string and a location
*/
function spawnWeapon( stringWeapon = false, org )
{
    if( stringWeapon )
        return false;

    weapon = GetWeapon(stringWeapon);
    spawned_weapon = spawn("weapon_" + weapon.name + "_mp", org + (0,0,12));
    spawned_weapon ItemWeaponSetAmmo(weapon.clipSize, weapon.maxammo);
}

// ALTERNATIVE: Less common useage. Fun with functions.
/*
    -- Credit to: MiKeY (aokmikey@gmail.com)
    DESC:
        Spawns weapons into MP

    NOTE:
        Code as is will spawn weapons on the tdm spawn points and will pick out
        of a random array of guns. Please change as needed. The most important
        parts are the pickUpWatcher and the way Spawn is being used.
*/

function spawnRandomWeapons()
{
    spawnpoints = spawnlogic::get_spawnpoint_array("mp_tdm_spawn");
    weaponsList_array = strTok("smg_standard smg_versatile  smg_fastfire  smg_longrange smg_burst  smg_capacity  ar_standard  ar_accurate  ar_fastburst  ar_cqb  ar_damage  ar_longburst  ar_marksman  lmg_light  lmg_heavy  lmg_cqb  lmg_slowfire  sniper_powerbolt  sniper_fastbolt  sniper_fastsemi  sniper_chargeshot  pistol_standard  pistol_burst  pistol_fullauto  shotgun_pump  shotgun_semiauto  shotgun_precision  shotgun_fullauto  launcher_standard  launcher_lockonly "," ");

    if( spawnpoints.size < 0 )
        return;

    foreach( points in spawnpoints ) {
        weapon = "weapon_" + weaponsList_array[randomintrange(0, weaponsList_array.size)] + "_mp";
        spawned_weapon = Spawn(weapon, points.origin+(0, 0, 30));
        spawned_weapon ItemWeaponSetAmmo(weapon.clipSize, weapon.maxammo);
    }
}

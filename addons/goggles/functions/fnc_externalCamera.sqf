/*
 * Author: Garth 'L-H' de Wet
 * Returns if the camera is external or not.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whether the camera is in external view or not. If the "showInThirdPerson" option is checked, this will always return false. <BOOL>
 *
 * Example:
 * call ace_goggles_fnc_removeRainEffect;
 *
 * Public: Yes
 */
#include "script_component.hpp"

if ((missionNameSpace getVariable [QGVAR(showInThirdPerson), 0]) == 1) exitWith { false };
(cameraView == "External")
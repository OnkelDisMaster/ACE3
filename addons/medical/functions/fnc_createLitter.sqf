/*
 * Author: Glowbal
 * Spawns litter for the treatment action on the ground around the target
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: The treatment classname <STRING>
 *
 * Return Value:
 *
 *
 * Public: No
 */

#include "script_component.hpp"

#define MIN_ENTRIES_LITTER_CONFIG 3

private ["_target", "_className", "_config", "_litter", "_createLitter", "_litterObject", "_position", "_createdLitter"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_usersOfItems = _this select 5;

if !(GVAR(allowLitterCreation)) exitwith {};
if (vehicle _caller != _caller || vehicle _target != _target) exitwith {};

_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};
if !(isClass _config) exitwith {false};


if !(isArray (_config >> "litter")) exitwith {};
_litter = getArray (_config >> "litter");

_createLitter = {
    _position = getPos (_this select 0);
    _litterClass = _this select 1;
    _litterObject = createVehicle [_litterClass, _position, [], 0, "NONE"];
    if (random(1) >= 0.5) then {
        _litterObject setPos [(_position select 0) + random 2, (_position select 1) + random 2, _position select 2];
    } else {
        _litterObject setPos [(_position select 0) - random 2, (_position select 1) - random 2, _position select 2];
    };
    _litterObject setDir (random 360);
    _litterObject;
};

if (isnil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

_createdLitter = [];
{
    if (typeName _x == "ARRAY") then {
        if (count _x < MIN_ENTRIES_LITTER_CONFIG) exitwith {};
        private ["_selection", "_litterCondition", "_litterOptions"];
        _selection = _x select 0;
        if (toLower _selection in [toLower _selectionName, "all"]) then { // in is case sensitve. We can be forgiving here, so lets use toLower.
            _litterCondition = _x select 1;
            _litterOptions = _x select 2;

            if (isnil _litterCondition) then {
                _litterCondition = if (_litterCondition != "") then {compile _litterCondition} else {{true}};
            } else {
                _litterCondition = missionNamespace getvariable _litterCondition;
            };
            if !([_caller, _target, _selectionName, _className, _usersOfItems] call _litterCondition) exitwith {};

            if (typeName _litterOptions == "ARRAY") then {
                // Loop through through the litter options and place the litter
                {
                    if (typeName _x == "ARRAY" && {(count _x > 0)}) then {
                        _createdLitter pushback ([_target, _x select (floor(random(count _x)))] call _createLitter);
                    };
                    if (typeName _x == "STRING") then {
                        _createdLitter pushback ([_target, _x] call _createLitter);
                    };
                }foreach _litterOptions;
            };
        };
    };
}foreach _litter;

if (GVAR(litterCleanUpDelay) >= 0) then {
    GVAR(allCreatedLitter) pushback [time, GVAR(litterCleanUpDelay), _createdLitter];
};

if !(GVAR(litterPFHRunning)) then {
    GVAR(litterPFHRunning) = true;
    [{
        {
            if (time - (_x select 0) >= (_x select 1)) then {
                {
                    deleteVehicle _x;
                }foreach (_this select 2);
                GVAR(allCreatedLitter) set[_foreachIndex, objNull];
            };
        }foreach GVAR(allCreatedLitter);
        GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

        if (count GVAR(allCreatedLitter) == 0) exitwith {
            GVAR(litterPFHRunning) = false;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 30, []] call CBA_fnc_addPerFrameHandler;
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_SetCaptive {
                displayName = "$STR_ACE_Captives_SetCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canTakeCaptive));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doTakeCaptive));
                showDisabled = 0;
                priority = 2.4;
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                hotkey = "C";
            };
            class ACE_ReleaseCaptive {
                displayName = "$STR_ACE_Captives_ReleaseCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canReleaseCaptive));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doReleaseCaptive));
                exceptions[] = {"ACE_Interaction_isNotEscorting"};
                showDisabled = 0;
                priority = 2.4;
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                hotkey = "R";
            };
            class ACE_EscortCaptive {
                displayName = "$STR_ACE_Captives_EscortCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canEscortCaptive));
                statement = QUOTE([ARR_2(_target, true)] call FUNC(doEscortCaptive));
                exceptions[] = {"ACE_Interaction_isNotEscorting"};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.3;
                hotkey = "E";
            };
            class ACE_StopEscorting {
                displayName = "$STR_ACE_Captives_StopEscorting";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,_target, false)] call FUNC(doEscortCaptive));
                exceptions[] = {"ACE_Interaction_isNotEscorting"};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.3;
                hotkey = "E";
            };
            class ACE_LoadCaptive {
                displayName = "$STR_ACE_Captives_LoadCaptive";
                distance = 4;
                condition = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(canLoadCaptive));
                statement = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(loadCaptive));
                exceptions[] = {"ACE_Interaction_isNotEscorting"};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.2;
                hotkey = "L";
            };
            class ACE_FriskPerson {
                displayName = "$STR_ACE_Captives_FriskPerson";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canFriskPerson));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(openFriskMenu));
                showDisabled = 0;
                //icon = "";  //@todo
                priority = 3;
                hotkey = "F";
            };
        };

        class ACE_SelfActions {
            class ACE_StopEscortingSelf {
                displayName = "$STR_ACE_Captives_StopEscorting";
                condition = QUOTE([ARR_2(_player, objNull)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
                exceptions[] = {"ACE_Interaction_isNotEscorting"};
                showDisabled = 0;
                priority = 2.3;
                hotkey = "C";
            };
            /*class ACE_LoadCaptiveSelf {
        displayName = "$STR_ACE_Captives_LoadCaptive";
        condition = "[_player, objNull, objNull] call ACE_Captives_fnc_canLoadCaptiveIntoVehicle";
        statement = "[_player, objNull, objNull] call ACE_Captives_fnc_loadCaptiveIntoVehicle";
        exceptions[] = {"ACE_Interaction_isNotEscorting"};
        showDisabled = 0;
        priority = 2.2;
        hotkey = "K";
    };*/
        };
    };

#define MACRO_LOADUNLOADCAPTIVE \
        class ACE_Actions { \
            class ACE_LoadCaptive { \
                displayName = "$STR_ACE_Captives_LoadCaptive"; \
                distance = 4; \
                condition = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(canLoadCaptive)); \
                statement = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(loadCaptive)); \
                exceptions[] = {"ACE_Interaction_isNotEscorting"}; \
                showDisabled = 0; \
                priority = 1.2; \
                hotkey = "L"; \
            }; \
            class ACE_UnloadCaptive { \
                displayName = "$STR_ACE_Captives_UnloadCaptive"; \
                distance = 4; \
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canUnloadCaptive)); \
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(unloadCaptive)); \
                showDisabled = 0; \
                priority = 1.2; \
                hotkey = "C"; \
            }; \
        };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Tank: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Air;
    class Helicopter: Air {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Plane: Air {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_LOADUNLOADCAPTIVE
    };

    class StaticWeapon: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        MACRO_LOADUNLOADCAPTIVE
    };

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
            name = #ITEM; \
            count = COUNT; \
        };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_CableTie,12)
        };
    };
};
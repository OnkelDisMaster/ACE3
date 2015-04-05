/*
 * Author: PabstMirror
Simple Lookup Table for various muzzle velocities and air frictions.
Use ACE_Artillery_fnc_dev_buildTable to build
 *
 * Arguments:
 *  0: NUMBER - Muzzle Velocity
1: NUMBER - Air Friction
 * Return Value:
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_muzzleVelocity,_airFriction);

switch (true) do {

case ((abs(_muzzleVelocity - 70) < 0.00001) && ((abs(_airFriction - -0.0001) < 0.00001))): {
        [
        ["100","1493","9","14.0","3.7","0.4","-0.3","0.3","-0.3","-0.0","0.0"],
        ["150","1438","14","13.9","2.5","0.4","-0.4","0.4","-0.4","-0.1","0.0"],
        ["200","1381","20","13.8","1.9","0.5","-0.4","0.5","-0.5","-0.1","0.1"],
        ["250","1321","27","13.6","1.5","0.5","-0.4","0.7","-0.7","-0.1","0.1"],
        ["300","1256","36","13.3","1.3","0.6","-0.5","0.8","-0.8","-0.1","0.1"],
        ["350","1183","49","12.9","1.1","0.6","-0.5","0.9","-0.9","-0.1","0.1"],
        ["400","1097","70","12.4","0.9","0.6","-0.5","1.1","-1.1","-0.2","0.1"],
        ["450","979","113","11.6","0.8","0.6","-0.5","1.2","-1.2","-0.2","0.2"]
        ]
    };

case ((abs(_muzzleVelocity - 200) < 0.00001) && ((abs(_airFriction - -0.0001) < 0.00001))): {
        [
        ["450","1527","1","37.3","13.4","6.3","-6.0","1.0","-1.0","-1.0","1.0"],
        ["500","1519","1","37.2","12.1","6.3","-6.0","1.1","-1.1","-1.1","1.1"],
        ["550","1510","1","37.2","11.0","6.4","-6.0","1.2","-1.2","-1.3","1.2"],
        ["600","1502","1","37.2","10.1","6.4","-6.1","1.3","-1.3","-1.4","1.3"],
        ["650","1494","1","37.2","9.4","6.5","-6.1","1.4","-1.4","-1.5","1.4"],
        ["700","1485","2","37.1","8.7","6.5","-6.2","1.5","-1.5","-1.6","1.5"],
        ["750","1477","2","37.1","8.2","6.6","-6.2","1.6","-1.6","-1.7","1.6"],
        ["800","1468","2","37.0","7.7","6.7","-6.3","1.7","-1.7","-1.8","1.8"],
        ["850","1460","2","37.0","7.2","6.7","-6.3","1.8","-1.8","-2.0","1.9"],
        ["900","1451","2","37.0","6.8","6.8","-6.4","1.9","-2.0","-2.1","2.0"],
        ["950","1443","2","36.9","6.5","6.9","-6.4","2.0","-2.1","-2.2","2.1"],
        ["1000","1434","2","36.9","6.2","6.9","-6.5","2.1","-2.2","-2.3","2.2"],
        ["1050","1425","2","36.8","5.9","7.0","-6.6","2.2","-2.3","-2.5","2.3"],
        ["1100","1417","3","36.8","5.6","7.1","-6.6","2.3","-2.4","-2.6","2.4"],
        ["1150","1408","3","36.7","5.4","7.1","-6.7","2.5","-2.5","-2.7","2.5"],
        ["1200","1399","3","36.6","5.2","7.2","-6.7","2.6","-2.6","-2.8","2.7"],
        ["1250","1390","3","36.6","5.0","7.3","-6.8","2.7","-2.7","-2.9","2.8"],
        ["1300","1381","3","36.5","4.8","7.4","-6.9","2.8","-2.8","-3.0","2.9"],
        ["1350","1372","3","36.4","4.6","7.4","-6.9","2.9","-2.9","-3.2","3.0"],
        ["1400","1362","4","36.4","4.4","7.5","-7.0","3.0","-3.0","-3.3","3.1"],
        ["1450","1353","4","36.3","4.3","7.6","-7.1","3.1","-3.1","-3.4","3.2"],
        ["1500","1344","4","36.2","4.2","7.7","-7.1","3.2","-3.2","-3.5","3.4"],
        ["1550","1334","4","36.1","4.0","7.7","-7.2","3.3","-3.3","-3.7","3.5"],
        ["1600","1324","4","36.0","3.9","7.8","-7.3","3.4","-3.4","-3.8","3.6"],
        ["1650","1314","4","35.9","3.8","7.9","-7.3","3.5","-3.5","-3.9","3.7"],
        ["1700","1304","5","35.8","3.7","7.9","-7.4","3.6","-3.6","-4.0","3.8"],
        ["1750","1294","5","35.7","3.6","8.0","-7.5","3.7","-3.7","-4.2","3.9"],
        ["1800","1284","5","35.6","3.5","8.1","-7.6","3.8","-3.9","-4.3","4.0"],
        ["1850","1274","5","35.5","3.4","8.2","-7.6","3.9","-4.0","-4.4","4.2"],
        ["1900","1263","6","35.4","3.3","8.2","-7.7","4.0","-4.1","-4.5","4.3"],
        ["1950","1253","6","35.2","3.2","8.3","-7.8","4.1","-4.2","-4.7","4.4"],
        ["2000","1242","6","35.1","3.1","8.4","-7.8","4.3","-4.3","-4.8","4.5"],
        ["2050","1231","7","35.0","3.0","8.4","-7.9","4.4","-4.4","-4.9","4.7"],
        ["2100","1219","7","34.8","2.9","8.5","-8.0","4.5","-4.5","-5.0","4.8"],
        ["2150","1208","7","34.7","2.9","8.5","-8.0","4.6","-4.6","-5.2","4.9"],
        ["2200","1196","8","34.5","2.8","8.6","-8.1","4.7","-4.7","-5.3","5.0"],
        ["2250","1184","8","34.3","2.7","8.7","-8.2","4.8","-4.8","-5.4","5.1"],
        ["2300","1171","9","34.2","2.7","8.7","-8.2","4.9","-4.9","-5.5","5.2"],
        ["2350","1158","9","34.0","2.6","8.8","-8.3","5.0","-5.0","-5.7","5.4"],
        ["2400","1145","10","33.8","2.5","8.8","-8.3","5.1","-5.1","-5.8","5.5"],
        ["2450","1132","10","33.6","2.5","8.9","-8.4","5.2","-5.2","-5.9","5.6"],
        ["2500","1118","11","33.3","2.4","8.9","-8.4","5.3","-5.3","-6.0","5.7"],
        ["2550","1103","12","33.1","2.4","9.0","-8.5","5.4","-5.4","-6.1","5.8"],
        ["2600","1088","13","32.8","2.3","9.0","-8.5","5.5","-5.5","-6.2","5.9"],
        ["2650","1072","14","32.6","2.2","9.0","-8.6","5.6","-5.6","-6.4","6.0"],
        ["2700","1056","15","32.3","2.2","9.0","-8.6","5.7","-5.8","-6.5","6.1"],
        ["2750","1038","16","31.9","2.1","9.1","-8.6","5.9","-5.9","-6.6","6.3"],
        ["2800","1020","18","31.6","2.1","9.1","-8.6","6.0","-6.0","-6.7","6.4"],
        ["2850","1000","20","31.2","2.0","9.1","-8.6","6.1","-6.1","-6.8","6.5"],
        ["2900","978","22","30.8","1.9","9.0","-8.6","6.2","-6.2","-6.9","6.5"],
        ["2950","954","26","30.3","1.9","9.0","-8.6","6.3","-6.3","-7.0","6.6"],
        ["3000","927","31","29.7","1.8","8.9","-8.5","6.4","-6.4","-7.1","6.7"],
        ["3050","894","38","29.0","1.7","8.8","-8.4","6.5","-6.6","-7.2","6.8"],
        ["3100","849","54","27.9","1.6","8.5","-8.3","6.6","-6.7","-7.2","6.8"]
        ]
    };

    default {systemChat "Error: MuzzleVelocity not found in LUT"; []};
};
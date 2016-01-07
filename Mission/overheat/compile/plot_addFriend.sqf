private ["_pos","_plots","_thePlot","_inList"];
_pos = _this select 0;
if (_pos < 0) exitWith {};
_toAdd = (Humans select _pos);
_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];	
_thePlot = _plots select 0;
_friends = _thePlot getVariable ["plotfriends",[]];
_inList = false;
{ if ((_x  select 0) == (_toAdd select 0)) exitWith { _inList = true; }; } forEach _friends;
if (_inList) exitWith { cutText ["Already on the list", "PLAIN DOWN"]; };
if (count _friends == 6) exitWith { cutText ["Only 6 allowed","PLAIN DOWN"]; };
_friends = _friends  + [_toAdd ];
_thePlot setVariable ["plotfriends", _friends, true];
PVDZE_veh_Update = [_thePlot,"plot"];
publicVariableServer "PVDZE_veh_Update";
if (isServer) then {
	PVDZE_veh_Update call server_updateObject;
};
call PlotGetFriends;
call PlotNearbyHumans;
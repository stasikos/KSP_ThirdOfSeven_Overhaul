set filename to "FD" + SHIP:NAME + ".csv".

UNTIL SHIP:ALTITUDE > 70000 {
	set record to missionTime + ",".
	set record to record + altitude + ",".
	set record to record + ship:maxThrust + ",".
	set record to record + ship:velocity:surface:mag +",".
	set record to record + verticalSpeed + ",".
	log record to filename.
	WAIT 0.5.
}

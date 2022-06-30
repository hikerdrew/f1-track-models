SELECT races.name, races.year, drivers.surname, lap_times.time, lap_times.lap, lap_times.position


FROM circuits


LEFT JOIN races ON circuits.circuitid = races.circuitid
LEFT JOIN results ON races.raceId = results.raceId
LEFT JOIN drivers ON results.driverid = drivers.driverid
LEFT JOIN lap_times ON races.raceId = lap_times.raceId


WHERE circuits.circuitref = 'spa'
 AND lap_times.time = ANY 
 	(SELECT MIN(lap_times.time)
 	 FROM lap_times, races
 	 WHERE races.name = 'Belgian Grand Prix'
 	 AND lap_times.raceid = races.raceid)
 
 
   
 AND results.driverid = drivers.driverid
 AND results.raceid = races.raceid
 AND drivers.driverid = lap_times.driverid

;
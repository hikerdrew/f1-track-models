SELECT races.year, lap_times.lap, drivers.surname, constructors.name, lap_times.time, lap_times.position


FROM circuits


LEFT JOIN races ON circuits.circuitid = races.circuitid
LEFT JOIN results ON races.raceId = results.raceId
LEFT JOIN drivers ON results.driverid = drivers.driverid
LEFT JOIN lap_times ON races.raceId = lap_times.raceId
LEFT JOIN constructors ON results.constructorid = constructors.constructorid


WHERE circuits.circuitref = 'spa'
AND results.driverid = drivers.driverid
AND results.raceid = races.raceid
AND drivers.driverid = lap_times.driverid
AND drivers.driverid = results.driverid
AND results.constructorid = constructors.constructorid
;
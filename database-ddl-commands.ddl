CREATE TABLE seasons(

    year INT,
    url VARCHAR,
    
    CONSTRAINT PKyear PRIMARY KEY(year)
);


CREATE TABLE circuits(

    circuitId INT,
    circuitRef VARCHAR,
    name VARCHAR,
    location VARCHAR,
    country VARCHAR,
    lat FLOAT,
    lng FLOAT,
    alt FLOAT,
    url VARCHAR, 

	CONSTRAINT PKcircuitId PRIMARY KEY(circuitId),
	CONSTRAINT UcircuitRef UNIQUE(circuitRef)
);


CREATE TABLE constructors(

    constructorId INT,
    constructorRef VARCHAR,
    name VARCHAR,
    nationality VARCHAR,
    url VARCHAR,

	CONSTRAINT PKconstructorId PRIMARY KEY (constructorId),
	CONSTRAINT UconstructorRef UNIQUE(constructorRef)
);


CREATE TABLE races(

    raceId INT,
    year INT,
    round INT,
    circuitId INT,
    name VARCHAR,
    date DATE,
    time TIME,
    url VARCHAR,

	CONSTRAINT PKraceId PRIMARY KEY(raceId),
	CONSTRAINT FKyear FOREIGN KEY (year) REFERENCES seasons(year),
	CONSTRAINT FKcircuitId FOREIGN KEY (circuitId) REFERENCES circuits(circuitId)
);


CREATE TABLE drivers(

    driverId INT,
    driverRef VARCHAR,
    number INT,
    code CHAR(3),
    forename VARCHAR,
    surname VARCHAR,
    dob DATE,
    nationality VARCHAR,
    url VARCHAR,
    
    CONSTRAINT PKdriverId PRIMARY KEY(driverId),
    CONSTRAINT UdriverRef UNIQUE(driverRef)
);


CREATE TABLE status(

    statusId INT,
    status VARCHAR,

	CONSTRAINT PKstatusId PRIMARY KEY (statusId)
);


CREATE TABLE constructor_results (

    constructor_resultsId INT,
    raceId INT,
    constructorId INT,
    points INT,
    status VARCHAR,

	CONSTRAINT PKconstructor_resultsId PRIMARY KEY (constructor_resultsId),
	CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
	CONSTRAINT FKconstructorId FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);


CREATE TABLE constructor_standings(

	constructorStandingsId INT,
	raceId INT,
	constructorId INT,
	points INT,
	position INT,
	positionText VARCHAR,
	wins INT,
	
	CONSTRAINT PKconstructorStandingsId PRIMARY KEY (constructorStandingsId),
	CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
	CONSTRAINT FKconstructorId FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);


CREATE TABLE lap_times(

    raceId INT,
    driverId INT,
    lap INT,
    position INT,
    time TIME,
    milliseconds INT,
    
    CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
    CONSTRAINT FKdriverId FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);


CREATE TABLE pit_stops(

    raceId INT,
    driverId INT,
    stop INT,
    lap INT,
    time TIME,
    duration VARCHAR,
    milliseconds INT,
    
    CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
    CONSTRAINT FKdriverId FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);


CREATE TABLE qualifying(

    qualifyId INT,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    position INT,
    q1 TIME,
    q2 TIME,
    q3 TIME,

	CONSTRAINT PKqualifyId PRIMARY KEY (qualifyId),
	CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
    CONSTRAINT FKdriverId FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    CONSTRAINT FKconstructorId FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)  
);


CREATE TABLE results(

    resultId INT,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positiontext VARCHAR,
    positionorder INT,
    points INT,
    laps INT,
    time VARCHAR,
    milliseconds INT,
    fastestlap INT,
    rank INT,
    fastestlaptime VARCHAR,
    fastestlapspeed VARCHAR,
    statusId INT,
    
	CONSTRAINT FKresultId PRIMARY KEY (resultId),
	CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
    CONSTRAINT FKdriverId FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    CONSTRAINT FKconstructorId FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    CONSTRAINT FKstatusId FOREIGN KEY (statusId) REFERENCES status(statusId) 
);


CREATE TABLE driver_standings(

	driver_standingsId INT,
	raceId INT,
	driverId INT,
	points INT,
	position INT,
	position_text INT,
	wins INT,
	
	CONSTRAINT PKdriver_standingsId PRIMARY KEY (driver_standingsId),
	CONSTRAINT FKraceId FOREIGN KEY (raceId) REFERENCES races(raceId),
    CONSTRAINT FKdriverId FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);






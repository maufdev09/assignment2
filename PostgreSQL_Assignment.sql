-- Active: 1747649000006@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db


CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region  TEXT NOT NULL 
);


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(20) NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL

)

create TABLE sightings(
sighthing_id SERIAL PRIMARY KEY,
ranger_id  INT,
species_id INT NOT NULL,
sighting_time  TIMESTAMP NOT NULL,
location TEXT NOT NULL,
notes TEXT,
FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id) on DELETE CASCADE,
Foreign Key (species_id) REFERENCES species (species_id) on DELETE CASCADE

);



INSERT INTO rangers (name,region)
VALUES ('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Black', 'Eastern Forest'),
('Eve Adams', 'Southern Desert'),
('Frank Moore', 'Coastal Plains'),
('Grace Lee', 'Highland Meadows'),
('Hank Brown', 'Rainy Woods'),
('Ivy Scott', 'Crystal Lake'),
('Jack Turner', 'Windy Pass'),
('Kara Bell', 'Foggy Ridge'),
('Liam Stone', 'Golden Valley'),
('Mia Clark', 'Whispering Pines'),
('Noah Reed', 'Shadow Canyon'),
('Olivia Young', 'Sunset Grove'),
('Paul Walker', 'Red Rock Basin'),
('Quinn Hayes', 'Evergreen Ridge'),
('Rita Cox', 'Silver Creek'),
('Sam Hughes', 'Frostbite Peak'),
('Tina Long', 'Thunder Bluff'),
('Umar Dean', 'Maple Grove'),
('Vera Fox', 'Savanna Edge'),
('Will Nash', 'Snowy Tundra'),
('Xena Roy', 'Jungle Path'),
('Yara Kim', 'Blazing Dunes'),
('Zane Boyd', 'River Delta'),
('Amber Neal', 'Northern Hills'),
('Bryce Ford', 'Mountain Range'),
('Cleo Nash', 'Southern Desert'),
('Dylan Ross', 'Coastal Plains');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');





INSERT INTO sightings(ranger_id,species_id,sighting_time,location,notes)
VALUES (1, 3, '2024-05-01 07:30:00', 'Bamboo Forest Trail', 'Seen climbing a tree'),
(2, 5, '2024-05-02 14:10:00', 'Savannah Edge', 'Resting in shade'),
(3, 7, '2024-05-03 08:45:00', 'River Bend', 'Observed drinking water'),
(4, 2, '2024-05-04 17:00:00', 'Dense Brush Zone', 'Territorial behavior'),
(5, 9, '2024-05-05 06:15:00', 'Lake Shore', NULL),
(6, 1, '2024-05-06 18:30:00', 'Snow Ridge', 'Camera trap image'),
(7, 6, '2024-05-07 10:00:00', 'Forest Clearing', 'Family of 3 spotted'),
(8, 8, '2024-05-08 13:20:00', 'Mud Hollow', 'Feeding behavior recorded'),
(9, 10, '2024-05-09 09:50:00', 'Cliff View', NULL),
(10, 12, '2024-05-10 07:15:00', 'Palm Grove', 'Seen foraging'),
(11, 11, '2024-05-11 11:40:00', 'Grassland Path', 'Juvenile seen'),
(12, 13, '2024-05-12 15:30:00', 'Mountain Base', NULL),
(13, 4, '2024-05-13 12:10:00', 'Hilltop Lookout', 'Solitary adult'),
(14, 14, '2024-05-14 08:00:00', 'Watering Hole', 'Interaction with other species'),
(15, 15, '2024-05-15 16:25:00', 'Ridgeway Trail', 'Resting'),
(16, 17, '2024-05-16 07:55:00', 'Valley Edge', 'Fresh tracks spotted'),
(17, 16, '2024-05-17 10:30:00', 'Birch Forest', NULL),
(18, 18, '2024-05-18 18:05:00', 'Cave Entrance', 'Roaring sound heard'),
(19, 20, '2024-05-19 09:10:00', 'Dry Creek', 'Seen in pair'),
(20, 19, '2024-05-20 06:50:00', 'North Ridge', 'Observed resting'),
(21, 21, '2024-05-21 13:00:00', 'Sunset Cliff', 'Sighting at dusk'),
(22, 23, '2024-05-22 08:20:00', 'Jungle Outpost', 'Climbing trees'),
(23, 22, '2024-05-23 14:35:00', 'Forest Boundary', NULL),
(24, 25, '2024-05-24 07:05:00', 'Sandy Trail', 'Tracks and droppings'),
(25, 26, '2024-05-25 11:10:00', 'Rainforest Nest', 'Nest spotted'),
(26, 27, '2024-05-26 17:20:00', 'Foggy Ravine', 'Seen briefly'),
(27, 24, '2024-05-27 06:30:00', 'Cliffside Den', NULL),
(28, 28, '2024-05-28 09:45:00', 'Highland Marsh', 'Calm behavior'),
(29, 30, '2024-05-29 15:15:00', 'Meadow Basin', 'Solo adult'),
(30, 29, '2024-05-30 08:00:00', 'Eastern Slope', 'Early morning sighting');


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;
-- DROP TABLE rangers;
-- DROP TABLE species;
-- DROP TABLE sightings;





---------------------------------------------------------------------------------------------------------





-- problem 1
INSERT INTO rangers(name,region)
VALUES('Derek Fox','Coastal Plains');



-- problem 2
SELECT COUNT(DISTINCT species_id) as unique_species_count from sightings;



-- problem 3
-- UPDATE sightings SET location='Snowfall Pass' 
-- WHERE sighthing_id=10;
UPDATE sightings SET ranger_id= 24 
WHERE sighthing_id=16;
SELECT  * FROM sightings WHERE location ILIKE '%pass%';


-- problem 4
SELECT rangers.name As "name", COUNT(*) as total_sightings  FROM sightings 
JOIN rangers ON sightings.ranger_id = rangers.ranger_id GROUP BY "name";

-- problem 5
SELECT common_name FROM  species WHERE species_id NOT IN(
    SELECT DISTINCT species_id FROM sightings
)

-- problem 6
SELECT sp.common_name,s.sighting_time , r.name FROM sightings s JOIN species sp ON s.species_id = sp.species_id JOIN rangers r ON s.ranger_id =r.ranger_id ORDER BY s.sighting_time DESC LIMIT 2;


-- problem 7
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
UPDATE  species SET conservation_status ='Historic' WHERE(
    discovery_date < '1800-01-01'
);


-- problem 8
SELECT sighthing_id ,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time)<12  THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    -- WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 17 AND 24 THEN 'Evening'
    ELSE 'Evening'
END as time_of_day
FROM sightings;


-- problem 9
DELETE FROM rangers WHERE ranger_id NOT IN(
    SELECT DISTINCT ranger_id FROM sightings
)


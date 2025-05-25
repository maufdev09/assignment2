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
sighting_time DATE NOT NULL,
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
VALUES ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-01-01', 'Vulnerable'),
('African Elephant', 'Loxodonta africana', '1797-01-01', 'Vulnerable'),
('Black Rhino', 'Diceros bicornis', '1758-01-01', 'Critically Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered'),
('Green Sea Turtle', 'Chelonia mydas', '1758-01-01', 'Endangered'),
('Polar Bear', 'Ursus maritimus', '1774-01-01', 'Vulnerable'),
('Orangutan', 'Pongo pygmaeus', '1760-01-01', 'Critically Endangered'),
('Mountain Gorilla', 'Gorilla beringei beringei', '1903-01-01', 'Endangered'),
('Saola', 'Pseudoryx nghetinhensis', '1992-01-01', 'Critically Endangered'),
('Snowy Owl', 'Bubo scandiacus', '1758-01-01', 'Least Concern'),
('Amur Leopard', 'Panthera pardus orientalis', '1857-01-01', 'Critically Endangered'),
('Hawksbill Turtle', 'Eretmochelys imbricata', '1766-01-01', 'Critically Endangered'),
('California Condor', 'Gymnogyps californianus', '1797-01-01', 'Critically Endangered'),
('African Lion', 'Panthera leo', '1758-01-01', 'Vulnerable'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Koala', 'Phascolarctos cinereus', '1816-01-01', 'Vulnerable'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
('Komodo Dragon', 'Varanus komodoensis', '1912-01-01', 'Endangered'),
('Maned Wolf', 'Chrysocyon brachyurus', '1815-01-01', 'Near Threatened'),
('Okapi', 'Okapia johnstoni', '1901-01-01', 'Endangered'),
('Addax', 'Addax nasomaculatus', '1816-01-01', 'Critically Endangered'),
('Galápagos Tortoise', 'Chelonoidis nigra', '1824-01-01', 'Vulnerable'),
('Axolotl', 'Ambystoma mexicanum', '1864-01-01', 'Critically Endangered'),
('Red-crowned Crane', 'Grus japonensis', '1776-01-01', 'Endangered'),
('Gaur', 'Bos gaurus', '1827-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered');


create TABLE sightings(
sighthing_id SERIAL PRIMARY KEY,
ranger_id  INT,
species_id INT NOT NULL,
sighting_time DATE NOT NULL,
location TEXT NOT NULL,
notes TEXT,
FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id) on DELETE CASCADE,
Foreign Key (species_id) REFERENCES species (species_id) on DELETE CASCADE

);


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
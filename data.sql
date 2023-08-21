/* Populate database with sample data. */

INSERT INTO animals VALUES ('Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals VALUES ('Gabumon','2018-11-15',2,true,8);
INSERT INTO animals VALUES ('Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals VALUES ('Devimon','2017-05-12',5,true,11);
INSERT INTO animals VALUES ('Charmander','2020-05-08',0,false,-11);
INSERT INTO animals VALUES ('Plantmon','2021-11-15',2,true,-5.7);
INSERT INTO animals VALUES ('Squirtle','1993-04-02',3,false,-12.13);
INSERT INTO animals VALUES ('Angemon','2005-06-12',1,true,-45);
INSERT INTO animals VALUES ('Boarmon','2005-06-07',7,true,20.4);
INSERT INTO animals VALUES ('Blossom','1998-10-13',3,true,17);
INSERT INTO animals VALUES ('Ditto','2022-05-14',4,true,22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE  animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE  animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE  animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE  animals SET owner_id = 4  WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE  animals SET owner_id = 5  WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '191-05-04'),('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations VALUES (1,1),(3,1),(3,2),(4,2);

INSERT INTO visits VALUES (1,1,'2020-05-24'),(1,3,'2020-07-22'),(2,4,'2021-02-02'),(3,2,'2020-01-05'),(3,2,'2020-03-08'),(3,2,'2020-05-14'),(4,3,'2021-05-04'),(5,4,'2021-02-24'),(6,2,'2019-12-21'),(6,1,'2020-08-10'),(6,2,'2021-04-07'),(7,3,'2019-09-29'),(8,4,'2020-10-03'),(8,4,'2020-11-04'),(9,2,'2019-01-24'),(9,2,'2019-05-15'),(9,2,'2020-02-27'),(9,2,'2020-08-03'),(10,3,'2020-05-24'),(10,1,'2021-01-11');

-- To beign able to achieve query time target, both insertions were run 4 times.
BEGIN;
INSERT INTO visits (animals_id, vet_id, day_of_visit) SELECT * FROM (SELECT id FROM animals) animals_id, (SELECT id FROM vets) vet_id, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
COMMIT;

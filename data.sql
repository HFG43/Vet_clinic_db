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
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
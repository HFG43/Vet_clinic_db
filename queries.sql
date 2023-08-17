/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attemps < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attemps FROM animals WHERE weigth_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weigth_kg >= 10.4 AND weigth_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT save1;
UPDATE animals SET weigth_kg = weigth_kg * -1;
ROLLBACK TO SAVEPOINT save1;
UPDATE animals SET weigth_kg = weigth_kg * -1 WHERE weigth_kg < 0;
COMMIT;

SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals WHERE escape_attemps = 0;

SELECT AVG(weigth_kg) FROM animals;

SELECT neutered, COUNT(escape_attemps) FROM animals GROUP BY neutered;

SELECT species, MIN(weigth_kg) as min_weigth, MAX(weigth_kg) as max_weigth FROM animals GROUP BY species;

SELECT species, AVG(escape_attemps) as average_escape_attemps FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT owner_id, full_name, name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name as specie FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON owner_id = owners.id;

SELECT species.id, species.name, COUNT(species_id) as Count_per_specie FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.id;

SELECT animals.name, owners.full_name, species.name FROM animals INNER JOIN owners ON owner_id = owners.id INNER JOIN species ON species.id = species_id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';

SELECT full_name, animals.name, escape_attemps FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attemps = 0;

SELECT full_name, owner_id, COUNT(owner_id) FROM animals INNER JOIN owners ON owner_id = owners.id GROUP BY full_name, owner_id ORDER BY COUNT(owner_id) DESC LIMIT 1; 

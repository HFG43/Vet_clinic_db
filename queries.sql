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

SELECT visits.day_of_visit, animals.name as animal_name, vets.name as vet_name FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY day_of_visit DESC LIMIT 1; 

SELECT animals.name, vets.name, COUNT(animals.name) FROM visits JOIN vets ON vets.id = vet_id JOIN animals ON animals.id = animals_id WHERE vets.name LIKE '%Mendez' GROUP BY animals_id, vet_id, vets.name,animals.name ;

SELECT vets.name, specializations.vets_id, species.name FROM specializations FULL OUTER JOIN vets ON vets_id = vets.id FULL OUTER JOIN species ON species_id = species.id;

SELECT animals.name, vets.name, day_of_visit FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vet_id = vets.id WHERE vets.name LIKE '%Mendez' AND day_of_visit >= '2020-04-01' AND day_of_visit <= '2020-08-30';

SELECT animals.name, COUNT(day_of_visit) FROM visits JOIN animals ON animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(day_of_visit) DESC LIMIT 1;

SELECT day_of_visit, animals.name, vets.name FROM visits JOIN vets ON vet_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name LIKE '%mith%' ORDER BY day_of_visit LIMIT 1;

SELECT animals.name as animal_name, vets.name as vet_name, day_of_visit FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vet_id = vets.id ORDER BY day_of_visit DESC LIMIT 1;

SELECT vets.name, vet_id, COUNT (day_of_visit) FROM visits JOIN vets ON vet_id = vets.id WHERE vets.id IN (SELECT vets.id FROM specializations RIGHT OUTER JOIN vets ON vets_id = vets.id WHERE species_id IS NULL) GROUP BY vets.name, vet_id;

SELECT vets.name,(SELECT species.name FROM species WHERE species.id = animals.species_id) AS specie, COUNT (day_of_visit) FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vet_id = vets.id WHERE vet_id = (SELECT vets.id FROM specializations RIGHT OUTER JOIN vets ON vets_id = vets.id WHERE species_id IS NULL) GROUP BY specie, vets.name ORDER BY COUNT(day_of_visit) DESC LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;

explain analyze SELECT * FROM visits where vet_id = 2;

explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

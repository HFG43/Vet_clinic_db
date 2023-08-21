/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR (25),
    date_of_birth DATE,
    escape_attemps INT,
    neutered BOOLEAN,
    weigth_kg DECIMAL(3,2)
    );

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals ADD id INT GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals ALTER COLUMN weigth_kg TYPE DECIMAL(4,2);

ALTER TABLE animals ADD species VARCHAR (20);

CREATE TABLE owners (id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(30), age INT, PRIMARY KEY (id));

CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(30), PRIMARY KEY (id));

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(30), age INT, date_of_graduation date, PRIMARY KEY (id));

CREATE TABLE specializations (vets_id INT REFERENCES vets(id) ON UPDATE CASCADE, species_id INT REFERENCES species(id) ON UPDATE CASCADE, CONSTRAINT pk_specializations PRIMARY KEY (vets_id, species_id));

ALTER TABLE animals ADD PRIMARY KEY (id);

CREATE TABLE visits (animals_id INT REFERENCES animals(id) ON UPDATE CASCADE, vet_id INT REFERENCES vets(id) ON UPDATE CASCADE, day_of_visit DATE, CONSTRAINT pk_visits PRIMARY KEY (animals_id, vet_id, day_of_visit));

BEGIN;
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
ALTER TABLE visits DROP CONSTRAINT pk_visits;
COMMIT;

CREATE INDEX animals_id ON visits(animals_id);

CREATE INDEX vet_index ON visits(vet_id);

CREATE INDEX email_index ON owners(email);

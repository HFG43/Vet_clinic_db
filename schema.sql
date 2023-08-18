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

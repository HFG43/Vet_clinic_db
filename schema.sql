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



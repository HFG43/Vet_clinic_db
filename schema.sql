/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR (25),
    date_of_birth DATE,
    escape_attemps INT,
    neutered BOOLEAN,
    weigth_kg DECIMAL(3,2)
    );


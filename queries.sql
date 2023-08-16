/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attemps < 3;
SELECT date_of_birth FROM animals WHERE name NOT IN ('Agumon','Pikachu');
SELECT name, escape_attemps FROM animals WHERE weigth_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weigth_kg >= 10.4 AND weigth_kg <= 17.3;
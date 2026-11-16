-- ==========================================
-- POKEMON DATA ANALYSIS PROJECT
-- Database: MySQL
-- ==========================================

-- STEP 1: CREATE DATABASE

CREATE DATABASE IF NOT EXISTS pokemon_analysis;

USE pokemon_analysis;

Step 2.1 — Create Pokémon types
  
CREATE TABLE pokemon_types (
    type_id INT PRIMARY KEY,
    type_name VARCHAR(30) NOT NULL UNIQUE
);

Step 2.2 — Create Pokémon

CREATE TABLE pokemon (
    pokemon_id INT PRIMARY KEY,
    pokemon_name VARCHAR(50) NOT NULL,
    height DECIMAL(5,2),
    weight DECIMAL(6,2),
    base_experience INT,
    type1_id INT NOT NULL,
    type2_id INT,

    FOREIGN KEY (type1_id) REFERENCES pokemon_types(type_id),
    FOREIGN KEY (type2_id) REFERENCES pokemon_types(type_id)
);

Step 2.3 — Create abilities

CREATE TABLE abilities (
    ability_id INT PRIMARY KEY,
    ability_name VARCHAR(50) NOT NULL UNIQUE
);


Step 2.4 — Create Pokémon abilities

CREATE TABLE pokemon_abilities (
    pokemon_id INT,
    ability_id INT,
    is_hidden BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (pokemon_id, ability_id),

    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (ability_id) REFERENCES abilities(ability_id)
);

Step 2.5 — Create Pokémon stats

CREATE TABLE pokemon_stats (
    pokemon_id INT PRIMARY KEY,
    hp INT,
    attack INT,
    defense INT,
    special_attack INT,
    special_defense INT,
    speed INT,

    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id)
);

-- STEP 3: INSERT POKEMON TYPES

INSERT INTO pokemon_types (type_id, type_name)
VALUES
(1, 'Normal'),
(2, 'Fire'),
(3, 'Water'),
(4, 'Electric'),
(5, 'Grass'),
(6, 'Ice'),
(7, 'Fighting'),
(8, 'Poison'),
(9, 'Ground'),
(10, 'Flying'),
(11, 'Psychic'),
(12, 'Bug'),
(13, 'Rock'),
(14, 'Ghost'),
(15, 'Dragon'),
(16, 'Dark'),
(17, 'Steel'),
(18, 'Fairy');



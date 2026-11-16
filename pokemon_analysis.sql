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

-- STEP 4: INSERT POKEMON DATA
-- Height is in metres; weight is in kilograms.

INSERT INTO pokemon
(pokemon_id, pokemon_name, height, weight, base_experience, type1_id, type2_id)
VALUES
(1, 'Bulbasaur', 0.70, 6.90, 64, 5, 8),
(2, 'Ivysaur', 1.00, 13.00, 142, 5, 8),
(3, 'Venusaur', 2.00, 100.00, 263, 5, 8),
(4, 'Charmander', 0.60, 8.50, 62, 2, NULL),
(5, 'Charmeleon', 1.10, 19.00, 142, 2, NULL),
(6, 'Charizard', 1.70, 90.50, 267, 2, 10),
(7, 'Squirtle', 0.50, 9.00, 63, 3, NULL),
(8, 'Wartortle', 1.00, 22.50, 142, 3, NULL),
(9, 'Blastoise', 1.60, 85.50, 265, 3, NULL),
(10, 'Caterpie', 0.30, 2.90, 39, 12, NULL),
(11, 'Metapod', 0.70, 9.90, 72, 12, NULL),
(12, 'Butterfree', 1.10, 32.00, 198, 12, 10),
(13, 'Weedle', 0.30, 3.20, 39, 12, 8),
(14, 'Kakuna', 0.60, 10.00, 72, 12, 8),
(15, 'Beedrill', 1.00, 29.50, 178, 12, 8),
(16, 'Pidgey', 0.30, 1.80, 50, 1, 10),
(17, 'Pidgeotto', 1.10, 30.00, 122, 1, 10),
(18, 'Pidgeot', 1.50, 39.50, 216, 1, 10),
(19, 'Rattata', 0.30, 3.50, 51, 1, NULL),
(20, 'Raticate', 0.70, 18.50, 145, 1, NULL);

-- STEP 5: INSERT POKEMON ABILITIES

INSERT INTO abilities (ability_id, ability_name)
VALUES
(1, 'Overgrow'),
(2, 'Chlorophyll'),
(3, 'Blaze'),
(4, 'Solar Power'),
(5, 'Torrent'),
(6, 'Rain Dish'),
(7, 'Shield Dust'),
(8, 'Run Away'),
(9, 'Shed Skin'),
(10, 'Compound Eyes'),
(11, 'Tinted Lens'),
(12, 'Swarm'),
(13, 'Sniper'),
(14, 'Keen Eye'),
(15, 'Tangled Feet'),
(16, 'Big Pecks'),
(17, 'Guts'),
(18, 'Hustle');

-- STEP 7: INSERT POKEMON STATS

INSERT INTO pokemon_stats
(pokemon_id, hp, attack, defense, special_attack, special_defense, speed)
VALUES
(1, 45, 49, 49, 65, 65, 45),
(2, 60, 62, 63, 80, 80, 60),
(3, 80, 82, 83, 100, 100, 80),
(4, 39, 52, 43, 60, 50, 65),
(5, 58, 64, 58, 80, 65, 80),
(6, 78, 84, 78, 109, 85, 100),
(7, 44, 48, 65, 50, 64, 43),
(8, 59, 63, 80, 65, 80, 58),
(9, 79, 83, 100, 85, 105, 78),
(10, 45, 30, 35, 20, 20, 45),
(11, 50, 20, 55, 25, 25, 30),
(12, 60, 45, 50, 90, 80, 70),
(13, 40, 35, 30, 20, 20, 50),
(14, 45, 25, 50, 25, 25, 35),
(15, 65, 90, 40, 45, 80, 75),
(16, 40, 45, 40, 35, 35, 56),
(17, 63, 60, 55, 50, 50, 71),
(18, 83, 80, 75, 70, 70, 101),
(19, 30, 56, 35, 25, 35, 72),
(20, 55, 81, 60, 50, 70, 97);

--Section 1: Basic data exploration

-- Q1. Display all Pokémon
SELECT * FROM pokemon;


-- Q2. Display Pokémon names, height and weight
SELECT pokemon_name, height, weight
FROM pokemon;


-- Q3. Count total Pokémon
SELECT COUNT(*) AS total_pokemon
FROM pokemon;


-- Q4. Display all Pokémon types
SELECT * FROM pokemon_types;


-- Q5. Display all distinct primary types used by Pokémon
SELECT DISTINCT pt.type_name
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id;


-- Q6. Find all Fire-type Pokémon
SELECT p.pokemon_name
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id
WHERE pt.type_name = 'Fire';


-- Q7. Find all Water-type Pokémon
SELECT p.pokemon_name
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id
WHERE pt.type_name = 'Water';


-- Q8. Find Pokémon with two types
SELECT pokemon_name
FROM pokemon
WHERE type2_id IS NOT NULL;


-- Q9. Find Pokémon with only one type
SELECT pokemon_name
FROM pokemon
WHERE type2_id IS NULL;


-- Q10. Display the five heaviest Pokémon
SELECT pokemon_name, weight
FROM pokemon
ORDER BY weight DESC
LIMIT 5;


--Section 2: Filtering and aggregate functions

-- Q11. Find Pokémon taller than 1 metre
SELECT pokemon_name, height
FROM pokemon
WHERE height > 1;


-- Q12. Find Pokémon with base experience greater than 200
SELECT pokemon_name, base_experience
FROM pokemon
WHERE base_experience > 200;


-- Q13. Calculate average Pokémon weight
SELECT AVG(weight) AS average_weight
FROM pokemon;


-- Q14. Find the Pokémon with the highest attack
SELECT p.pokemon_name, ps.attack
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
ORDER BY ps.attack DESC
LIMIT 1;


-- Q15. Find the Pokémon with the lowest speed
SELECT p.pokemon_name, ps.speed
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
ORDER BY ps.speed ASC
LIMIT 1;


-- Q16. Calculate average values of all battle stats
SELECT
    AVG(hp) AS avg_hp,
    AVG(attack) AS avg_attack,
    AVG(defense) AS avg_defense,
    AVG(special_attack) AS avg_special_attack,
    AVG(special_defense) AS avg_special_defense,
    AVG(speed) AS avg_speed
FROM pokemon_stats;


-- Q17. Calculate total battle stats for every Pokémon
SELECT
    p.pokemon_name,
    (ps.hp + ps.attack + ps.defense +
     ps.special_attack + ps.special_defense + ps.speed)
     AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
ORDER BY total_stats DESC;


-- Q18. Find the Pokémon with the highest total battle stats
SELECT
    p.pokemon_name,
    (ps.hp + ps.attack + ps.defense +
     ps.special_attack + ps.special_defense + ps.speed)
     AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
ORDER BY total_stats DESC
LIMIT 1;


-- Q19. Calculate average attack by primary Pokémon type
SELECT
    pt.type_name,
    AVG(ps.attack) AS average_attack
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
GROUP BY pt.type_name;


-- Q20. Count Pokémon by primary type
SELECT
    pt.type_name,
    COUNT(*) AS pokemon_count
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id
GROUP BY pt.type_name
ORDER BY pokemon_count DESC;

--Section 3: JOINs and relationships
-- Q21. Count Pokémon by secondary type
SELECT
    pt.type_name,
    COUNT(*) AS pokemon_count
FROM pokemon p
JOIN pokemon_types pt ON p.type2_id = pt.type_id
GROUP BY pt.type_name
ORDER BY pokemon_count DESC;


-- Q22. Display Pokémon with their abilities
SELECT
    p.pokemon_name,
    a.ability_name
FROM pokemon p
JOIN pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
JOIN abilities a ON pa.ability_id = a.ability_id
ORDER BY p.pokemon_name;


-- Q23. Find Pokémon with hidden abilities
SELECT
    p.pokemon_name,
    a.ability_name
FROM pokemon p
JOIN pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
JOIN abilities a ON pa.ability_id = a.ability_id
WHERE pa.is_hidden = TRUE;


-- Q24. Find Pokémon having more than one ability
SELECT
    p.pokemon_name,
    COUNT(pa.ability_id) AS ability_count
FROM pokemon p
JOIN pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
GROUP BY p.pokemon_id, p.pokemon_name
HAVING COUNT(pa.ability_id) > 1;


-- Q25. Find the most commonly assigned abilities
SELECT
    a.ability_name,
    COUNT(pa.pokemon_id) AS pokemon_count
FROM abilities a
JOIN pokemon_abilities pa ON a.ability_id = pa.ability_id
GROUP BY a.ability_id, a.ability_name
ORDER BY pokemon_count DESC;


-- Q26. Find Pokémon without any abilities
SELECT p.pokemon_name
FROM pokemon p
LEFT JOIN pokemon_abilities pa
    ON p.pokemon_id = pa.pokemon_id
WHERE pa.pokemon_id IS NULL;


-- Q27. Display Pokémon names and their battle stats
SELECT
    p.pokemon_name,
    ps.hp,
    ps.attack,
    ps.defense,
    ps.speed
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id;


-- Q28. Find Pokémon with attack above the average attack
SELECT
    p.pokemon_name,
    ps.attack
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
WHERE ps.attack > (
    SELECT AVG(attack)
    FROM pokemon_stats
);


-- Q29. Find Pokémon with total stats above the average total stats
SELECT
    p.pokemon_name,
    (ps.hp + ps.attack + ps.defense +
     ps.special_attack + ps.special_defense + ps.speed)
     AS total_stats
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
WHERE
    (ps.hp + ps.attack + ps.defense +
     ps.special_attack + ps.special_defense + ps.speed)
    >
    (
        SELECT AVG(hp + attack + defense +
                   special_attack + special_defense + speed)
        FROM pokemon_stats
    );


-- Q30. Find Pokémon heavier than the average Pokémon weight
SELECT pokemon_name, weight
FROM pokemon
WHERE weight > (
    SELECT AVG(weight)
    FROM pokemon
);

--Section 4: Advanced SQL
-- Q31. Find the strongest Pokémon in each primary type
WITH RankedPokemon AS (
    SELECT
        p.pokemon_name,
        pt.type_name,
        (ps.hp + ps.attack + ps.defense +
         ps.special_attack + ps.special_defense + ps.speed)
         AS total_stats,
        RANK() OVER (
            PARTITION BY pt.type_name
            ORDER BY (ps.hp + ps.attack + ps.defense +
                      ps.special_attack + ps.special_defense + ps.speed) DESC
        ) AS pokemon_rank
    FROM pokemon p
    JOIN pokemon_types pt ON p.type1_id = pt.type_id
    JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
)
SELECT *
FROM RankedPokemon
WHERE pokemon_rank = 1;


-- Q32. Rank all Pokémon by total battle stats
SELECT
    p.pokemon_name,
    (ps.hp + ps.attack + ps.defense +
     ps.special_attack + ps.special_defense + ps.speed)
     AS total_stats,
    RANK() OVER (
        ORDER BY (ps.hp + ps.attack + ps.defense +
                  ps.special_attack + ps.special_defense + ps.speed) DESC
    ) AS pokemon_rank
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id;


-- Q33. Rank Pokémon by speed within their primary type
SELECT
    p.pokemon_name,
    pt.type_name,
    ps.speed,
    DENSE_RANK() OVER (
        PARTITION BY pt.type_name
        ORDER BY ps.speed DESC
    ) AS speed_rank
FROM pokemon p
JOIN pokemon_types pt ON p.type1_id = pt.type_id
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id;


-- Q34. Display Pokémon, their types and abilities
SELECT
    p.pokemon_name,
    t1.type_name AS primary_type,
    t2.type_name AS secondary_type,
    a.ability_name
FROM pokemon p
JOIN pokemon_types t1 ON p.type1_id = t1.type_id
LEFT JOIN pokemon_types t2 ON p.type2_id = t2.type_id
LEFT JOIN pokemon_abilities pa ON p.pokemon_id = pa.pokemon_id
LEFT JOIN abilities a ON pa.ability_id = a.ability_id
ORDER BY p.pokemon_name;


-- Q35. Classify Pokémon based on attack and defense
SELECT
    p.pokemon_name,
    ps.attack,
    ps.defense,
    CASE
        WHEN ps.attack > ps.defense THEN 'Attack Focused'
        WHEN ps.defense > ps.attack THEN 'Defense Focused'
        ELSE 'Balanced'
    END AS battle_style
FROM pokemon p
JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id;


-- Q36. Categorise Pokémon by weight
SELECT
    pokemon_name,
    weight,
    CASE
        WHEN weight < 10 THEN 'Light'
        WHEN weight < 50 THEN 'Medium'
        ELSE 'Heavy'
    END AS weight_category
FROM pokemon;


-- Q37. Categorise Pokémon by base experience
SELECT
    pokemon_name,
    base_experience,
    CASE
        WHEN base_experience >= 200 THEN 'High'
        WHEN base_experience >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS experience_category
FROM pokemon;


-- Q38. Count normal and hidden ability assignments
SELECT
    a.ability_name,
    SUM(CASE WHEN pa.is_hidden = FALSE THEN 1 ELSE 0 END)
        AS normal_assignments,
    SUM(CASE WHEN pa.is_hidden = TRUE THEN 1 ELSE 0 END)
        AS hidden_assignments
FROM abilities a
LEFT JOIN pokemon_abilities pa ON a.ability_id = pa.ability_id
GROUP BY a.ability_id, a.ability_name;


-- Q39. Create a type-wise summary using a CTE
WITH TypeSummary AS (
    SELECT
        p.type1_id,
        COUNT(*) AS pokemon_count,
        AVG(ps.attack) AS avg_attack,
        AVG(ps.defense) AS avg_defense,
        AVG(ps.speed) AS avg_speed
    FROM pokemon p
    JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id
    GROUP BY p.type1_id
)
SELECT
    pt.type_name,
    ts.pokemon_count,
    ROUND(ts.avg_attack, 2) AS avg_attack,
    ROUND(ts.avg_defense, 2) AS avg_defense,
    ROUND(ts.avg_speed, 2) AS avg_speed
FROM TypeSummary ts
JOIN pokemon_types pt ON ts.type1_id = pt.type_id
ORDER BY ts.pokemon_count DESC;


-- Q40. Calculate running total of Pokémon base experience
SELECT
    pokemon_name,
    base_experience,
    SUM(base_experience) OVER (
        ORDER BY pokemon_id
    ) AS running_experience
FROM pokemon;





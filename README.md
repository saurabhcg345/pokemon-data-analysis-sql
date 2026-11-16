# Pokémon Data Analysis Using MySQL

## Project Overview

This project focuses on analysing Pokémon data using MySQL. It explores Pokémon characteristics, types, abilities, and battle statistics to identify patterns and generate meaningful insights through SQL queries.

The project demonstrates practical SQL skills, database design, data relationships, and analytical thinking.

## Business Problem

A Pokémon analytics team wants to understand the characteristics and battle capabilities of different Pokémon.

The objective is to analyse:
- Pokémon distribution across different types.
- Pokémon with the highest attack, defense, speed, and overall battle stats.
- Ability distribution among Pokémon.
- Relationships between Pokémon types and battle performance.
- Weight and experience classifications.
- Strongest Pokémon within each primary type.

## Tools & Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Documentation & Version Control:** GitHub

## Database Design

The project uses five relational tables:

| Table | Description |
|---|---|
| `pokemon` | Stores Pokémon details such as name, height, weight, experience, and types. |
| `pokemon_types` | Stores Pokémon type information. |
| `abilities` | Stores Pokémon abilities. |
| `pokemon_abilities` | Maps Pokémon to their abilities. |
| `pokemon_stats` | Stores battle statistics for each Pokémon. |

### Database Relationships

- One Pokémon type can be associated with multiple Pokémon.
- A Pokémon can have multiple abilities.
- An ability can belong to multiple Pokémon.
- Each Pokémon has one corresponding battle-stat record.

## Dataset

The project includes:

- 20 Pokémon records.
- 18 Pokémon types.
- 18 ability records.
- 43 Pokémon-ability mappings.
- 20 battle-stat records.

*Note: This is a small learning dataset based on selected Pokémon, not a complete Pokédex.*

## SQL Concepts Covered

A total of 40 SQL analysis queries were developed and executed.

### Basic SQL
- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- IS NULL

### Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

### SQL Joins
- INNER JOIN
- LEFT JOIN
- Multiple-table JOINs
- Self-contained relational analysis

### Advanced SQL
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER() concepts
- PARTITION BY
- Running totals
- CASE WHEN
- Conditional aggregation

## Key Analysis Areas

The project answers questions such as:

1. Which Pokémon have the highest total battle stats?
2. Which Pokémon have the strongest attack?
3. Which Pokémon are the fastest?
4. Which primary type has the most Pokémon?
5. Which abilities are most commonly assigned?
6. Which Pokémon have hidden abilities?
7. Which Pokémon perform above average in attack?
8. Which Pokémon are strongest within each primary type?
9. How do Pokémon compare in weight and experience?
10. How can Pokémon be ranked by battle performance?

## Project Structure

```text
pokemon-data-analysis-sql/
│
├── README.md
│
└── pokemon_analysis.sql
```

## Project Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases.
- Creating tables with primary and foreign keys.
- Inserting and managing structured data.
- Writing SQL queries for data analysis.
- Joining multiple related tables.
- Using subqueries and CTEs.
- Applying window functions for ranking and comparisons.
- Translating analytical questions into SQL queries.

## Conclusion

This project demonstrates the application of MySQL for relational database management and data analysis.

It helped strengthen my understanding of SQL fundamentals and advanced querying techniques through a practical, hands-on dataset.

---

**Project:** Pokémon Data Analysis Using MySQL  
**Status:** Completed  
**Total Analysis Queries:** 40

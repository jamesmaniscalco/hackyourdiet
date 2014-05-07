hackyourdiet
============

hack your diet!

##Database schema:

- Food Group
    - has many Food Items
    - name
    - USDA id: the USDA database has their own ID system, we should keep note of it.

- Food Item
    - has many Nutritional Contents
    - belongs to Food Group
    - name
    - USDA id
    - description

- Nutrient
    - has many Nutritional Contents
    - name
    - USDA id
    - description
    - unit: the unit we should measure it in

- Nutritional Content: the join between Food Items and Nutrients.
    - belongs to Food Item
    - belongs to Nutrient
    - amount per 100g: this is the crux, it comes from the USDA database.

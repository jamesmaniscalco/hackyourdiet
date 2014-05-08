hackyourdiet
============

hack your diet!

##Initialization:

When initialing an instance of the app, you will need a copy of the USDA nutrient database. Specifically, you need the files named `FD_GROUP.txt`, `FOOD_DES.txt`, `NUT_DATA.txt`, and `NUTR_DEF.txt` to be placed in the `#{Rails.root}/usda_source/` directory.

After placing these, run `rake db:seed` to fill in the database.

NOTE: this will take a long time, _maybe a few hours_, mostly because the `NUT_DATA.txt` file has *over 600,000 lines*.

The same can be run for updating the database when the USDA releases updated versions of their database.

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

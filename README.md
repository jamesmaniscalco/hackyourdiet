hackyourdiet
============

hack your diet!

##Initialization:

When initialing an instance of the app, you will need a copy of the USDA nutrient database. Specifically, you need the files named `FD_GROUP.txt`, `FOOD_DES.txt`, `NUT_DATA.txt`, and `NUTR_DEF.txt` to be placed in the `#{Rails.root}/usda_source/` directory.

After placing these, run `rake db:seed` to fill in the database.

NOTE: this will take a long time, _maybe a few hours_, mostly because the `NUT_DATA.txt` file has **over 600,000 lines**.

The same can be run for updating the database when the USDA releases updated versions of their database.

##API access:

Accessing the API is fairly straightforward. For the initial (current) implementation, we only use the `:show` and `:index` methods to, respectively, show a single item and show the list of all (relevant) items. More specifically, here are the URLs to call for given bits of information:

- Index of all Food Groups: `/food_groups`
- Show a specific Food Group: `/food_groups/:food_group_id`
- Index of all Food Items in a given Food Group: `/food_groups/:food_group_id/food_items`
- Index of all Food Items: `/food_items`
- Show a specific Food Item: `/food_items/:food_item_id`
    - Note here that we have to access it directly, not through the Food Group > Food Items sub-index.
- Index of all Nutritional Contents for a given Food Item: `/food_items/:food_item_id/nutritional_contents`
- Index of all Nutrients: `/nutrients`
- Show a specific Nutrient: `/nutrients/:nutrient_id`

###A note on Nutrients

When you request the Nutritional Contents of a Food Item (or request a single one), you get objects that look like this (formatted below so as to be human-friendly):

    {
        "nutritional_content":
        {
            "id":386825,
            "food_item_id":5103,
            "nutrient_id":14,
            "amount_per_100g":60.3
        }
    }

Note that this gives an `amount_per_100g` but *doesn't give the unit that it's measured in*. However, you can get this by pulling up the individual Nutrient or the full index of all Nutrients. For the single-page app, it might be wise to load this anyway, since you will need it to show a tally of how much of a given Nutrient is accounted for.

In the Javascript, you can keep a tally of each Nutrient's amount used. When a Food Item is added to your recipe, iterate through the Nutritional Contents for the Food Item and add the `amount_per_100g` to the appropriate Nutrient tally.

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

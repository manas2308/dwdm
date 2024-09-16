% Facts about locations
location(desk, office).
location(apple, kitchen).
location(flashlight, desk).

% Rule: Find the location of an item
item_location(Item, Location) :-
    location(Item, Location).

% Rule: Find all items located in a specific location
items_in_location(Location, Item) :-
    location(Item, Location).

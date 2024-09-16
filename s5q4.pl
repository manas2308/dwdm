% Facts: orbits(Planet, Center)
orbits(mercury, sun).
orbits(venus, sun).
orbits(earth, sun).
orbits(mars, sun).
orbits(moon, earth).
orbits(phobos, mars).
orbits(deimos, mars).

% Rule: Find objects that orbit a given planet or the sun
orbits_of(Planet, Orbiter) :-
    orbits(Orbiter, Planet).

% Rule: Find all direct orbiters of the sun
orbiters_of_sun(Orbiter) :-
    orbits(Orbiter, sun).

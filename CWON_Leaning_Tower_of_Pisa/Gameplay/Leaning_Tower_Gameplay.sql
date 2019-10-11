
INSERT INTO Types (Type, Kind) VALUES ('BUILDING_LEANING_TOWER', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Description, PrereqTech, PrereqDistrict, AdjacentDistrict, Cost, AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, Quote)
VALUES ('BUILDING_LEANING_TOWER', 'LOC_BUILDING_LEANING_TOWER_NAME', 'LOC_BUILDING_LEANING_TOWER_DESCRIPTION', 'TECH_CARTOGRAPHY', 'DISTRICT_HARBOR', 'DISTRICT_CITY_CENTER', 920, 'ADVISOR_CULTURE', '1', 1, 1, 'LOC_BUILDING_LEANING_TOWER_QUOTE');

INSERT INTO Building_ValidTerrains (BuildingType, TerrainType)
VALUES
  (
    'BUILDING_LEANING_TOWER', 'TERRAIN_GRASS'
  ),
  (
    'BUILDING_LEANING_TOWER', 'TERRAIN_PLAINS'
  );


INSERT INTO Building_YieldChanges (
  BuildingType, YieldType, YieldChange
)
VALUES ('BUILDING_LEANING_TOWER', 'YIELD_CULTURE', 2),
      ('BUILDING_LEANING_TOWER', 'YIELD_FAITH', 1);


-- +25% combat experience for all naval units trained in this city
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES ('LEANING_TOWER_SEA_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES ('LEANING_TOWER_SEA_REQUIREMENTS', 'REQUIRES_SEA_DOMAIN');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, Permanent)
VALUES ('LEANING_TOWER_TRAINED_UNIT_XP_MODIFIER', 'MODIFIER_CITY_TRAINED_UNITS_ADJUST_XP_BONUS', 'LEANING_TOWER_SEA_REQUIREMENTS', 1);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_TRAINED_UNIT_XP_MODIFIER', 'Amount', '25');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_LEANING_TOWER', 'LEANING_TOWER_TRAINED_UNIT_XP_MODIFIER');


-- +100% Tourism pressure from this city towards other civilizations starting from the Modern Era.
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('LEANING_TOWER_ENHANCEDLATETOURISM', 'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_LATE_ERAS');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_ENHANCEDLATETOURISM', 'Modifier', '100');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_ENHANCEDLATETOURISM', 'MinimumEra', 'ERA_MODERN');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_LEANING_TOWER', 'LEANING_TOWER_ENHANCEDLATETOURISM');


-- Harbors receive +1.5 Gold from each adjacent District.
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('LEANING_TOWER_HARBOR_DISTRICT_GOLD', 'MODIFIER_PLAYER_CITIES_DISTRICT_ADJACENCY');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_HARBOR_DISTRICT_GOLD', 'DistrictType', 'DISTRICT_HARBOR');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_HARBOR_DISTRICT_GOLD', 'YieldType', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_HARBOR_DISTRICT_GOLD', 'Amount', '1.5');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LEANING_TOWER_HARBOR_DISTRICT_GOLD', 'Description', 'LOC_BUILDING_LEANING_TOWER_HARBOR_DISTRICT_GOLD');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_LEANING_TOWER', 'LEANING_TOWER_HARBOR_DISTRICT_GOLD');
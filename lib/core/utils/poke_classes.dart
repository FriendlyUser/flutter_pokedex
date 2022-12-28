// classes from the pokeapi
class PokemonSpecies {
  int? baseHappiness;
  int? captureRate;
  PokeColor? color;
  List<EggGroups>? eggGroups;
  EvolutionChain? evolutionChain;
  Null? evolvesFromSpecies;
  List<FlavorTextEntries>? flavorTextEntries;
  List<Null>? formDescriptions;
  bool? formsSwitchable;
  int? genderRate;
  List<Genera>? genera;
  PokeColor? generation;
  PokeColor? growthRate;
  PokeColor? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  List<Names>? names;
  int? order;
  List<PalParkEncounters>? palParkEncounters;
  List<PokedexNumbers>? pokedexNumbers;
  PokeColor? shape;
  List<Varieties>? varieties;

  PokemonSpecies(
      {this.baseHappiness,
      this.captureRate,
      this.color,
      this.eggGroups,
      this.evolutionChain,
      this.evolvesFromSpecies,
      this.flavorTextEntries,
      this.formDescriptions,
      this.formsSwitchable,
      this.genderRate,
      this.genera,
      this.generation,
      this.growthRate,
      this.habitat,
      this.hasGenderDifferences,
      this.hatchCounter,
      this.id,
      this.isBaby,
      this.isLegendary,
      this.isMythical,
      this.name,
      this.names,
      this.order,
      this.palParkEncounters,
      this.pokedexNumbers,
      this.shape,
      this.varieties});

  PokemonSpecies.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = json['PokeColor'] != null ? new PokeColor.fromJson(json['PokeColor']) : null;
    if (json['egg_groups'] != null) {
      eggGroups = <EggGroups>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(new EggGroups.fromJson(v));
      });
    }
    evolutionChain = json['evolution_chain'] != null
        ? new EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'];
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(new FlavorTextEntries.fromJson(v));
      });
    }
    if (json['form_descriptions'] != null) {
      // formDescriptions = <Null>[];
      // json['form_descriptions'].forEach((v) {
      //   formDescriptions!.add(new Null.fromJson(v));
      // });
    }
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    if (json['genera'] != null) {
      genera = <Genera>[];
      json['genera'].forEach((v) {
        genera!.add(new Genera.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? new PokeColor.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? new PokeColor.fromJson(json['growth_rate'])
        : null;
    habitat =
        json['habitat'] != null ? new PokeColor.fromJson(json['habitat']) : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
    order = json['order'];
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = <PalParkEncounters>[];
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters!.add(new PalParkEncounters.fromJson(v));
      });
    }
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers = <PokedexNumbers>[];
      json['pokedex_numbers'].forEach((v) {
        pokedexNumbers!.add(new PokedexNumbers.fromJson(v));
      });
    }
    shape = json['shape'] != null ? new PokeColor.fromJson(json['shape']) : null;
    if (json['varieties'] != null) {
      varieties = <Varieties>[];
      json['varieties'].forEach((v) {
        varieties!.add(new Varieties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_happiness'] = this.baseHappiness;
    data['capture_rate'] = this.captureRate;
    if (this.color != null) {
      data['PokeColor'] = this.color!.toJson();
    }
    if (this.eggGroups != null) {
      data['egg_groups'] = this.eggGroups!.map((v) => v.toJson()).toList();
    }
    if (this.evolutionChain != null) {
      data['evolution_chain'] = this.evolutionChain!.toJson();
    }
    data['evolves_from_species'] = this.evolvesFromSpecies;
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (this.formDescriptions != null) {
      // data['form_descriptions'] =
      //     this.formDescriptions!.map((v) => v!.toJson()).toList();
    }
    data['forms_switchable'] = this.formsSwitchable;
    data['gender_rate'] = this.genderRate;
    if (this.genera != null) {
      data['genera'] = this.genera!.map((v) => v.toJson()).toList();
    }
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    if (this.growthRate != null) {
      data['growth_rate'] = this.growthRate!.toJson();
    }
    if (this.habitat != null) {
      data['habitat'] = this.habitat!.toJson();
    }
    data['has_gender_differences'] = this.hasGenderDifferences;
    data['hatch_counter'] = this.hatchCounter;
    data['id'] = this.id;
    data['is_baby'] = this.isBaby;
    data['is_legendary'] = this.isLegendary;
    data['is_mythical'] = this.isMythical;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    data['order'] = this.order;
    if (this.palParkEncounters != null) {
      data['pal_park_encounters'] =
          this.palParkEncounters!.map((v) => v.toJson()).toList();
    }
    if (this.pokedexNumbers != null) {
      data['pokedex_numbers'] =
          this.pokedexNumbers!.map((v) => v.toJson()).toList();
    }
    if (this.shape != null) {
      data['shape'] = this.shape!.toJson();
    }
    if (this.varieties != null) {
      data['varieties'] = this.varieties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EggGroups {
  String? name;
  String? url;

  EggGroups({this.name, this.url});

  EggGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class PokeColor {
  String? name;
  String? url;

  PokeColor({this.name, this.url});

  PokeColor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class EvolutionChain {
  String? url;

  EvolutionChain({this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  PokeColor? language;
  PokeColor? version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language =
        json['language'] != null ? new PokeColor.fromJson(json['language']) : null;
    version =
        json['version'] != null ? new PokeColor.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }
}

class Genera {
  String? genus;
  PokeColor? language;

  Genera({this.genus, this.language});

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language =
        json['language'] != null ? new PokeColor.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genus'] = this.genus;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }
}

class Names {
  PokeColor? language;
  String? name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language =
        json['language'] != null ? new PokeColor.fromJson(json['language']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class PalParkEncounters {
  PokeColor? area;
  int? baseScore;
  int? rate;

  PalParkEncounters({this.area, this.baseScore, this.rate});

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new PokeColor.fromJson(json['area']) : null;
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['base_score'] = this.baseScore;
    data['rate'] = this.rate;
    return data;
  }
}

class PokedexNumbers {
  int? entryNumber;
  PokeColor? pokedex;

  PokedexNumbers({this.entryNumber, this.pokedex});

  PokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokedex =
        json['pokedex'] != null ? new PokeColor.fromJson(json['pokedex']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entry_number'] = this.entryNumber;
    if (this.pokedex != null) {
      data['pokedex'] = this.pokedex!.toJson();
    }
    return data;
  }
}

class Varieties {
  bool? isDefault;
  PokeColor? pokemon;

  Varieties({this.isDefault, this.pokemon});

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon =
        json['pokemon'] != null ? new PokeColor.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_default'] = this.isDefault;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    return data;
  }
}
class PokemonDetails {
  List<Abilities>? abilities;
  int? baseExperience;
  // List<Forms>? forms;
  List<GameIndices>? gameIndices;
  int? height;
  List<HeldItems>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  // List<Null>? pastTypes;
  Ability? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokemonDetails(
      {this.abilities,
      this.baseExperience,
      // this.forms,
      this.gameIndices,
      this.height,
      this.heldItems,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      // this.pastTypes,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['forms'] != null) {
      // forms = <Forms>[];
      // json['forms'].forEach((v) {
      //   forms!.add(new Forms.fromJson(v));
      // });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(new GameIndices.fromJson(v));
      });
    }
    height = json['height'];
    if (json['held_items'] != null) {
      heldItems = <HeldItems>[];
      json['held_items'].forEach((v) {
        heldItems!.add(new HeldItems.fromJson(v));
      });
    }
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(new Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    if (json['past_types'] != null) {
      // pastTypes = <Null>[];
      // json['past_types'].forEach((v) {
      //   pastTypes!.add(new Null.fromJson(v));
      // });
    }
    species =
        json['species'] != null ? new Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    // if (this.forms != null) {
    //   data['forms'] = this.forms!.map((v) => v.toJson()).toList();
    // }
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices!.map((v) => v.toJson()).toList();
    }
    data['height'] = this.height;
    if (this.heldItems != null) {
      data['held_items'] = this.heldItems!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;
    // if (this.pastTypes != null) {
    //   data['past_types'] = this.pastTypes!.map((v) => v.toJson()).toList();
    // }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? new Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class GameIndices {
  int? gameIndex;
  Ability? version;

  GameIndices({this.gameIndex, this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version =
        json['version'] != null ? new Ability.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }
}

class HeldItems {
  Ability? item;
  List<VersionDetails>? versionDetails;

  HeldItems({this.item, this.versionDetails});

  HeldItems.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Ability.fromJson(json['item']) : null;
    if (json['version_details'] != null) {
      versionDetails = <VersionDetails>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(new VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionDetails {
  int? rarity;
  Ability? version;

  VersionDetails({this.rarity, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version =
        json['version'] != null ? new Ability.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rarity'] = this.rarity;
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }
}

class Moves {
  Ability? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? new Ability.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(new VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    if (this.versionGroupDetails != null) {
      data['version_group_details'] =
          this.versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetails {
  int? levelLearnedAt;
  Ability? moveLearnMethod;
  Ability? versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new Ability.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new Ability.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod!.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    return data;
  }
}

class Sprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  Other? other;
  Versions? versions;

  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale,
      this.other,
      this.versions});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
    versions = json['versions'] != null
        ? new Versions.fromJson(json['versions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_female'] = this.backFemale;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_female'] = this.backShinyFemale;
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    if (this.versions != null) {
      data['versions'] = this.versions!.toJson();
    }
    return data;
  }
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  Other({this.dreamWorld, this.home, this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? new DreamWorld.fromJson(json['dream_world'])
        : null;
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    officialArtwork = json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dreamWorld != null) {
      data['dream_world'] = this.dreamWorld!.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.officialArtwork != null) {
      data['official-artwork'] = this.officialArtwork!.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String? frontDefault;
  Null? frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    return data;
  }
}

class Home {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Home(
      {this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  GenerationVi? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions(
      {this.generationI,
      this.generationIi,
      this.generationIii,
      this.generationIv,
      this.generationV,
      this.generationVi,
      this.generationVii,
      this.generationViii});

  Versions.fromJson(Map<String, dynamic> json) {
    generationI = json['generation-i'] != null
        ? new GenerationI.fromJson(json['generation-i'])
        : null;
    generationIi = json['generation-ii'] != null
        ? new GenerationIi.fromJson(json['generation-ii'])
        : null;
    generationIii = json['generation-iii'] != null
        ? new GenerationIii.fromJson(json['generation-iii'])
        : null;
    generationIv = json['generation-iv'] != null
        ? new GenerationIv.fromJson(json['generation-iv'])
        : null;
    generationV = json['generation-v'] != null
        ? new GenerationV.fromJson(json['generation-v'])
        : null;
    generationVi = json['generation-vi'] != null
        ? new GenerationVi.fromJson(json['generation-vi'])
        : null;
    generationVii = json['generation-vii'] != null
        ? new GenerationVii.fromJson(json['generation-vii'])
        : null;
    generationViii = json['generation-viii'] != null
        ? new GenerationViii.fromJson(json['generation-viii'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.generationI != null) {
      data['generation-i'] = this.generationI!.toJson();
    }
    if (this.generationIi != null) {
      data['generation-ii'] = this.generationIi!.toJson();
    }
    if (this.generationIii != null) {
      data['generation-iii'] = this.generationIii!.toJson();
    }
    if (this.generationIv != null) {
      data['generation-iv'] = this.generationIv!.toJson();
    }
    if (this.generationV != null) {
      data['generation-v'] = this.generationV!.toJson();
    }
    if (this.generationVi != null) {
      data['generation-vi'] = this.generationVi!.toJson();
    }
    if (this.generationVii != null) {
      data['generation-vii'] = this.generationVii!.toJson();
    }
    if (this.generationViii != null) {
      data['generation-viii'] = this.generationViii!.toJson();
    }
    return data;
  }
}

class GenerationI {
  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI({this.redBlue, this.yellow});

  GenerationI.fromJson(Map<String, dynamic> json) {
    redBlue = json['red-blue'] != null
        ? new RedBlue.fromJson(json['red-blue'])
        : null;
    yellow =
        json['yellow'] != null ? new RedBlue.fromJson(json['yellow']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.redBlue != null) {
      data['red-blue'] = this.redBlue!.toJson();
    }
    if (this.yellow != null) {
      data['yellow'] = this.yellow!.toJson();
    }
    return data;
  }
}

class RedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue(
      {this.backDefault,
      this.backGray,
      this.backTransparent,
      this.frontDefault,
      this.frontGray,
      this.frontTransparent});

  RedBlue.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_gray'] = this.backGray;
    data['back_transparent'] = this.backTransparent;
    data['front_default'] = this.frontDefault;
    data['front_gray'] = this.frontGray;
    data['front_transparent'] = this.frontTransparent;
    return data;
  }
}

class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  GenerationIi({this.crystal, this.gold, this.silver});

  GenerationIi.fromJson(Map<String, dynamic> json) {
    crystal =
        json['crystal'] != null ? new Crystal.fromJson(json['crystal']) : null;
    gold = json['gold'] != null ? new Gold.fromJson(json['gold']) : null;
    silver = json['silver'] != null ? new Gold.fromJson(json['silver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.crystal != null) {
      data['crystal'] = this.crystal!.toJson();
    }
    if (this.gold != null) {
      data['gold'] = this.gold!.toJson();
    }
    if (this.silver != null) {
      data['silver'] = this.silver!.toJson();
    }
    return data;
  }
}

class Crystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal(
      {this.backDefault,
      this.backShiny,
      this.backShinyTransparent,
      this.backTransparent,
      this.frontDefault,
      this.frontShiny,
      this.frontShinyTransparent,
      this.frontTransparent});

  Crystal.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    backShinyTransparent = json['back_shiny_transparent'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontShinyTransparent = json['front_shiny_transparent'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_transparent'] = this.backShinyTransparent;
    data['back_transparent'] = this.backTransparent;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_transparent'] = this.frontShinyTransparent;
    data['front_transparent'] = this.frontTransparent;
    return data;
  }
}

class Gold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold(
      {this.backDefault,
      this.backShiny,
      this.frontDefault,
      this.frontShiny,
      this.frontTransparent});

  Gold.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_shiny'] = this.backShiny;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    data['front_transparent'] = this.frontTransparent;
    return data;
  }
}

class GenerationIii {
  Emerald? emerald;
  FireredLeafgreen? fireredLeafgreen;
  FireredLeafgreen? rubySapphire;

  GenerationIii({this.emerald, this.fireredLeafgreen, this.rubySapphire});

  GenerationIii.fromJson(Map<String, dynamic> json) {
    emerald =
        json['emerald'] != null ? new Emerald.fromJson(json['emerald']) : null;
    fireredLeafgreen = json['firered-leafgreen'] != null
        ? new FireredLeafgreen.fromJson(json['firered-leafgreen'])
        : null;
    rubySapphire = json['ruby-sapphire'] != null
        ? new FireredLeafgreen.fromJson(json['ruby-sapphire'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.emerald != null) {
      data['emerald'] = this.emerald!.toJson();
    }
    if (this.fireredLeafgreen != null) {
      data['firered-leafgreen'] = this.fireredLeafgreen!.toJson();
    }
    if (this.rubySapphire != null) {
      data['ruby-sapphire'] = this.rubySapphire!.toJson();
    }
    return data;
  }
}

class Emerald {
  String? frontDefault;
  String? frontShiny;

  Emerald({this.frontDefault, this.frontShiny});

  Emerald.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    return data;
  }
}

class FireredLeafgreen {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  FireredLeafgreen(
      {this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

  FireredLeafgreen.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_shiny'] = this.backShiny;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    return data;
  }
}

class GenerationIv {
  DiamondPearl? diamondPearl;
  DiamondPearl? heartgoldSoulsilver;
  DiamondPearl? platinum;

  GenerationIv({this.diamondPearl, this.heartgoldSoulsilver, this.platinum});

  GenerationIv.fromJson(Map<String, dynamic> json) {
    diamondPearl = json['diamond-pearl'] != null
        ? new DiamondPearl.fromJson(json['diamond-pearl'])
        : null;
    heartgoldSoulsilver = json['heartgold-soulsilver'] != null
        ? new DiamondPearl.fromJson(json['heartgold-soulsilver'])
        : null;
    platinum = json['platinum'] != null
        ? new DiamondPearl.fromJson(json['platinum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diamondPearl != null) {
      data['diamond-pearl'] = this.diamondPearl!.toJson();
    }
    if (this.heartgoldSoulsilver != null) {
      data['heartgold-soulsilver'] = this.heartgoldSoulsilver!.toJson();
    }
    if (this.platinum != null) {
      data['platinum'] = this.platinum!.toJson();
    }
    return data;
  }
}

class DiamondPearl {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  DiamondPearl(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  DiamondPearl.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_female'] = this.backFemale;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_female'] = this.backShinyFemale;
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    return data;
  }
}

class GenerationV {
  BlackWhite? blackWhite;

  GenerationV({this.blackWhite});

  GenerationV.fromJson(Map<String, dynamic> json) {
    blackWhite = json['black-white'] != null
        ? new BlackWhite.fromJson(json['black-white'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blackWhite != null) {
      data['black-white'] = this.blackWhite!.toJson();
    }
    return data;
  }
}

class BlackWhite {
  DiamondPearl? animated;
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  BlackWhite(
      {this.animated,
      this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  BlackWhite.fromJson(Map<String, dynamic> json) {
    animated = json['animated'] != null
        ? new DiamondPearl.fromJson(json['animated'])
        : null;
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animated != null) {
      data['animated'] = this.animated!.toJson();
    }
    data['back_default'] = this.backDefault;
    data['back_female'] = this.backFemale;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_female'] = this.backShinyFemale;
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    return data;
  }
}

class GenerationVi {
  Home? omegarubyAlphasapphire;
  Home? xY;

  GenerationVi({this.omegarubyAlphasapphire, this.xY});

  GenerationVi.fromJson(Map<String, dynamic> json) {
    omegarubyAlphasapphire = json['omegaruby-alphasapphire'] != null
        ? new Home.fromJson(json['omegaruby-alphasapphire'])
        : null;
    xY = json['x-y'] != null ? new Home.fromJson(json['x-y']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.omegarubyAlphasapphire != null) {
      data['omegaruby-alphasapphire'] = this.omegarubyAlphasapphire!.toJson();
    }
    if (this.xY != null) {
      data['x-y'] = this.xY!.toJson();
    }
    return data;
  }
}

class GenerationVii {
  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  GenerationVii({this.icons, this.ultraSunUltraMoon});

  GenerationVii.fromJson(Map<String, dynamic> json) {
    icons =
        json['icons'] != null ? new DreamWorld.fromJson(json['icons']) : null;
    ultraSunUltraMoon = json['ultra-sun-ultra-moon'] != null
        ? new Home.fromJson(json['ultra-sun-ultra-moon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icons != null) {
      data['icons'] = this.icons!.toJson();
    }
    if (this.ultraSunUltraMoon != null) {
      data['ultra-sun-ultra-moon'] = this.ultraSunUltraMoon!.toJson();
    }
    return data;
  }
}

class GenerationViii {
  DreamWorld? icons;

  GenerationViii({this.icons});

  GenerationViii.fromJson(Map<String, dynamic> json) {
    icons =
        json['icons'] != null ? new DreamWorld.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icons != null) {
      data['icons'] = this.icons!.toJson();
    }
    return data;
  }
}

class Icons {
  String? frontDefault;
  String? frontFemale;

  Icons({this.frontDefault, this.frontFemale});

  Icons.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? new Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat!.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}
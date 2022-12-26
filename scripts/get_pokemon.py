import requests
import json
import os
import urllib.parse
from bs4 import BeautifulSoup

query = """
query samplePokeAPIquery {
  pokemon: pokemon_v2_pokemon {
    name
    id
    pokemon_species_id
    pokemon_v2_pokemontypes {
      pokemon_v2_type {
        name
        move_damage_class_id
        generation_id
        id
      }
    }
  }
}
"""
def get_data():
    url = "https://beta.pokeapi.co/graphql/v1beta"
    headers = {
        "Content-Type": "application/json",
        "X-Method-Used": "graphiql",
    }
    response = requests.post(url, json={"query": query}, headers=headers, timeout=10)
    data = response.json()
    # save in scripts
    with open("raw_poke_data.json", "w") as f:
        f.write(json.dumps(data))
    return data


def adjust_pokemon_name(pokemon_name: str):
    # remove everything after -
    if pokemon_name == "nidoran-f":
        return "nidoran♀"
    if pokemon_name == "nidoran-m":
        return "nidoran♂"
    if pokemon_name == "farfetchd":
        # farfetch'd, need to encode '
        return "farfetch%27d"
    if pokemon_name == "mr-mime":
        return "Mr._Mime"

    if pokemon_name == "mime-jr":
        return "Mime_Jr."

    if pokemon_name == "deoxys-normal":
        return "Deoxys"
    if pokemon_name == "wormadam-plant":
        return "Wormadam"
    if pokemon_name == "giratina-altered":
        return "Giratina"
    if pokemon_name == "flabebe":
        return "Flabébé"
    if pokemon_name == "meowstic-male":
        return "Meowstic"
    if pokemon_name == "Aegislash":
        return "Aegislash"

    if pokemon_name == "type-null":
        return "Type:_Null"
    if pokemon_name == "minior-red-meteor":
        return "Minior"
    if pokemon_name == "mimikyu-disguised":
        return "Mimikyu"
    if pokemon_name == "jangmo-o":
        return "Jangmo-o"
    if pokemon_name == "hakamo-o":
        return "Hakamo-o"
    if pokemon_name == "kommo-o":
        return "Kommo-o"
    if pokemon_name == "tapu-koko":
        return "Tapu_Koko"

    if pokemon_name == "tapu-lele":
        return "Tapu_Lele"

    if pokemon_name == "tapu-bulu":
        return "Tapu_Bulu"

    if pokemon_name == "tapu-fini":
        return "Tapu_Fini"

    if pokemon_name == "toxtricity-amped":
        return "Toxtricity"
    if pokemon_name == "sirfetchd":
        return "Sirfetch'd"

    if pokemon_name == "mr-rime":
        return "Mr._Rime"

    if pokemon_name == "eiscue-ice":
        return "Eiscue"

    if pokemon_name == "indeedee-male":
        return "Indeedee"
    if pokemon_name == "morpeko-full-belly":
        return "Morpeko"

    if pokemon_name == "urshifu-single-strike":
        return "Urshifu"
    if pokemon_name == "zacian-hero":
        return "Zacian"

    if pokemon_name == "basculegion-male":
        return "Basculegion"

    if pokemon_name == "enamorus-incarnate":
        return "Enamorus"
    
    if pokemon_name == "deoxys-attack":
        return None
    if pokemon_name == "deoxys-defense":
        return None
    if pokemon_name == "deoxys-speed":
        return None
    if pokemon_name == "wormadam-sandy":
        return None
    if pokemon_name == "wormadam-trash":
        return None

    if pokemon_name == "shaymin-sky":
        return "shaymin"

    if pokemon_name == "giratina-origin":
        return None
    if pokemon_name == "rotom-heat":
        return "rotom"
    if pokemon_name == "rotom-wash":
        return None
    if pokemon_name == "rotom-frost":
        return None
    if pokemon_name == "rotom-fan":
        return None
    if pokemon_name == "rotom-mow":
        return None
    if pokemon_name == "castform-sunny":
        return "castform"
    if pokemon_name == "castform-rainy":
        return None
    if pokemon_name == "castform-snowy":
        return None

    if pokemon_name == "basculin-blue-striped":
        return "basculin"
    if pokemon_name == "darmanitan-zen":
        return "darmanitan"

    if pokemon_name == "meloetta-pirouette":
        return "meloetta"

    if pokemon_name == "tornadus-therian":
        return "Tornadus"
    if pokemon_name == "thundurus-therian":
        return "Thundurus"
    if pokemon_name == "landorus-therian":
        return "Landorus"
    if pokemon_name == "kyurem-black":
        return "Kyurem"
    if pokemon_name == "kyurem-white":
        return None
    
    if "-" in pokemon_name:
        # capitalize first letter split by -
        adjusted_name = pokemon_name.split("-")
        adjusted_name = [name.capitalize() for name in adjusted_name]
        # adjusted_name = "-".join(adjusted_name)
        return None
    # capitalize first letter
    pokemon_name = pokemon_name.capitalize()
    return pokemon_name
def parse_bulbagarden_by_pokemon_name(pokemon_name: str):
    print(f"Getting image for {pokemon_name}")
    params = {
        "action": "parse",
        "format": "json",
        "page": f"{pokemon_name}_(Pokémon)",
    }
    json_page = requests.get(f"https://bulbapedia.bulbagarden.net/w/api.php", params=params, timeout=20).json()

    # check for error propxerty
    if "error" in json_page:
        print(json_page["error"])
        raise AssertionError("Error in parsing bulbagarden")
    html = json_page["parse"]["text"]["*"]
    soup = BeautifulSoup(html, "html.parser")
    # find all images in soup and get the one with the pokemon name
    images = soup.find_all("img")
    # strip all non-alphanumeric characters from pokemon name
    clean_name = "".join([char for char in pokemon_name if char.isalnum()])
    for image in images:
        if clean_name.upper() in image["src"].upper():
            return image["src"]
        else:
            # return one if it is 250px
            if "250px" in image["src"]:
                return image["src"]

if __name__ == "__main__":
    # if raw_poke_data.json is not present, get data from pokeapi
    if not os.path.exists("pokemon_data.json"):
        data = get_data()
    else:
        # load
        with open("pokemon_data.json", "r") as f:
            data = json.loads(f.read())
    for pokemon in data["data"]["pokemon"]:
        if "img_src" in pokemon and pokemon["img_src"] != None:
            continue
        # adjust pokmeon name by removing everything past -
        adjusted_name = adjust_pokemon_name(pokemon["name"])
        if adjusted_name == None:
            print(f"Could not find image for {pokemon['name']}")
            continue
        img_src = parse_bulbagarden_by_pokemon_name(adjusted_name)
        # save image url in pokemon
        if img_src == None:
            print(f"Could not find image for {pokemon['name']}")
            raise AssertionError("Could not find image")
        pokemon["img_src"] = img_src
        with open("pokemon_data.json", "w") as f:
            f.write(json.dumps(data))
    # get pokemon from bulbedpia

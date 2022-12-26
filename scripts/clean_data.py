# for pokemon_data.json
# wipe all entries with no image

# Path: scripts/clean_data.py
import json
with open("pokemon_data.json", "r") as f:
    data = json.loads(f.read())

clean_data = []
for pokemon in data["data"]["pokemon"]:
    if "img_src" not in pokemon or pokemon["img_src"] == None:
        data["data"]["pokemon"].remove(pokemon)
    else:
        clean_data.append(pokemon)

with open("clean_pokemon.json", "w") as f:
    f.write(json.dumps(clean_data, indent=4))
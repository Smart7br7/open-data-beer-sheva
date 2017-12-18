#! usr/bin/env python

import codecs
import json




data = json.load(open('education.geojson'))

geojson = {
    "type": "FeatureCollection",
    "features": [
    {
        "type": "Feature",
        "geometry" : {
            "type": "Point",
            "coordinates": [d["properties"]["Xgoogle"], d["properties"]["Ygoogle"]],
            },
        "properties" : d["properties"],
     } for d in data]
}



# output = open(out_file, 'w')
# json.dump(geojson, output)

with codecs.open('education2.geojson', 'w', encoding='utf-8') as f:
    json.dump(geojson, f, ensure_ascii=False)

# print geojson

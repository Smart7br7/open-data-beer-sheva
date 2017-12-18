#! /bin/bash
dir=$1
for file in "$dir"/*.shp ; do
	filename=$(basename $file)
	filedir=${file%/*}
	filedir2=${filedir%/*}
	filedirdata=${filedir2%/*}
	readydir="/home/br7azure01/ckan/Documentation/Datasets"
        #echo ${filedir2%/*}
	#echo "$filedir"
	#echo "${filename%.shp}"
	
	# Generate GeoJSON
	ogr2ogr -f GeoJSON "$readydir"/geojson/"${filename%.shp}".geojson "$file"
	# Generate CSV
	ogr2ogr -f CSV "$readydir"/csv/"${filename%.shp}".csv "$file" -lco GEOMETRY=AS_XYZ
	# Generate SHP zip
	zip "$readydir"/shp/"${filename%.shp}".zip "$filedir"
	echo "finished ${filename%.shp}"

	
done

#Deploy
cp -a /home/br7azure01/ckan/Documentation/Datasets/geojson/. /usr/lib/ckan/default/src/ckan/ckan/public/datasets/geojson/
cp -a /home/br7azure01/ckan/Documentation/Datasets/csv/. /usr/lib/ckan/default/src/ckan/ckan/public/datasets/csv/
cp -a /home/br7azure01/ckan/Documentation/Datasets/shp/. /usr/lib/ckan/default/src/ckan/ckan/public/datasets/shp/
#cp -a /home/br7azure01/ckan/Documentation/Datasets/xml/. /usr/lib/ckan/default/src/ckan/ckan/public/datasets/xml/
#cp -a /home/br7azure01/ckan/Documentation/Datasets/json/. /usr/lib/ckan/default/src/ckan/ckan/public/datasets/json/

echo "finished"

# run: sudo bash ogr.sh /home/br7azure01/ckan/Documentation/Datasets/2017-08-22-shelters/


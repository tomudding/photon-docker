#!/bin/bash

# Download elasticsearch index
if [ ! -d "/photon/photon_data/elasticsearch" ]; then
    echo "Downloading search index..."
    wget --progress=dot:giga -O - https://download1.graphhopper.com/public/photon-db-latest.tar.bz2 | pbzip2 -cd | tar x
fi

# Start photon if elastic index exists
if [ -d "/photon/photon_data/elasticsearch" ]; then
    echo "Starting Photon..."
    java -jar photon.jar $@
else
    echo "Could not start photon, the search index could not be found"
fi

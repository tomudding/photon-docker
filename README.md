# photon-docker

A Dockerized version of [photon](https://github.com/komoot/photon), an open-source geocoder built for OpenStreetMap data, running on GraalVM.

## Features

- Built on GraalVM Community Edition for optimal performance.
- Easily deployable on Docker Swarm.
- Supports small- to large-scale geocoding operations (e.g. for [DaWarIch](https://github.com/Freika/dawarich)).

## Requirements

- **Storage:** The downloaded database requires approximately **200GB of storage space**.
- **RAM:** 
  - For high-performance instances, at least **16GB of RAM** is recommended.
  - For smaller instances queried occasionally, **2 to 4GB of RAM** should suffice.

## Limitations
While weekly updates are provided for the database, they are not automatically downloaded and/or processed. To update your database, remove the existing database from the `photon_data` volume and restart the stack to download a new version.

## Acknowledgements
- [Tom Snoei](https://tonsnoei.nl/en/post/2023/03/20/set-up-your-own-geocoder-api/) for original implementation.
- [GraphHopper](https://www.graphhopper.com/) for providing the database.
- [photon](https://github.com/komoot/photon).

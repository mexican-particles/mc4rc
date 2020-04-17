#!/bin/bash

set -Cuex

# cf. https://www.spigotmc.org/wiki/buildtools/
BUILD_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

if [[ -z "$(ls ./data | grep plugins)" ]]; then
  cd /tmp
  wget ${BUILD_URL} -O BuildTools.jar
  java -jar BuildTools.jar --output-dir /var/lib/mc/data
fi

## TODO Dynmap の設定は別途できるように
DYNMAP_FILE="Dynmap-3.0-beta-10-spigot.jar"

cd /tmp
wget https://dynmap.us/releases/${DYNMAP_FILE}
mv ./${DYNMAP_FILE} /var/lib/mc/data/plugins
## --

JAR_FILE="$(ls /var/lib/mc/data | grep spigot-)"

cd /var/lib/mc/data

## TODO メモリの指定は外部から注入できるように
java -Xms8G -Xmx16G -jar ${JAR_FILE} nogui

#!/bin/bash

BUILD=./build
if [ -d $BUILD ]; then
  rm -R "$BUILD"
fi

mkdir "$BUILD"

images=()
for file in ./app/*.jpeg; do
  filename=$(basename "$file")  

  images+=($filename)
  cp $file "$BUILD/$filename"
done

jq -c -n '{ images: $ARGS.positional }' --args "${images[@]}" > "$BUILD/info.json"

cp ./app/index.html "$BUILD/index.html"

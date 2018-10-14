#!/usr/bin/env bash

set -e;

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/.."

image_tag="latest";
image_full_name="gotch/djangodocker:$image_tag";

echo "Building image '$image_full_name'";
docker build . -t "$image_full_name";

echo "Authenticating";
# The two variables are configured in travis.
#echo "$DOCKER_PASS" | docker login -u="$DOCKER_USERNAME" --password-stdin;

echo "Pushing image '$image_full_name'";
docker push "$image_full_name";
echo "Push finished!";

exit 0;
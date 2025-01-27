#!/bin/env bash
cd src

mkdir -p public
mkdir -p plantuml-images
podman run \
  --rm \
  -v `pwd`/:/var/docs/:ro \
  -v `pwd`/plantuml-images/:/var/docs/plantuml-images/:rw \
  -v `pwd`/public/:/var/docs/public/:rw \
  --entrypoint pandoc \
  docker.io/ojob/pandoc-plantuml \
  --filter pandoc-plantuml \
  -d theme/pandoc-params.yml \
  --self-contained \
  *.md \
  $*

cd ..

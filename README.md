# Projet Luciole & Rust Embarqué


Le rendu comme présentation est [publié sur la forge Kaizen](https://kzslab.pages.forge.kaizen-solutions.net/stages/2024/Luciole/presentation-projet-rust).



## Création du rendu final

Avec Pandoc 3.6.2 et Reveal.js 5.1, dans `src/`

    pandoc --defaults theme/pandoc-params.yml --self-contained content.md

### Avec Podman

Avec le script de build :

    ./build-pres.sh   src/content.md

En ligne de commande :

    sudo podman run \
        -v "$(pwd)":/var/docs/:ro \
        -v "$(pwd)"/plantuml-images/:/var/docs/plantuml-images/:rw \
        -v "$(pwd)"/public/:/var/docs/public/:rw \
        --entrypoint pandoc \
        ojob/pandoc-plantuml \
        --filter pandoc-plantuml \
        -d slideshow.yml -d theme/pandoc-params.yml \
        src/content.md

### Avec Docker

    mkdir public
    docker run --rm -v "$(pwd)":/data -u $(id -u):$(id -g) docker.io/ojob/pandoc-plantuml \
        --filter pandoc-plantuml -d slideshow.yml -d theme/pandoc-params.yml


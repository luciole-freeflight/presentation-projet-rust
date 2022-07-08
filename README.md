# Présentations sur la Forge Kaizen

Ce projet présente la manière de travailler des présentations sur la Forge Kaizen, en s’appuyant sur la puissance de Git, GitLab, Markdown, Pandoc et Reveal.js.

Le rendu comme présentation est [publié sur la forge Kaizen](https://poles.pages.forge.kaizen-solutions.net/pole-synergie/presentations/presentations-sur-la-forge-kaizen).

## Utilisateurs

Les projets suivants en font usage, et seront donc à mettre à jour en cas d'amélioration de ce projet :

- utilisant la dernière version de ce projet :

  - [Formation Git](https://forge.kaizen-solutions.net/academy/software-craftmanship/git-first-contact)
  - [Formation CI/CD](https://forge.kaizen-solutions.net/academy/software-craftmanship/formation-ci-cd)
  - [Rendre son code Python installable](https://forge.kaizen-solutions.net/poles/pole-python/presentations/rendre-son-code-python-installable)
  - [Python industriel](https://forge.kaizen-solutions.net/academy/kzs-school/python/python-industriel)

- utilisant une version antérieure de ce projet :

  - [Python Pattern Matching](https://forge.kaizen-solutions.net/poles/pole-python/presentations/python-structural-pattern-matching), dans une version préliminaire

## Création du rendu final

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


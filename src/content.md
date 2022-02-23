---
title: Faire ses présentations sur la forge Kaizen
subtitle: en s'appuyant sur la puissance de Git, Gitlab, Markdown, Pandoc et Reveal.js
keywords: modèle, template, forge, pipeline
author: Joël Bourgault - Kaizen Solutions
lang: fr
---

# Pour quoi faire ?

. . .

ou pourquoi s'éloigner des [outils WYSIWYG][wysiwyg] ?

![](src/wysiwyg website editor.webp)

[wysiwyg]: https://fr.wikipedia.org/wiki/What_you_see_is_what_you_get

## Les avantages, en bref

- écrire dans un format simple et structuré
- en exploitant les outils modernes
- sans (trop) anticiper le format de publication

## Écriture simplifiée

- focalisation sur le fond
- coloration syntaxique automatique (dans les éditeurs de texte sérieux)

## Apports techniques

- lisible de partout
- exemples de code testables
- traduction vers divers formats
- publication automatisable

## Apports organisationnels

- suivi de version trivial
- édition contributive


# Comment ça marche : Markdown { data-background-image="src/structure.jpg" }

## Un format simple

Markdown : fichier en texte 'pur'

- juste quelques symboles pour exprimer la sémantique
- lisible dans tous les logiciels

. . .

et on laisse les outils ajouter la magie ! 🪄

## Exemple de Markdown

::: { .left }

pour du texte, un titre, une liste…

```markdown
## Markdown, un rendu sympa

Un exemple de liste de tâches :

- [ ] liste à cocher, avec [le lien vers ce projet][ce-projet]
- [x] avec des tâches complétées

[ce-projet]: https://forge.kaizen-solutions.net/poles/pole-synergie
/presentations/presentations-sur-la-forge-kaizen

```

:::

::: { .right }

pour présenter du code

```markdown
Et un exemple de code :

```python
>>> def foo(bar: int) -> list[int]:
...     """Génère des kux sous forme d'entiers."""
...     return list(range(bar))
...
>>> print(foo(8))
[0, 1, 2, 3, 4, 5, 6, 7]

```

:::

## Un rendu sympa

. . .

Un exemple de liste de tâches :

- [ ] liste à cocher, avec [le lien vers ce projet][ce-projet]
- [x] avec des tâches complétées

[ce-projet]: https://forge.kaizen-solutions.net/poles/pole-synergie/presentations/presentations-sur-la-forge-kaizen

. . .

Et un exemple de code :

```python
>>> def foo(bar: int) -> list[int]:
...     """Génère des kux sous forme d'entiers."""
...     return list(range(bar))
...
>>> print(foo(8))
[0, 1, 2, 3, 4, 5, 6, 7]

```

# Comment ça marche : la forge { data-background-image="src/forge.jpg" }

## Un portail

instance de [Gitlab](https://gitlab.org)

![](src/logo Gitlab.svg){ style="height: 150px;" }

::: { .left }

- pour héberger des projets
- organisés en groupes avec gestion de droits

:::

::: { .right }

![](src/forge Kaizen.PNG)

:::

## Suivi de version

avec Git bien sûr !

![](src/logo Git.svg){ style="height: 80px;" }

::: { .left }

- liste des versions, avec commentaire et auteur
- étiquettes d'identification

:::

::: { .right }

![](src/commits.PNG)

:::

## Édition contributive

::: { .left }

avec les requêtes de fusion

- basé sur les branches de Git
- circuit d'approbation configurable

:::

::: { .right }

![](src/merge request.PNG)

:::

## Traitements automatisables

- vérification des exemples de code
- application de règles ad hoc
- conversion de format
- publication


# Comment ça marche : les pipelines { data-background-image="src/pipeline.jpg" }

## [Gitlab-CI](https://docs.gitlab.com/ee/ci/)

le fichier `.gitlab-ci.yml` définit les actions à réaliser

```yaml
stages:
  - test
  - build

test:
  stage: test
  image: python:3.10-slim
  script:
    - python --version
    - python -m doctest src/content.md

(...)
```

. . .

![](src/pipeline passed.PNG)

## Exemple de job : test de code

les exemples de code (genre [`doctest` Python][doctest]) sont testables automatiquement 🤩

![](src/pipeline failed - details.PNG)
![](src/pipeline failed - summary.PNG)

[doctest]: https://docs.python.org/3/library/doctest.html

## [Pandoc](https://pandoc.org)

assure la traduction, paramétré à l'envi par un fichier YAML :

- format de sortie (ici Reveal.js)
- variables Pandoc sympas : `standalone`, `self-contained`, `fail-if-warning`
- variables de sortie : thème à appliquer...

## [Reveal.js](https://reveal.js)

affiche et anime des présentations dans les navigateurs modernes

![](src/Reveal.js.PNG)

## [Gitlab pages](https://docs.gitlab.com/ee/user/project/pages/)

- publication de sites web statiques
- en recopiant le contenu de `/public/`, en servant le fichier `index.html`
- déclenché par un job nommé `pages`

## Et toutes sortes de plugins pour Markdown

- génération de diagrammes : [PlantUML](https://plantuml.com/fr/), [Mermaid](https://mermaid-js.github.io/mermaid/#/)...


# Annexes { data-background-image="src/library.jpg" }

## Quelles limites ?

- l’insertion de diagrammes un peu classouilles n’est pas triviale (genre SmartArt)
- visuel très formatté ; il faut connaître HTML/CSS pour aller plus loin

## Saines lectures

- [Plain Text, Papers, Pandoc](https://kieranhealy.org/blog/archives/2014/01/23/plain-text/)

  Pour un usage académique de Markdown et Pandoc, avec gestion des citations,
  des numérotations des tables et des figures...

- [En finir avec Word ! Pour une analyse des enjeux relatifs aux traitements de texte et à leur utilisation](https://eriac.hypotheses.org/80)

  Essai quasi-philosophique sur l'évolution des traitements de texte et de la maîtrise des utilisateurs

## Crédits photo

- [forgeron : Jonny Gios](https://unsplash.com/photos/mlI9vPVDV4k)
- [pipelines : Nicolas Messifet](https://unsplash.com/photos/rsjhvlghOLw)
- [structure : Danist Soh](https://unsplash.com/photos/2vhSS6ksgD0)
- [bibliothèque : Darwin Vegher](https://unsplash.com/photos/W_ZYCEUapF0)


# Merci ! { data-background-image="theme/image page de fin.jpg" }

---
title: Faire ses présentations sur la forge Kaizen
subtitle: en s'appuyant sur la puissance de Git, Gitlab, Markdown, Pandoc et Reveal.js
keywords: modèle, template, forge, pipeline
author: Joël Bourgault - Kaizen Solutions
lang: fr
---

#

- pour quoi faire ?
- comment s'y prendre
- comment ça marche

# Pour quoi faire ?

ou pourquoi s'éloigner des [outils WYSIWYG][wysiwyg] ?

[wysiwyg]: https://fr.wikipedia.org/wiki/What_you_see_is_what_you_get

## Les avantages, en bref

- écrire dans un format simple et structuré
- en exploitant les outils modernes
- sans (trop) anticiper le format de publication

## Écriture simplifiée

- focalisation sur le fond
- coloration syntaxique automatique (dans les éditeurs de texte sérieux)

## Apports organisationnels

- suivi de version trivial
- édition contributive

## Apports techniques

- lisible de partout
- exemples de code testables
- traduction vers divers formats
- publication automatisable


# Comment ça marche

# Markdown

![](src/structure.jpg)

## Un format simple

fichier en 'pur' texte :

- compréhensible directement par des humains
- juste quelques symboles pour exprimer la sémantique

et on laisse les outils ajouter la magie

## Exemple

```markdown
## Markdown, un rendu sympa

Un exemple de liste de tâches :

- [ ] liste à cocher, avec [le lien vers ce projet][ce-projet]
- [x] avec des tâches complétées

[ce-projet]: https://forge.kaizen-solutions.net/poles/pole-synergie/presentations/presentations-sur-la-forge-kaizen

```

## Exemple, suite

Et un exemple de code :

```mahkdown
```python
>>> def foo(bar: int) -> list[int]:
...     """Génère des kux sous forme d'entiers."""
...     return list(range(bar))
...
>>> print(foo(8))
[0, 1, 2, 3, 4, 5, 6, 7]

```

## Markdown, un rendu sympa

Un exemple de liste de tâches :

- [ ] liste à cocher, avec [le lien vers ce projet][ce-projet]
- [x] avec des tâches complétées

[ce-projet]: https://forge.kaizen-solutions.net/poles/pole-synergie/presentations/presentations-sur-la-forge-kaizen

Et un exemple de code :

```python
>>> def foo(bar: int) -> list[int]:
...     """Génère des kux sous forme d'entiers."""
...     return list(range(bar))
...
>>> print(foo(8))
[0, 1, 2, 3, 4, 5, 6, 7]

```

# La forge

![](src/forge Kaizen.PNG)

## Suivi de version

avec Git

- liste des versions, avec commentaire et auteur
- étiquettes d'identification

![](src/commits.PNG)

## Édition contributive

avec les requêtes de fusion

- basé sur les branches de Git
- circuit d'approbation configurable

![](src/merge request.PNG)

## Traitements automatisables

- vérification des exemples de code
- application de règles ad hoc
- conversion de format
- publication


# Comment ça marche

![](src/pipeline.jpg)

## [Gitlab-CI](https://docs.gitlab.com/ee/ci/)

suit les instructions du `.gitlab-ci.yml` pour exécuter les outils en séquence

![](src/pipeline passed.PNG)

## Exemple de job : [`doctest` Python](https://docs.python.org/3/library/doctest.html)

avec du code formatté comme `doctest`, c'est testable :

```
$ python -m doctest src/content.md
```

on valide en continu que les exemples publiés sont conformes 🤩

![](src/pipeline failed - summary.PNG)
![](src/pipeline failed - details.PNG)

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


# Annexes

## Saines lectures

- [Plain Text, Papers, Pandoc](https://kieranhealy.org/blog/archives/2014/01/23/plain-text/)

  Pour un usage académique de Markdown et Pandoc, avec gestion des citations,
  des numérotations des tables et des figures...

- [En finir avec Word ! Pour une analyse des enjeux relatifs aux traitements de texte et à leur utilisation](https://eriac.hypotheses.org/80)

  Essai quasi-philosophique sur l'évolution des traitements de texte et de la maîtrise des utilisateurs

## Crédits photo

- [pipelines : Nicolas Messifet](https://unsplash.com/photos/rsjhvlghOLw)
- [structure : Danist Soh](https://unsplash.com/photos/2vhSS6ksgD0)

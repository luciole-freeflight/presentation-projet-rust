---
title: Modèle de présentation Kaizen
subtitle: en utilisant la forge
keywords: modèle, template, forge
author: Joël Bourgault - Kaizen Solutions
lang: fr
---

# Un titre 1

Avec du texte d'introduction

- et des puces
- et du contenu

## Titre 2, imbriqué

Cette planche est de niveau inférieur, et donc en vertical dans l'affichage.

## Quelques exemples de Markdown

Un bête [lien vers ce projet sur la Forge Kaizen][1]

- [ ] liste à cocher
- [x] avec des tâches complétées

[1]: https://forge.kaizen-solutions.net/-/ide/project/poles/pole-synergie/pr-sentations/presentations-sur-la-forge-kaizen/tree/1-creer-bases-de-la-presentation/


# Mais quel intérêt ?

Ben oui, c'est quand même contraignant d'écrire en Markdown !

## Présenter du code facilement 

coloration syntaxique 
test des exemples de code

voir section suivante

## Faire du suivi en version

en utilisant les tickets et les requêtes de fusion

## Générer des présentations dans des pipelines

mettre facilement à jour les modèles de document
générer des documents depuis des fichiers textes


# Usage avec du code

## Exemple de code

```python
>>> def foo(bar: int) -> list[int]:
...     """Génère des kux sous forme d'entiers.
... 
...     args:
...         bar: le nombre de kux à générer
...     
...     returns:
...         des kux en nombre.
...     
...     """
...     return list(range(bar))
... 
>>> print(foo(8))
[0,1,2,3,4,5,6,7]

```

## Et l'usage possible autour de ces codes

Le code de la planche précédente étant formatté comme du `doctest`,
Python peut tester ce code très facilement :

```
$ python -m doctest src/content.md
```

Et ainsi valider que les exemples sont conformes 🤩

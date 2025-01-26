---
title: Luciole
subtitle: Communication instantanée<br/>pour élèves pilotes<br/>sourds & malentendants<br/>
keywords: Rust, Système embarqué
author: Julien Le Guen
date: 2025-01-27
lang: fr
# Options reveal.js
theme: solarized
slideNumber: true
hash: true
center: false
---


# Qui dans l'assemblée

::: notes

Test

:::

::: { .left }
::: incremental

* Fait du Rust

* Fait du parapente

* Enseigne

* N'a pas encore levé la main  :)

:::
:::

::: { .right style="font-size: 5em;" }
?
:::


# Enseignement du parapente { data-background-image="img/groupe_voiles_dune.jpg"}


## Progression en école
Petit groupe, encadrés par deux moniteurs

::: { .left }
Pratique : 10 % de la formation

![](img/pente_ecole.jpg)
:::

. . .

::: { .right }
90 % restant ?

![](img/cours_meteo.jpg)
:::

::: notes
* Meteo
* Aerologie
* Meca Vol
* Legislation
* Facteurs humains
* Gestion du stress, de la fatigue, etc.
* ...
:::

## Aller vers l'autonomie { data-background-image="img/groupe_deco.jpg"}

::: { .left .background }
* Initiation

* Progression

* Perfectionnement

* Cross

* SIV

* ...
:::

. . .

::: incremental 
:::{ .right .background }
* Au début, découverte, petits vols, gestion du stress

* Puis apprendre à rester en l'air

* Puis apprendre à se déplacer, voyager !
:::
:::

::: notes
Plein de stages possibles, but du jeu devenir autonome, responsable de sa formation.

Encadrement par moniteur au sol ou en vol, en liaison radio.
:::

## Progression autonome

Voler seul

::: { .left }
![](img/deco_lever_soleil.jpg)

* Collecte d'informations
* Prises de décision
* Anticipation
* PLAISIR

:::

::: { .right }
![](img/soaring_dune.jpg)
:::

::: notes

:::

## Eleves Sourds

Communication radio impossible.

::: { .left }
**Existant**

* Radios vibrantes (2 signaux possibles)

* Lunettes à LED gauche/droite

* WhatsApp
:::


::: { .right }
![](img/radio-vibrante.jpg){ style="height: 300px;" }

![](img/antennes_marseille.png)
:::

## Besoins

::: incremental
* Communication unidirectionnelle
* Instantanée
* Indication précise si besoin (commande gauche, un peu plus...)
* Indication de haut niveau -> autonomisation
* Non intrusif (champ de vision)
* Intuitif pour l'élève et le moniteur
* Configurable en fonction du stage et de l'exercice
:::

# Système Luciole { data-background-image="img/jordan_raph.jpg"}

## Principe

![](img/principe.png)

## Matériel

::: { .left }
* 2x systèmes radios 
* Manette de jeu
* Lunettes ActiveLook
* Modules vibrants (bracelets)
![](img/activelook.png)
:::

::: { .right }
![](img/photo_radios.jpg)
:::

## Fonctionalités
::: incremental
* TOP : vibration

* Consignes haut-niveau : Lunettes

* Lien radio numérique
  * Adressage
  * Ack, renvoi de message
  * Heartbeat
:::

# Rust Embarqué

## Architecture

# Lunettes ActiveLook

## Communication

::: {.left}
**BLE**

* Protocole bit-oriented
*
:::

::: {.right}
Crate `activelook-rs`
:::

## Simulateur ActiveLook

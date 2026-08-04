# Domain model

> *Les principaux concepts métier de Chronomusica et les relations qui les unissent.*

## Purpose

Ce document décrit le modèle conceptuel de Chronomusica.

Il précise comment les concepts définis dans le glossaire sont reliés entre eux, indépendamment de leur future représentation dans Ruby, Rails ou PostgreSQL.

Cette première version se limite aux concepts actuellement stabilisés :

* `Person` ;
* `Work` ;
* `Place` ;
* `ParentChildRelationship`.

Le modèle sera enrichi progressivement lorsque de nouveaux concepts auront été suffisamment compris et adoptés dans le glossaire.

## Overview

```text
                         ┌─────────────┐
                         │    Place    │
                         └──────▲──────┘
                                │
                        is associated with
                                │
                ┌────────────────┴────────────────┐
                │                                 │
        ┌───────┴──────┐                  ┌───────┴──────┐
        │    Person    │─── contributes──►│     Work     │
        └──────▲───────┘                  └──────────────┘
               │
          parent of
               │
               ▼
        ┌──────────────┐
        │    Person    │
        └──────────────┘

```

Ce diagramme présente les relations conceptuelles, sans préjuger de leur cardinalité précise ni de leur implémentation technique.

## Person

`Person` représente un individu identifié par Chronomusica, qu’il soit artiste ou non.

Un individu peut notamment être connu par :

* son identité ;
* son activité artistique ;
* ses œuvres ;
* les lieux auxquels il est associé ;
* ses relations avec d’autres individus.

Un individu peut être conservé afin d’assurer la cohérence d’une filiation familiale sans nécessairement apparaître dans le catalogue public des artistes.

Un individu peut posséder des dates vitales. Leur valeur peut être exacte ou approximative et reposer sur une naissance, un baptême, un décès ou une inhumation documentés.

## Work

`Work` représente une œuvre possédant une identité propre.

Une œuvre peut être attribuée à un ou plusieurs individus. La nature exacte de cette attribution — composition, livret, orchestration ou autre contribution — sera précisée lorsque le modèle des rôles artistiques sera stabilisé.

Une œuvre peut également être associée à un ou plusieurs lieux, notamment en rapport avec sa composition, sa publication ou sa création.

Ces associations ne signifient pas que les individus ou les lieux font partie de l’œuvre : chaque concept conserve sa propre identité.

## Place

`Place` représente un référent géographique ou politique possédant une identité propre.

Un lieu peut être associé à des individus et à des œuvres.

Ces associations peuvent avoir des significations différentes, par exemple :

* lieu de naissance ou de décès d’un individu ;
* lieu d’activité d’un artiste ;
* lieu de composition, de publication ou de création d’une œuvre.

La nature de chaque association devra être exprimée explicitement lorsque ces relations seront modélisées.

Un lieu peut connaître des évolutions historiques sans cesser de représenter le même référent géographique ou politique.

La représentation temporelle de ces évolutions n’est pas définie dans cette première version du modèle.

## ParentChildRelationship

̀ ParentChildRelationship` représente un lien de filiation direct entre deux individus.

La relation est orientée :

* parent représente l'individu parent ;

* child représente l'individu enfant.

Elle constitue la base de représentation des filiations utiles à Chronomusica.

Les relations de fratrie, de grand-parent, d'oncle, de tante ou de cousin ne sont pas enregistrées lorsqu'elles peuvent être déduites des relations parent-enfant connues.

Les relations de couple ne font pas partie de ce concept. Elles pourront être représentées ultérieurement par un modèle distinct si un besoin métier concret le justifie.

Un lien de filiation reste indépendant d’une éventuelle relation artistique entre les mêmes individus.

Par exemple, Leopold Mozart peut être lié à Wolfgang Amadeus Mozart :

* comme parent ;
* comme éducateur dans un futur modèle de relations artistiques.

D’autres types de relations entre individus pourront être introduits ultérieurement lorsqu’un besoin métier concret le justifiera.

### Invariants du modèle

Un lien de filiation :

* relie toujours deux individus distincts ;
* est orienté du parent vers l'enfant ;
* ne peut jamais relier un individu à lui-même.

## Core relationships

### Person and Work

```text
Person ───── contributes to ─────► Work
```

Une œuvre peut recevoir la contribution d'un ou plusieurs individus.

Chaque contribution possède une nature explicite, par exemple :

* composition ;
* écriture d'un livret ;
* orchestration ;
* arrangement.

Cette relation permet de distinguer les responsabilités respectives de plusieurs individus participant à une même œuvre.

Dans le premier périmètre de Chronomusica, seule la contribution de type composition est nécessaire. Les autres formes de contribution seront introduites lorsqu'un besoin métier concret apparaîtra.

### Person and Place

```text
Person ───── is associated with ─────► Place
```

Un individu peut être associé à plusieurs lieux pour des raisons distinctes.

La relation doit pouvoir exprimer sa signification, par exemple :

* naissance ;
* décès ;
* activité artistique ;
* résidence.

Cette liste n’est pas considérée comme exhaustive à ce stade.

### Work and Place

```text
Work ───── is associated with ─────► Place
```

Une œuvre peut être associée à différents lieux selon la nature du fait concerné :

* composition ;
* publication ;
* création ou première représentation.

Le lieu et l’œuvre restent des entités indépendantes.

### Person and ParentChildRelationship

```text
Person ───── parent of ─────► Person
```

* Un lien de filiation relie un parent à un enfant.
* La relation est orientée.
* Elle constitue le fait familial fondamental représenté par Chronomusica.
* Les autres liens familiaux sont obtenus par déduction lorsqu'ils sont nécessaires.

## Facts and interpretations

Le modèle actuel représente principalement des faits historiques :

* l’existence d’un individu ;
* l’existence d’une œuvre ;
* l’existence d’un lieu ;
* une attribution ;
* une association géographique ;
* un lien de filiation.

Chronomusica pourra ultérieurement proposer une couche d’interprétation permettant d’exprimer des jalons artistiques, des transformations historiques ou des filiations esthétiques.

Cette couche n’est pas encore suffisamment définie pour faire partie du modèle actuel.

Ainsi, le modèle actuel représente des faits historiques et les relations qualifiées qui les unissent.

Les interprétations historiques — telles que les jalons artistiques, les évolutions esthétiques ou les transformations sociétales — pourront être construites ultérieurement à partir de ces faits. Elles constitueront une couche conceptuelle distincte du modèle factuel.

## Concepts deliberately deferred

Les concepts suivants ont été identifiés mais ne sont pas encore intégrés à cette version :

* `ArtistRole` ;
* `ArtisticRelationship` ;
* `ArtisticPeriod` ;
* `ArtisticMovement` ;
* jalons ou contextes historiques ;
* institutions ;
* éditions d’œuvres.

Leur absence ne signifie pas qu’ils sont exclus de Chronomusica. Elle indique uniquement que leur définition ou leur utilité n’est pas encore suffisamment stabilisée.

## Modelling principles

Le modèle de domaine respecte les principes suivants :

1. Les concepts métier sont indépendants des formats d’import.
2. Chaque concept possède une responsabilité identifiable.
3. Les relations sont représentées explicitement lorsqu’elles portent une signification propre.
4. Les informations déductibles ne sont pas dupliquées sans nécessité.
5. Les faits historiques restent distingués de leurs interprétations.
6. Les abstractions ne sont introduites qu’en réponse à un besoin compris et concret.
7. L’implémentation technique doit traduire le modèle, et non le déterminer.

## Current status

Cette version constitue le premier socle conceptuel de Chronomusica.

Elle est appelée à évoluer avec le glossaire et avec l’apparition de nouveaux besoins métier, tout en restant fidèle à la philosophie du projet.

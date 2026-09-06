# Visibility

## Contexte

Le modèle `Person` possède actuellement un attribut `visible`.

Sa signification métier doit être clarifiée.

## Hypothèse actuelle

La visibilité n’est probablement pas une propriété intrinsèque des entités du domaine. Elle dépend de l’angle de vue adopté sur la base de connaissances et de la question à laquelle cette représentation cherche à répondre. Ainsi, une même entité peut être retenue dans une représentation et absente d’une autre.

La visibilité résulte donc d'une sélection opérée par une représentation de la base de connaissances. Les critères de cette sélection dépendent de l'objectif de cette représentation.

## Questions ouvertes

Quel concept portera cet angle de vue : chronologie, projection, récit, sélection, ou autre abstraction encore à découvrir ?

Les rôles artistiques suffisent-ils, ou d'autres formes de participation doivent-elles être prises en compte ?

La visibilité dépend-elle uniquement du métier ou également du contexte d'affichage ?

## Décision provisoire

La visibilité est considérée comme une propriété calculable.

Les règles exactes de calcul restent à définir avant toute modification du modèle `Person`.

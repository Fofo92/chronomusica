# Objet

Cette note rassemble les réflexions actuelles concernant un éventuel Value Object `RecordedDate`. Il ne s'agit pas d'une décision d'architecture. Le document a pour objectif de conserver les arguments déjà établis afin d'éviter de les reconstruire ultérieurement.


## État actuel

- le besoin est confirmé ;
- le concept n'est pas encore implémenté.

## Responsabilités pressenties

Le bilan provisoire à date est :

- représenter une information temporelle ;
- exprimer son degré d'incertitude ;
- comparer deux informations temporelles ;
- ne pas connaître les classes qui l'utilisent ;
- ne pas interpréter le sens métier d'une comparaison.

## Questions ouvertes

- la représentation des intervalles (avant, entre, vers, etc.) ;
- la place éventuelle de basis ;
- le nom définitif (RecordedDate ou autre) ;
- l'égalité entre deux Value Objects portant des incertitudes différentes.

## Décision provisoire

À ce stade du projet :

- `RecordedDate` est considéré comme un candidat crédible à devenir un Value Object partagé ;
- son implémentation est volontairement différée ;
- sa responsabilité principale serait de représenter une information temporelle qualifiée et de permettre sa comparaison ;
- il ne doit pas connaître les concepts métier (`Person`, `Work`, `ArtisticEvent`, etc.) qui l'utilisent ;
- la signification métier d'une comparaison temporelle appartient aux modèles métier ou aux objets d'analyse qui les mettent en relation ;
- la place éventuelle de `basis` dans le Value Object reste ouverte.

Cette décision sera réévaluée lorsque plusieurs usages concrets permettront de stabiliser définitivement l'interface du Value Object.

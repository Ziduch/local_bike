#  Local Bike – Analytics Engineering Project

## Objectif  
Construire un modèle de données analytique pour analyser les performances commerciales de **Local Bike** (magasins, produits, vendeurs) et produire un tableau de bord décisionnel.

## Architecture  
- **Staging (Bronze)** : nettoyage et standardisation  
- **Intermediate (Silver)** : agrégations et logique métier  
- **Mart (Gold)** : tables finales prêtes pour la BI  

Chaque mart respecte un grain explicite (ex : 1 ligne = 1 jour  1 magasin).

## Qualité des données  
Tests implémentés :  
- `not_null`, `unique`  
- `relationships`  
- `accepted_range`  
- `unique_combination_of_columns`  

Les indicateurs calculés (ex : panier moyen) sont documentés et validés.

## Visualisation  
Dashboard Tableau incluant :  
- CA journalier et mensuel  
- Classement des produits  
- Performance des vendeurs  
- Suivi des stocks  


# Architecture du Projet - ForkSure (Sure)

ForkSure est une application de finances personnelles basée sur Ruby on Rails.

## Entités Principales
- **Family** : Niveau de stockage des abonnements, comptes financiers et préférences.
- **User** : Gère les sessions, appartient à une `Family` (admin ou membre).
- **Account** : L'entité centrale représentée par le modèle `account.rb`. Utilise le "delegated type" pour les sous-types (Depository, Investment, Crypto, Property, Vehicle, etc.).

## Entrées (Entries)
Les `Entry` modifient le solde (`balance`) ou les avoirs (`holding`) d'un compte.
- **Valuation** : Mesure absolue de la valeur d'un compte à une date donnée.
- **Transaction** : Flux entrant ou sortant (revenu ou dépense).
- **Trade** : Achat ou vente d'avoirs (spécifique aux comptes d'investissement).

## Flux de Données et Syncs (Syncables)
Le concept de `Syncable` permet de synchroniser les données en arrière-plan.
1. **Account Sync** : Calcule les soldes quotidiens, fait correspondre les transferts. Dépend du `BalanceCalculator`.
2. **Data Providers Sync** : (ex: PlaidItem) Récupère les données via API, les normalise et les charge dans les modèles internes.
3. **Family Sync** : Orchestre les synchronisations des comptes et des items de la famille.

## Fournisseurs de Données (Providers)
- Utilise un `Provider::Registry` pour gérer les services tiers (taux de change, prix des titres).
- Les modèles utilisent le concern `Provided` pour accéder aux données sans se soucier du fournisseur concret choisi.

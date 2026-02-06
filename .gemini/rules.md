# Règles Générales et Conventions - ForkSure

Ce document regroupe les règles et conventions de développement pour le projet ForkSure.

## Principes Généraux
- Utiliser `Current.user` (pas `current_user`).
- Utiliser `Current.family` (pas `current_family`).
- Les migrations ActiveRecord doivent hériter de `ActiveRecord::Migration[7.2]`.

## Conventions Rails (Skinny Controller, Fat Models)
- Maximiser l'utilisation des POROs (Plain Old Ruby Objects) et des Rails Concerns dans `app/models/`.
- Éviter d'ajouter des dossiers comme `app/services/` ; privilégier la logique dans les modèles ou les concerns.
- Les modèles doivent répondre à des questions sur eux-mêmes (ex: `account.balance_series`).

## Frontend et Design (Hotwire / Tailwind)
- Privilégier les solutions côté serveur (Turbo Frames, Turbo Streams).
- Utiliser le HTML sémantique natif (`<dialog>`, `<details>`) avant de créer des composants JS.
- Utiliser TailwindCSS v4.x avec le système de design défini dans `app/assets/tailwind/maybe-design-system.css`.
- Utiliser exclusivement le helper `icon` pour les icônes.
- **Stimulus** : Utiliser des actions déclaratives en ERB plutôt que des écouteurs d'événements impératifs dans le JS.

## Tests (Minitest + Fixtures)
- Utiliser exclusivement Minitest et les fixtures (pas de RSpec ni de factories).
- Garder les fixtures minimales (2-3 par modèle).
- Tester uniquement les chemins critiques et la logique métier importante.
- Tester les sorties des méthodes de requête et l'appel correct des méthodes de commande.

## Conventions Comptables
- **Revenus (Crédit)** : Toujours stockés comme montants **négatifs** en base de données.
- **Dépenses (Débit)** : Toujours stockés comme montants **positifs** en base de données.
- L'interface utilisateur inverse ces signes pour l'affichage (le négatif en DB devient positif vert en UI).

## Docker et Exécution
- **STRICT** : Toujours exécuter les commandes Rails via Docker : `docker exec -i sure-web ...`.
- Redémarrer le conteneur `sure-web` (`docker restart sure-web`) après des changements si le hot-reload ne réagit pas.

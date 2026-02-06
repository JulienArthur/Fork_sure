# Intégration Orby - ForkSure

ForkSure fait partie de l'écosystème Orby et fonctionne de manière conteneurisée.

## Structure Docker (docker-compose.yml)
ForkSure est composé de plusieurs services :
- `sure-web` : Serveur Rails principal accessible via le réseau `proxy-web`.
- `sure-worker` : Worker Sidekiq pour les tâches de fond.
- `sure-db` : Base de données PostgreSQL dédiée.
- `sure-redis` : Instance Redis pour Sidekiq et le cache.

## Configuration Réseau et Accès
- Géré par le conteneur `caddy` d'Orby pour le reverse proxy.
- Utilise les variables d'environnement définies dans le projet Orby parent (ex: `SURE_DB_PASSWORD`, `SECRET_KEY_BASE`).

## Persistance
- Les données de la base sont stockées dans `./data/public/postgres/sure`.
- Le stockage local (ActiveStorage) est monté dans `./data/public/sure/storage`.

## Commandes Courantes
- Rails Console : `docker exec -it sure-web bin/rails c`
- Migrations : `docker exec -it sure-web bin/rails db:migrate` (Note : Ne pas lancer automatiquement selon les règles générales).
- Logs : `docker logs -f sure-web`

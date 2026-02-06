# Journal de Développement - ForkSure

## 05/02/2026

### 📊 Répartition des Investissements (Dashboard)
- **Visualisation** : Ajout d'un graphique en anneau (Donut Chart) sur le tableau de bord.
- **Détails** : Affichage de la liste des enveloppes d'investissement avec montants et proportions.
- **Fix** : Correction d'une erreur 500 liée aux libellés de sous-types.

### 🌍 Filtrage Régional (Préférences)
- **Paramètre** : Ajout de l'option `filter_investment_subtypes_by_region` (Table `users`).
- **UI** : Intégration d'un bouton de bascule (toggle) premium avec auto-sauvegarde (Stimulus).
- **Logique** : Filtrage dynamique des sous-types selon la devise du foyer (EUR -> FR) et les types généraux.
- **Localisation** : Traductions FR/EN complètes pour les libellés et descriptions.

### 🇫🇷 Adaptation au Marché Français
- **Sous-types** : Ajout du **PEE** (Plan Épargne Entreprise).
- **Enveloppes** : Intégration de l'Assurance Vie, PEA, PEA-PME, PER, et livrets réglementés (A, LDD, LEP).

### 🛠 Infrastructure & Git
- **Compatibilité** : Correction du `Gemfile` (retrait plateforme `windows`) pour assurer le build sur macOS/Mac mini.
- **Migration** : Création et exécution de la migration pour les préférences utilisateur.
- **Identité** : Correction du nom de l'auteur des commits (**JulienArthur**).
- **Synchronisation** : Mise à jour du fork avec le dépôt officiel (`upstream`). Résolution de conflits dans le contrôleur utilisateur et les localisations pour maintenir nos fonctions personnalisées.

### 🎨 Nouveau Type d'Actif : Œuvre d'Art
- **Modèle** : Création du modèle `Artwork` avec icône palette et couleur violette.
- **Migration** : Table `artworks` créée avec UUID.
- **Traductions** : Ajout des libellés FR/EN pour les œuvres d'art.
- **Routes** : Ajout des routes RESTful pour les artworks.
- **Contrôleur** : Création du `ArtworksController` avec le concern `AccountableResource`.
- **Vues** : Création des formulaires de création et édition d'œuvres d'art.
- **Personnalisation** : Ajout de champs spécifiques (`author`, `acquisition_price`, `acquisition_source`) et support pour une photo d'illustration via Active Storage.

## 06/02/2026

### 🐳 Protocole Docker & Standardisation
- **Docker First** : Mise en place d'une règle stricte imposant l'usage de `docker exec -i sure-web` pour toutes les commandes Rails/Bundle.
- **Nettoyage** : Suppression des fichiers de règles redondants (`AGENTS.md`, `CLAUDE.md`) pour centraliser la configuration dans `.agent/rules.md`.
- **Convention Comptable** : Documentation de la convention de signes (Revenus < 0, Dépenses > 0) dans les règles globales pour éviter les inversions de données.

### 🏦 Correction Données Qonto
- **Data Fix (Signes)** : Correction de l'inversion des signes sur les transactions Qonto (Revenus en négatif, Dépenses en positif).
- **Data Fix (Balances)** : Résolution du bug de solde à 0 lors de la synchro.
    - **Processor** : Utilisation de `set_current_balance` pour forcer la création du point d'ancrage (`current_anchor`).
    - **Importer** : Amélioration de la sélection du solde via l'API Enable Banking (gestion des multi-balances par matching de nom "Compte principal" / "Réserve TVA").
    - **Rattrapage** : Injection manuelle des soldes corrects (6 876,74 € et 10 000,00 €) pour rétablir l'historique.

### 🎨 Finalisation Artwork
- **Validation** : Vérification bout-en-bout du modèle `Artwork` (attributs `author`, `acquisition_price`, etc.).
- **Stabilité** : Confirmation du bon fonctionnement des migrations et des classes monétisables.

### 🧮 Estimateur FIRE & Dashboard Pro Max
- **FIRE Estimator** : Implémentation d'un calculateur FIRE avec paramètres personnalisables (`fire_birth_year`, `fire_retirement_age`). Redesign complet "Native UI" (fin du Glassmorphism).
- **Dashboard Restructuring** : 
    - Regroupement des métriques de Cashflow dans un bloc `cashflow_summary`.
    - Ajout de graphiques Donut interactifs (Revenus vs Dépenses) alignés côte à côte.
    - Création de `_donut_chart_card.html.erb` réutilisable.
    - Suppression des listes de catégories sous les donuts pour un look minimaliste.
- **Bug Fixes & Polish** :
    - **PagesController** : Correction d'erreurs de syntaxe (`end` manquant) et restauration de méthodes orphelines.
    - **Dashboard Sections** : Fix de la logique de tri (`any?`) pour assurer la présence de tous les panels (Sankey, Net Worth, etc.).
    - **Local Variables** : Fix d'erreurs 500 dans les partials.

### 🛠 État du Dépôt et Bilan
- **Branche** : `main` (à jour avec upstream).
- **Modifications appliquées** :
    - `PagesController.rb` : Logique dashboard et fix syntaxe.
    - `FireController.rb` : Logique FIRE native.
    - `Setting.rb` : Préférences utilisateur FIRE.
    - Vues et Localisations : Harmonisation design system et traductions FR.
- **Infrastructure** : Reconstruction Docker `sure-web` validée.

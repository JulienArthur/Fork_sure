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

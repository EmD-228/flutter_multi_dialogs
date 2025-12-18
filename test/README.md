# Tests pour multiple_dialog

Cette suite de tests couvre tous les composants du package multiple_dialog.

## Structure des tests

```
test/
├── models/
│   ├── direction_test.dart       # Tests pour Direction
│   └── orientations_test.dart    # Tests pour Orientations enum
├── builders/
│   ├── dialog_builder_test.dart  # Tests pour DialogBuilder
│   └── simple_builder_test.dart  # Tests pour SimpleBuilder
├── dialogs/
│   ├── alert_dialog_test.dart           # Tests pour showAlertDialog et showIconAlertDialog
│   ├── loading_dialog_test.dart         # Tests pour showLoadingDialog et LoadingDialog
│   ├── list_dialog_test.dart            # Tests pour showSimpleListDialog et SimpleListDialog
│   ├── custom_dialog_test.dart          # Tests pour showCustomDialog et showCustomSimpleDialog
│   └── custom_alert_dialog_test.dart    # Tests pour showCustomAlertDialog
└── multiple_dialog_test.dart    # Tests d'intégration généraux
```

## Exécution des tests

### Tous les tests
```bash
flutter test
```

### Tests spécifiques
```bash
# Tests des models
flutter test test/models/

# Tests des dialogs
flutter test test/dialogs/

# Un fichier spécifique
flutter test test/dialogs/alert_dialog_test.dart
```

### Avec couverture
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Types de tests

### Tests unitaires
- **Models** : Vérification de la création et des propriétés
- **Builders** : Vérification de la configuration

### Tests de widgets
- Affichage correct des dialogs
- Interactions utilisateur (taps, callbacks)
- Fermeture des dialogs
- Propriétés personnalisées

### Tests d'intégration
- Fonctionnement avec MaterialApp
- Export des APIs publiques
- Compatibilité entre composants

## Couverture

Objectif : **80%+ de couverture de code**

Pour vérifier la couverture :
```bash
flutter test --coverage
```

## Ajout de nouveaux tests

Lors de l'ajout de nouvelles fonctionnalités :

1. Créer un fichier de test correspondant
2. Tester les cas normaux
3. Tester les cas limites
4. Tester les erreurs
5. Mettre à jour ce README si nécessaire


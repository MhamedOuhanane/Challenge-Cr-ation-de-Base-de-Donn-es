# Projet SaleOrderQuiz - Instructions SQL

## Description

Ce projet consiste à implémenter une base de données SQL pour gérer des informations sur des clients, des employés, des ventes et des produits. Les instructions couvrent la création de la base de données, la création des tables, l'insertion des données, la manipulation des données, ainsi que des requêtes pour récupérer et modifier les informations.

## Partie 1 : Configuration de la Base de Données

1. Créez une base de données nommée `SaleOrderQuiz`.
2. Activez l’utilisation de la base de données `SaleOrderQuiz`.

## Partie 2 : Création des Tables

1. Créez les tables suivantes avec les champs et contraintes spécifiés :

   - **Table Customer (Client)** :
     - `CustomerID` : INT, NOT NULL, clé primaire.
     - `CustomerFirstName` : VARCHAR(50), NOT NULL.
     - `CustomerLastName` : VARCHAR(50), NOT NULL.
     - `CustomerAddress` : VARCHAR(50), NOT NULL.
     - `CustomerCity` : VARCHAR(50), NOT NULL.
     - `CustomerPostCode` : CHAR(4), NULL.
     - `CustomerPhoneNumber` : CHAR(12), NULL.

   - **Table Inventory (Inventaire)** :
     - `InventoryID` : TINYINT, NOT NULL, clé primaire.
     - `InventoryName` : VARCHAR(50), NOT NULL.
     - `InventoryDescription` : VARCHAR(255), NULL.

   - **Table Employee (Employé)** :
     - `EmployeeID` : TINYINT, NOT NULL, clé primaire.
     - `EmployeeFirstName` : VARCHAR(50), NOT NULL.
     - `EmployeeLastName` : VARCHAR(50), NOT NULL.
     - `EmployeeExtension` : CHAR(4), NULL.

   - **Table Sale (Vente)** :
     - `SaleID` : TINYINT, NOT NULL, clé primaire.
     - `CustomerID` : INT, NOT NULL, clé étrangère faisant référence à `CustomerID`.
     - `InventoryID` : TINYINT, NOT NULL, clé étrangère faisant référence à `InventoryID`.
     - `EmployeeID` : TINYINT, NOT NULL, clé étrangère faisant référence à `EmployeeID`.
     - `SaleDate` : DATE, NOT NULL.
     - `SaleQuantity` : INT, NOT NULL.
     - `SaleUnitPrice` : SMALLMONEY, NOT NULL.

## Partie 3 : Manipulation des Données

1. Insérez au moins 3 lignes de données dans chaque table.
2. Écrivez des requêtes pour :
   - Afficher tous les clients depuis la table `Customer`.
   - Lister toutes les ventes avec leurs montants totaux (`SaleQuantity * SaleUnitPrice`) par ordre décroissant.
   - Afficher tous les employés ayant réalisé au moins une vente, ainsi que le montant total des ventes pour chacun.

## Partie 4 : Modifications des Tables

1. Ajoutez une nouvelle colonne `CustomerEmail` à la table `Customer`.
2. Mettez à jour la colonne `CustomerEmail` pour l’un des clients.
3. Supprimez un enregistrement client dont la ville est "New York".

## Partie 5 : Requêtes Avancées

1. Afficher toutes les ventes réalisées au cours des 30 derniers jours.
2. Afficher tous les clients ayant acheté plus de 5 articles en une seule vente.
3. Calculer le revenu total des ventes, regroupé par `InventoryName`.

## Partie 6 : Bonus

1. Créez une vue nommée `CustomerSalesView` pour afficher :
   - `CustomerFirstName`, `CustomerLastName`, `SaleDate`, `InventoryName`, `SaleQuantity`, et `TotalAmount`.

2. Créez une procédure stockée permettant de récupérer toutes les ventes pour un client spécifique en fonction de son `CustomerID`.


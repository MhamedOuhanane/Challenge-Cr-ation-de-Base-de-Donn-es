
-- -- Parti 1:Configuration de la Base de Données
        -- Création de database SaleOrderQuiz
        CREATE DATABASE SaleOrderQuiz;

-- -- Partie 2 : Création des Tables
    -- Créez les tables suivantes avec les champs et contraintes spécifiés :
    -- Table Customer (Client)
        CREATE table Client (
            CustomerID INT NOT NULL Primary key,
            CustomerFirstName VARCHAR(50) NOT NULL,
            CustomerLastName VARCHAR(50) NOT NULL,
            CustomerAddress VARCHAR(50) NOT NULL,
            CustomerCity VARCHAR(50) NOT NULL,
            CustomerPostCode CHAR(4) NULL,
            CustomerPhoneNumber CHAR(12) NULL
        );

    -- Table Inventory (Inventaire)
        CREATE table Inventaire (

            InventaireID TINYINT NOT NULL PRIMARY KEY,
            InventaireName VARCHAR(50) NOT NULL,
            InventaireDescription VARCHAR(255) NULL
        );

    -- Table Employee (Employé)
        CREATE TABLE Employé (
            EmployéID TINYINT NOT NULL PRIMARY KEY,
            EmployéFistName VARCHAR(50) NOT NULL,
            EmployéLastName VARCHAR(50) NOT NULL,
            EmployéExtension CHAR(4) NULL
        );

    -- Table Sale (Vente)
        CREATE table Vente (
            VenteID TINYINT NOT NULL PRIMARY KEY,
            CustomerID INT NOT NULL ,
            InventaireID TINYINT NOT NULL,
            EmployéID TINYINT NOT NULL ,
            VenteDate DATE NOT NULL,
            VenteQuentité INT NOT NULL,
            VenteUnitPrix DECIMAL(10,4) NOT NULL,
            FOREIGN KEY (CustomerID) REFERENCES client(CustomerID),
            FOREIGN KEY (InventaireID) REFERENCES inventaire(InventaireID),
            FOREIGN KEY (EmployéID) REFERENCES employé(EmployéID)
            
        );
-- -- Partie 3 : Manipulation des Données
    -- Insérez au moins 3 lignes de données dans chaque table.
    INSERT INTO client(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
    VALUES
        (1,'M\'hamed', 'Ouhanane', 'mhmdeouhnan60@gmail.com', 'Safi', '46000', '0617868324'),  
        (2,'Youssef', 'Ouhanane', 'youssef60@gmail.com', 'oujda', '46000', '0644468324'),
        (3,'Amine', 'Alaoui', 'aminealaoui@gmail.com', 'Safi', '46000', '0723768989');
        
        '

    
    INSERT INTO Inventaire (InventaireID ,InventaireName, InventaireDescription) 
    VALUES
        (1,'Ordinateur Portable', 'Ordinateur portable haute performance'),
        (2,'Smartphone', 'Smartphone de dernière génération'),
        (3,'Casque Audio', 'Casque audio sans fil avec annulation de bruit');
    
    INSERT INTO Employé (EmployéID ,EmployéFistName, EmployéLastName, EmployéExtension) 
    VALUES
        (1,'Youssef', 'Bennani', '1001'),
        (2,'Salma', 'El Amrani', '1002'),
        (3,'Idris', 'Aziz', '1003');
        
    
    INSERT INTO vente (VenteID, CustomerID, InventaireID, EmployéID, VenteDate, VenteQuentité, VenteUnitPrix) 
    VALUES
        (1,1, 1, 1, '2024-12-01', 2, 799.99),
        (2,2, 2, 2, '2024-12-02', 7, 599.99),
        (3,3, 3, 3, '2024-11-03', 3, 199.99);
    
    -- Écrivez des requêtes pour :
        -- Afficher tous les clients depuis la table Customer.
            SELECT * FROM client;

        -- Lister toutes les ventes avec leurs montants totaux (SaleQuantity * SaleUnitPrice) par ordre décroissant:
            SELECT * , VenteQuentité * VenteUnitPrix as TotalePrix FROM vente ORDER BY VenteQuentité * VenteUnitPrix DESC;

        -- Afficher tous les employés ayant réalisé au moins une vente, ainsi que le montant total des ventes pour chacun.
            SELECT e.EmployéID, e.EmployéFistName, e.EmployéLastName, e.EmployéExtension, v.VenteQuentité * v.VenteUnitPrix as totalePrix FROM employé e, vente v WHERE e.EmployéID = v.EmployéID;
        
-- -- Partie 4 : Modifications des Tables
    -- Ajoutez une nouvelle colonne CustomerEmail à la table Customer.
        ALTER TABLE client ADD CustomerEmail text;
    -- Mettez à jour la colonne CustomerEmail pour l’un des clients.
        UPDATE client SET CustomerEmail = 'mhmdeouhnan60@gmail.com' WHERE CustomerID = 1;
    -- Supprimez un enregistrement client dont la ville (CustomerCity) est "New York".
        DELETE FROM client WHERE CustomerCity = 'New York';
-- -- Partie 5 : Requêtes Avancées
    -- Écrivez une requête pour afficher toutes les ventes réalisées au cours des 30 derniers jours.
        SELECT * FROM vente WHERE VenteDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
    
    -- Affichez tous les clients ayant acheté plus de 5 articles en une seule vente.
        SELECT c.CustomerID, c.CustomerFirstName, c.CustomerLastName, v.VenteQuentité FROM client c, vente v WHERE c.CustomerID = v.CustomerID && v.VenteQuentité >= 5;
    
    -- Calculez le revenu total des ventes, regroupé par InventoryName.
        SELECT i.InventaireID, i.InventaireName, v.VenteQuentité * v.VenteUnitPrix as RevenuTotal FROM Inventaire i, Vente v WHERE i.InventaireID = v.InventaireID;

-- -- Partie 6 : Bonus
    -- Créez une vue nommée CustomerSalesView pour afficher :
        CREATE VIEW CustomerVentesView AS 
        SELECT c.CustomerFirstName, c.CustomerLastName, v.VenteDate, i.InventaireName, v.VenteQuentité, v.VenteQuentité * v.VenteUnitPrix AS TotalAmount 
        FROM client c, Inventaire i, vente v 
        WHERE c.CustomerID = v.VenteID && i.InventaireID = v.InventaireID;    
        
    -- Créez une procédure stockée permettant de récupérer toutes les ventes pour un client spécifique en fonction de son CustomerID.
        DELIMITER $$ 
        CREATE PROCEDURE CustomerVentesProcédure(IN CustomerVentesID INT) 
        BEGIN
            SELECT * FROM vente WHERE CustomerID = CustomerVentesID;
        END$$
        DELIMITER ;

        



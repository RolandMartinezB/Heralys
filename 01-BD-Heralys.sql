DROP DATABASE IF EXISTS HeralysDB;

CREATE DATABASE HeralysDB; 



USE HeralysDB;

DROP TABLE IF EXISTS Pays;

CREATE TABLE Pays
(
  Pays_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Pays_ID )
);

DROP TABLE IF EXISTS Villes;

CREATE TABLE Villes
(
  Ville_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Ville_ID )
);


DROP TABLE IF EXISTS Education;

CREATE TABLE Education
(
  Education_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Education_ID)
);

DROP TABLE IF EXISTS Responsable;

CREATE TABLE Responsable
(
  Responsable_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(500) NOT NULL,
  Prenom VARCHAR(500) NOT NULL,
  Email VARCHAR(500) NOT NULL,
  PRIMARY KEY (Responsable_ID)
);

DROP TABLE IF EXISTS Candidats;

CREATE TABLE Candidats
(
  Candidat_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(100) NOT NULL,
  Prenom VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Telephone VARCHAR(20),
  Date_Creation TIMESTAMP NOT NULL,
  Origine ENUM('Formulaire CV', 'Direct'),
  Pays_ID INT NOT NULL,
  Ville_ID INT NOT NULL,
  Responsable_ID INT NOT NULL,
  PRIMARY KEY (Candidat_ID),
  FOREIGN KEY (Pays_ID) REFERENCES Pays(Pays_ID),
  FOREIGN KEY (Ville_ID) REFERENCES Villes(Ville_ID),
  FOREIGN KEY (Responsable_ID) REFERENCES Responsable(Responsable_ID),
  UNIQUE (Email)
);

DROP TABLE IF EXISTS FormulairesCv;

CREATE TABLE FormulairesCv
(
  Formulaire_ID INT NOT NULL AUTO_INCREMENT,
  Poste_Recherche VARCHAR(200) NOT NULL,
  Info_Visa VARCHAR(500) NOT NULL,
  Date_fin_permis TIMESTAMP,
  CV  BLOB  ,
  Date_Inscription DATETIME,
  Formulaire_Accepte BOOL,
  Etudiant BOOL  ,
  Education_ID INT NOT NULL,
  Statut_etudiant ENUM('Temps partiel', 'Temps complet', 'S/I'),
  Études_en_cours  VARCHAR(200),
  Date_fin_etudes  DATETIME,
  Candidat_ID INT,  
  PRIMARY KEY (Formulaire_ID),
  FOREIGN KEY (Candidat_ID) REFERENCES Candidats(Candidat_ID) ,
  FOREIGN KEY (Education_ID) REFERENCES Education(Education_ID) 
);



DROP TABLE IF EXISTS Entrevues;

CREATE TABLE Entrevues
(
  Entrevue_ID INT NOT NULL AUTO_INCREMENT,
  Notes_Entrev VARCHAR(2000) NOT NULL,
  Fr  INT ,
  ENG INT ,
  Experience VARCHAR(600) ,
  Transport VARCHAR(600) ,
  Date_Entrev TIMESTAMP NOT NULL,
  Candidat_ID INT ,
  Disponibilite ENUM('Oui', 'Non'),
  Date_disponibilite DATETIME ,
  Disponibilite_travail ENUM('Temps partiel', 'Temps complet'),
  PRIMARY KEY (Entrevue_ID),
  FOREIGN KEY (Candidat_ID) REFERENCES Candidats(Candidat_ID)
);


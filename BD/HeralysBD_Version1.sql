DROP DATABASE IF EXISTS HeralysDB;

CREATE DATABASE HeralysDB; 



USE HeralysDB;



DROP TABLE IF EXISTS FormulairesCv;

CREATE TABLE FormulairesCv
(
  Formulaire_ID INT NOT NULL AUTO_INCREMENT,
  Poste_Recherche VARCHAR(500) NOT NULL,
  Info_Visa VARCHAR(500) NOT NULL, 
  CV  BLOB  ,
  Date_Inscription DATE NOT NULL,
  Formulaire_Accepte BOOL  NOT NULL, 
  PRIMARY KEY (Formulaire_ID) 
);

DROP TABLE IF EXISTS Candidats;

CREATE TABLE Candidats
(
  Candidat_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(500) NOT NULL,
  Prenom VARCHAR(500) NOT NULL,
  Email VARCHAR(500) NOT NULL,
  Telephone VARCHAR(500) NOT NULL,
  Date_Creation DATE NOT NULL,
  Source VARCHAR(500) NOT NULL,
  Formulaire_ID INT NOT NULL,
  PRIMARY KEY (Candidat_ID),
  FOREIGN KEY (Formulaire_ID) REFERENCES FormulairesCv(Formulaire_ID),
  UNIQUE (Email),
  UNIQUE (Telephone)
);


DROP TABLE IF EXISTS Entrevues;

CREATE TABLE Entrevues
(
  Entrevue_ID INT NOT NULL AUTO_INCREMENT,
  Notes_Entrev VARCHAR(600) NOT NULL,
  Fr INT NOT NULL,
  ENG INT NOT NULL,
  Experience VARCHAR(600) NOT NULL,
  Transport VARCHAR(600) NOT NULL,
  Date_Entrev DATE NOT NULL,
  Candidat_ID INT NOT NULL,
  PRIMARY KEY (Entrevue_ID),
  FOREIGN KEY (Candidat_ID) REFERENCES Candidats(Candidat_ID)
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

DROP TABLE IF EXISTS Personnes_Responsables;

CREATE TABLE Personnes_Responsables
(
  Responsable_ID INT NOT NULL,
  Candidat_ID INT NOT NULL,
  PRIMARY KEY (Responsable_ID, Candidat_ID),
  FOREIGN KEY (Responsable_ID) REFERENCES Responsable(Responsable_ID),
  FOREIGN KEY (Candidat_ID) REFERENCES Candidats(Candidat_ID)
);
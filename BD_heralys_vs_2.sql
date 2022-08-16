DROP DATABASE IF EXISTS HeralysDB;

CREATE DATABASE HeralysDB; 



USE HeralysDB;

DROP TABLE IF EXISTS Pays;

CREATE TABLE Pays
(
  Pays_ID INT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Pays_ID )
);

DROP TABLE IF EXISTS Villes;

CREATE TABLE Villes
(
  Ville_ID INT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Ville_ID )
);


DROP TABLE IF EXISTS Education;

CREATE TABLE Education
(
  Education_ID INT NOT NULL,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (Education_ID)
);

DROP TABLE IF EXISTS FormulairesCv;

CREATE TABLE FormulairesCv
(
  Formulaire_ID INT NOT NULL AUTO_INCREMENT,
  Poste_Recherche VARCHAR(200) NOT NULL,
  Info_Visa VARCHAR(500) NOT NULL,
  Date_fin_permis DATE NOT NULL,
  CV  BLOB  ,
  Date_Inscription DATE NOT NULL,
  Formulaire_Accepte BOOL  NOT NULL,
  Education_ID INT NOT NULL,
  Statut_etudiant ENUM('Temps partiel', 'Temps complet'),
  Études_en_cours  VARCHAR(200),
  Date_fin_etudes  DATE, 
  PRIMARY KEY (Formulaire_ID),
  FOREIGN KEY (Education_ID) REFERENCES Education(Education_ID) 
);

DROP TABLE IF EXISTS Candidats;

CREATE TABLE Candidats
(
  Candidat_ID INT NOT NULL AUTO_INCREMENT,
  Nom VARCHAR(100) NOT NULL,
  Prenom VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Telephone VARCHAR(20) NOT NULL,
  Date_Creation DATE NOT NULL,
  Origine ENUM('Formulaire CV', 'Direct'),
  Formulaire_ID INT NOT NULL,
  Pays_ID INT NOT NULL,
  Ville_ID INT NOT NULL,
  PRIMARY KEY (Candidat_ID),
  FOREIGN KEY (Formulaire_ID) REFERENCES FormulairesCv(Formulaire_ID),
  FOREIGN KEY (Pays_ID) REFERENCES Pays(Pays_ID),
  FOREIGN KEY (Ville_ID) REFERENCES Villes(Ville_ID),
  UNIQUE (Email),
  UNIQUE (Telephone)
);


DROP TABLE IF EXISTS Entrevues;

CREATE TABLE Entrevues
(
  Entrevue_ID INT NOT NULL AUTO_INCREMENT,
  Notes_Entrev VARCHAR(600) NOT NULL,
  Fr  INT NOT NULL,
  ENG INT NOT NULL,
  Experience VARCHAR(600) NOT NULL,
  Transport VARCHAR(600) NOT NULL,
  Date_Entrev DATE NOT NULL,
  Etudiant BOOL  NOT NULL,
  Candidat_ID INT NOT NULL,
  Disponibilite ENUM('Oui', 'Non'),
  Date_disponibilite DATE NOT NULL,
  Disponibilite_travail ENUM('Temps partiel', 'Temps complet'),
  PRIMARY KEY ù(Entrevue_ID),
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

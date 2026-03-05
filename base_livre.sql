USE master;
GO
CREATE DATABASE livremaxime
GO
USE livremaxime
GO

CREATE TABLE [auteur] (
  [id_auteur] integer PRIMARY KEY,
  [nom_auteur] nvarchar(255),
  [prenom_auteur] nvarchar(255),
  [date_auteur] date,
  [id_pays] integer
)
GO

CREATE TABLE [pays] (
  [id_pays] integer PRIMARY KEY,
  [nom_pays] nvarchar(255)
)
GO

CREATE TABLE [livre] (
  [id_livre] integer PRIMARY KEY,
  [titre_livre] nvarchar(255),
  [annee_livre] date,
  [resume_livre] nvarchar(255)
)
GO

CREATE TABLE [type] (
  [id_type] integer PRIMARY KEY,
  [nom_type] nvarchar(255)
)
GO

CREATE TABLE [exemplaire] (
  [id_exemplaire] integer PRIMARY KEY,
  [reference_exemplaire] nvarchar(255),
  [id_livre] integer,
  [id_edition] integer
)
GO

CREATE TABLE [edition] (
  [id_edition] integer PRIMARY KEY,
  [nom_edition] nvarchar(255)
)
GO

CREATE TABLE [inscrit] (
  [id_inscrit] integer PRIMARY KEY,
  [nom_inscrit] nvarchar(255),
  [prenom_inscrit] nvarchar(255),
  [adresse_rue_inscrit] nvarchar(255),
  [adresse_cp_inscrit] integer,
  [telephone_inscrit] nvarchar(255),
  [email_inscrit] nvarchar(255)
)
GO

CREATE TABLE [emprunt] (
  [id_emprunt] integer PRIMARY KEY,
  [reference_emprunt] nvarchar(255),
  [date_emprunt] date,
  [delai_emprunt] integer,
  [id_inscrit] integer,
  [id_exemplaire] integer
)
GO

CREATE TABLE [aEcrit] (
  [id_auteur] integer,
  [id_livre] integer
)
GO

CREATE TABLE [aPourType] (
  [id_type] integer,
  [id_livre] integer
)
GO

ALTER TABLE [auteur] ADD CONSTRAINT [auteur_pays] FOREIGN KEY ([id_pays]) REFERENCES [pays] ([id_pays])
GO

ALTER TABLE [exemplaire] ADD CONSTRAINT [exemplaire_livre] FOREIGN KEY ([id_livre]) REFERENCES [livre] ([id_livre])
GO

ALTER TABLE [exemplaire] ADD CONSTRAINT [exemplaire_edition] FOREIGN KEY ([id_edition]) REFERENCES [edition] ([id_edition])
GO

ALTER TABLE [emprunt] ADD CONSTRAINT [emprunt_inscrit] FOREIGN KEY ([id_inscrit]) REFERENCES [inscrit] ([id_inscrit])
GO

ALTER TABLE [emprunt] ADD CONSTRAINT [emprunt_exemplaire] FOREIGN KEY ([id_exemplaire]) REFERENCES [exemplaire] ([id_exemplaire])
GO

ALTER TABLE [aEcrit] ADD FOREIGN KEY ([id_auteur]) REFERENCES [auteur] ([id_auteur])
GO

ALTER TABLE [aEcrit] ADD FOREIGN KEY ([id_livre]) REFERENCES [livre] ([id_livre])
GO

ALTER TABLE [aPourType] ADD FOREIGN KEY ([id_type]) REFERENCES [type] ([id_type])
GO

ALTER TABLE [aPourType] ADD FOREIGN KEY ([id_livre]) REFERENCES [livre] ([id_livre])
GO

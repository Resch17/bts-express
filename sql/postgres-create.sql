DROP TABLE IF EXISTS PatternImage;
DROP TABLE IF EXISTS PatternFile;
DROP TABLE IF EXISTS ProjectImage;
DROP TABLE IF EXISTS FabricImage;
DROP TABLE IF EXISTS ProjectNotes;
DROP TABLE IF EXISTS ProjectFabric;
DROP TABLE IF EXISTS "file";
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS ProjectStatus;
DROP TABLE IF EXISTS PatternSize;
DROP TABLE IF EXISTS Fabric;
DROP TABLE IF EXISTS Pattern;
DROP TABLE IF EXISTS Retailer;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS FabricType;
DROP TABLE IF EXISTS "size";
DROP TABLE IF EXISTS "user";

CREATE TABLE Pattern (
  "id" serial PRIMARY KEY  NOT NULL,
  Url text,
  UserId integer NOT NULL,
  Name text NOT NULL,
  PublisherId integer NOT NULL,
  PurchaseDate timestamp NOT NULL,
  FabricTypeId integer NOT NULL,
  Notes text,
  CategoryId integer NOT NULL
);

CREATE TABLE PatternFile (
 "id" serial PRIMARY KEY NOT NULL,
 "name" text NOT NULL,
 PatternId integer NOT NULL,
 bytes bytea NOT NULL 
);


CREATE TABLE PatternImage (
  "id" serial PRIMARY KEY  NOT NULL,
  Url text NOT NULL,
  PatternId integer NOT NULL,
  IsCover bool NOT NULL
);


CREATE TABLE ProjectImage (
  "id" serial PRIMARY KEY  NOT NULL,
  Url text NOT NULL,
  ProjectId integer NOT NULL,
  Caption text
);


CREATE TABLE FabricImage (
  "id" serial PRIMARY KEY  NOT NULL,
  Url text NOT NULL,
  FabricId integer NOT NULL
);


CREATE TABLE Project (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL,
  UserId integer NOT NULL,
  PatternId integer NOT NULL,
  ProjectStatusId integer NOT NULL,
  CreateDateTime timestamp NOT NULL,
  PatternSizeId integer NOT NULL,
  IsComplete bool NOT NULL
);


CREATE TABLE Category (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL
);


CREATE TABLE ProjectStatus (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL
);


CREATE TABLE ProjectNotes (
  Id serial PRIMARY KEY  NOT NULL,
  ProjectId integer NOT NULL,
  Text text NOT NULL
);


CREATE TABLE ProjectFabric (
  "id" serial PRIMARY KEY  NOT NULL,
  ProjectId integer NOT NULL,
  FabricId integer NOT NULL,
  Yards numeric(18,4)
);


CREATE TABLE "user" (
  "id" serial PRIMARY KEY  NOT NULL,
  UserName text NOT NULL,
  FirebaseUserId text NOT NULL,
  Email text NOT NULL,
  RegisterDateTime timestamp NOT NULL,
  IsAdministrator bool NOT NULL
);


CREATE TABLE "file" (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL,
  Path text NOT NULL,
  PatternId integer NOT NULL
);


CREATE TABLE Publisher (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL,
  Url text
);


CREATE TABLE "size" (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL,
  Abbreviation text NOT NULL
);


CREATE TABLE Fabric (
  "id" serial PRIMARY KEY  NOT NULL,
  RetailerId integer NOT NULL,
  UserId integer NOT NULL,
  "name" text NOT NULL,
  Url text,
  PricePerYard numeric(12,2),
  YardsInStock numeric(18,4) NOT NULL DEFAULT 0,
  FabricTypeId integer NOT NULL,
  Notes text
);


CREATE TABLE Retailer (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL,
  Url text
);


CREATE TABLE PatternSize (
  "id" serial PRIMARY KEY  NOT NULL,
  PatternId integer NOT NULL,
  SizeId integer NOT NULL,
  Yards numeric(18,4)
);


CREATE TABLE FabricType (
  "id" serial PRIMARY KEY  NOT NULL,
  "name" text NOT NULL
);

ALTER TABLE Fabric ADD CONSTRAINT fk_fabric_retailer FOREIGN KEY (RetailerId) REFERENCES Retailer (Id) ON DELETE SET NULL;
ALTER TABLE Pattern ADD CONSTRAINT fk_pattern_user FOREIGN KEY (UserId) REFERENCES "user" (Id) ON DELETE CASCADE;
ALTER TABLE Pattern ADD CONSTRAINT fk_pattern_publisher FOREIGN KEY (PublisherId) REFERENCES Publisher (Id) ON DELETE SET NULL;
ALTER TABLE PatternSize ADD CONSTRAINT fk_patternsize_pattern FOREIGN KEY (PatternId) REFERENCES Pattern (Id) ON DELETE CASCADE;
ALTER TABLE PatternSize ADD CONSTRAINT fk_patternsize_size FOREIGN KEY (SizeId) REFERENCES Size (Id) ON DELETE CASCADE;
ALTER TABLE "file" ADD CONSTRAINT fk_file_pattern FOREIGN KEY (PatternId) REFERENCES Pattern (Id) ON DELETE CASCADE;
ALTER TABLE Fabric ADD CONSTRAINT fk_fabric_user FOREIGN KEY (UserId) REFERENCES "user" (Id) ON DELETE CASCADE;
ALTER TABLE ProjectFabric ADD CONSTRAINT fk_projectfabric_fabric FOREIGN KEY (FabricId) REFERENCES Fabric (Id) ON DELETE CASCADE;
ALTER TABLE ProjectFabric ADD CONSTRAINT fk_projectfabric_project FOREIGN KEY (ProjectId) REFERENCES Project (Id) ON DELETE CASCADE;
ALTER TABLE Project ADD CONSTRAINT fk_project_user FOREIGN KEY (UserId) REFERENCES "user" (Id) ON DELETE CASCADE;
ALTER TABLE Project ADD CONSTRAINT fk_project_patternsize FOREIGN KEY (PatternSizeId) REFERENCES PatternSize (Id) ON DELETE SET NULL;
ALTER TABLE ProjectNotes ADD CONSTRAINT fk_projectnotes_project FOREIGN KEY (ProjectId) REFERENCES Project (Id) ON DELETE CASCADE;
ALTER TABLE Fabric ADD CONSTRAINT fk_fabric_fabrictype FOREIGN KEY (FabricTypeId) REFERENCES FabricType (Id) ON DELETE SET NULL;
ALTER TABLE Pattern ADD CONSTRAINT fk_pattern_fabrictype FOREIGN KEY (FabricTypeId) REFERENCES FabricType (Id) ON DELETE SET NULL;
ALTER TABLE Project ADD CONSTRAINT fk_project_pattern FOREIGN KEY (PatternId) REFERENCES Pattern (Id) ON DELETE CASCADE;
ALTER TABLE Project ADD CONSTRAINT fk_project_projectstatus FOREIGN KEY (ProjectStatusId) REFERENCES ProjectStatus (Id);
ALTER TABLE Pattern ADD CONSTRAINT fk_pattern_category FOREIGN KEY (CategoryId) REFERENCES Category (Id);
ALTER TABLE PatternImage ADD CONSTRAINT fk_patternimage_pattern FOREIGN KEY (PatternId) REFERENCES Pattern (Id) ON DELETE CASCADE;
ALTER TABLE ProjectImage ADD CONSTRAINT fk_projectimage_project FOREIGN KEY (ProjectId) REFERENCES Project (Id) ON DELETE CASCADE;
ALTER TABLE FabricImage ADD CONSTRAINT fk_fabricimage_fabric FOREIGN KEY (FabricId) REFERENCES Fabric (Id) ON DELETE CASCADE;
ALTER TABLE PatternFile ADD CONSTRAINT fk_patternfile_pattern FOREIGN KEY (PatternId) REFERENCES Pattern (Id) ON DELETE CASCADE;

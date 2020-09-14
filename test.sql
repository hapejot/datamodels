-- Generiert von Oracle SQL Developer Data Modeler 3.3.0.747
--   am/um:        2013-10-20 23:32:00 MESZ
--   Site:      SQL Server 2008
--   Typ:      SQL Server 2008




CREATE
  TABLE Bug
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    FixedInReleaseID UNIQUEIDENTIFIER ,
    FoundInReleaseID UNIQUEIDENTIFIER ,
    CONSTRAINT Bug_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Feature
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    RealisedInReleaseID UNIQUEIDENTIFIER ,
    CONSTRAINT Feature_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Incident
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    ReportedBugID UNIQUEIDENTIFIER ,
    CONSTRAINT Incident_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Product
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    CONSTRAINT Product_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE RELEASE
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    ProductID UNIQUEIDENTIFIER NOT NULL ,
    CONSTRAINT Release_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Requirement
  (
    ID UNIQUEIDENTIFIER NOT NULL ,
    Title NVARCHAR (100) NOT NULL ,
    CONSTRAINT Requirement_PK PRIMARY KEY CLUSTERED (ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE RequirementRealisedByFeature
  (
    Feature_ID UNIQUEIDENTIFIER NOT NULL ,
    Requirement_ID UNIQUEIDENTIFIER NOT NULL ,
    CONSTRAINT RequirementRealisedByFeature__IDX PRIMARY KEY CLUSTERED (
    Feature_ID, Requirement_ID)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

ALTER TABLE Bug
ADD CONSTRAINT BugFoundInRelease FOREIGN KEY
(
FoundInReleaseID
)
REFERENCES RELEASE
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Bug
ADD CONSTRAINT Bug_Release_FK FOREIGN KEY
(
FixedInReleaseID
)
REFERENCES RELEASE
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE RequirementRealisedByFeature
ADD CONSTRAINT FK_ASS_2 FOREIGN KEY
(
Feature_ID
)
REFERENCES Feature
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE RequirementRealisedByFeature
ADD CONSTRAINT FK_ASS_3 FOREIGN KEY
(
Requirement_ID
)
REFERENCES Requirement
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Feature
ADD CONSTRAINT Feature_Release_FK FOREIGN KEY
(
RealisedInReleaseID
)
REFERENCES RELEASE
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Incident
ADD CONSTRAINT Incident_Bug_FK FOREIGN KEY
(
ReportedBugID
)
REFERENCES Bug
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE RELEASE
ADD CONSTRAINT Release_Product_FK FOREIGN KEY
(
ProductID
)
REFERENCES Product
(
ID
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO


-- Zusammenfassungsbericht für Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

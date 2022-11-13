-- CREATE DATABASE ICTPRG431_TSQL_3_Transactions_Tasks;
-- GO
-- USE ICTPRG431_TSQL_3_Transactions_Tasks;
-- GO

CREATE TABLE Person (
    PersonID int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	Age INT
)
 
GO
 
INSERT INTO Person VALUES('Hayes', 'Corey','123  Wern Ddu Lane','LUSTLEIGH',23)
INSERT INTO Person VALUES('Macdonald','Charlie','23  Peachfield Road','CEFN EINION',45)
INSERT INTO Person VALUES('Frost','Emma','85  Kingsway North','HOLTON',26)
INSERT INTO Person VALUES('Thomas', 'Tom','59  Dover Road', 'WESTER GRUINARDS',51)
INSERT INTO Person VALUES('Baxter','Cameron','106  Newmarket Road','HAWTHORPE',46)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',20)
INSERT INTO Person VALUES('Preston','Taylor','14  Pendwyallt Road','BURTON',19)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',18)
INSERT INTO Person VALUES('Khan','Jacob','72  Ballifeary Road','BANCFFOSFELEN',11)
INSERT INTO Person VALUES('Callum', 'Hopkins', '1 Street Road', 'Hawthorn', 22)


-- Callum Hopkins
SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    Person 
SET 
    Lastname = 'Sawyer', 
    Firstname = 'Tom' 
WHERE 
    PersonID = 2 
SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS OpenTransactions



-- Callum Hopkins
BEGIN TRANSACTION [ {transaction_name | @tran_name_variable }
    [WITH MARK ['description']]]

BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Lucky', 
        Firstname = 'Luke' 
WHERE  PersonID = 1
 
SELECT @@TRANCOUNT AS OpenTransactions


BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Lucky', 
        Firstname = 'Luke' 
WHERE  PersonID = 1
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions


BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Donald', 
        Firstname = 'Duck'  WHERE PersonID=2
 
 
SELECT * FROM Person WHERE PersonID=2


ROLLBACK TRAN 
 
SELECT * FROM Person WHERE PersonID=2



-- Callum Hopkins
BEGIN TRANSACTION 
INSERT INTO Person 
VALUES('Mouse', 'Micky','500 South Buena Vista Street, Burbank','California',43)
SAVE TRANSACTION InsertStatement
DELETE Person WHERE PersonID=3
SELECT * FROM Person 
ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person



-- Callum Hopkins
BEGIN TRAN
INSERT INTO Person 
VALUES('Bunny', 'Bugs','742 Evergreen Terrace','Springfield',54)
    
UPDATE Person SET Age='MiddleAge' WHERE PersonID=7
SELECT * FROM Person
 
COMMIT TRAN



-- Callum Hopkins
BACKUP DATABASE ICTPRG431_TSQL_3_Transactions_Tasks
    TO DISK = '/var/opt/mssql/backups/ICTPRG431_TSQL_3_Transactions_Tasks.bak'
        WITH FORMAT,
            MEDIANAME = 'SQLServerBackups',
            NAME = 'Full Backup of ICTPRG431_TSQL_3_Transactions_Tasks';
GO

BEGIN TRANSACTION DeletePerson WITH MARK 'MarkedTransactionDescription' 
    DELETE Person WHERE PersonID BETWEEN 13 AND 14

    COMMIT TRAN DeletePerson

SELECT * FROM msdb.dbo.logmarkhistory

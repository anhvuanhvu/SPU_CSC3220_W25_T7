--
-- File generated with SQLiteStudio v3.4.15 on Mon Feb 17 14:18:06 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Category
DROP TABLE IF EXISTS Category;

CREATE TABLE IF NOT EXISTS Category (
    CategoryID   INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName TEXT    NOT NULL
)
STRICT;

INSERT INTO Category (CategoryID, CategoryName) VALUES (1, 'Fruit');
INSERT INTO Category (CategoryID, CategoryName) VALUES (2, 'Fruit');

-- Table: Item
DROP TABLE IF EXISTS Item;

CREATE TABLE IF NOT EXISTS Item (
    ItemID          INTEGER PRIMARY KEY,
    ItemName        TEXT    NOT NULL,
    Quantity        INTEGER NOT NULL,
    Price           NUMERIC NOT NULL,
    PurchaseDate    TEXT    NOT NULL,
    ExpirationDate  TEXT,
    StorageLocation TEXT,
    UserID          INTEGER REFERENCES User (UserID),
    CategoryID      INTEGER REFERENCES Category (CategoryID),
    FOREIGN KEY (
        UserID
    )
    REFERENCES User (UserID) 
);

INSERT INTO Item (ItemID, ItemName, Quantity, Price, PurchaseDate, ExpirationDate, StorageLocation, UserID, CategoryID) VALUES (1, 'Apples', 10, 5.99, '2025-02-01', '2025-02-20', 'Fridge', 1, 1);
INSERT INTO Item (ItemID, ItemName, Quantity, Price, PurchaseDate, ExpirationDate, StorageLocation, UserID, CategoryID) VALUES (2, 'Oranges', 20, 3.99, '2025-02-01', '2025-02-20', 'Fridge', 1, 1);

-- Table: PriceHistory
DROP TABLE IF EXISTS PriceHistory;

CREATE TABLE IF NOT EXISTS PriceHistory (
    PriceID      INTEGER PRIMARY KEY,
    DateRecorded TEXT    NOT NULL,
    Price        NUMERIC NOT NULL,
    ItemID       INTEGER,
    FOREIGN KEY (
        ItemID
    )
    REFERENCES Item (ItemID) 
);


-- Table: Usage
DROP TABLE IF EXISTS Usage;

CREATE TABLE IF NOT EXISTS Usage (
    UsageID      INTEGER PRIMARY KEY,
    DateUsed     TEXT    NOT NULL,
    QuantityUsed INTEGER NOT NULL,
    ItemID       INTEGER,
    FOREIGN KEY (
        ItemID
    )
    REFERENCES Item (ItemID) 
);

INSERT INTO Usage (UsageID, DateUsed, QuantityUsed, ItemID) VALUES (1, '2025-02-05', 2, 1);

-- Table: User
DROP TABLE IF EXISTS User;

CREATE TABLE IF NOT EXISTS User (
    UserID INTEGER PRIMARY KEY,
    Name   TEXT    NOT NULL
);

INSERT INTO User (UserID, Name) VALUES (1, 'John Doe');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

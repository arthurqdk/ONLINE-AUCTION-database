PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for buyer_bids
-- ----------------------------
DROP TABLE IF EXISTS "buyer_bids";
CREATE TABLE "buyer_bids" (
  "buyer_id" INTEGER NOT NULL,
  "items_id" INTEGER NOT NULL,
  "bid_price" REAL NOT NULL,
  "bid_time" TEXT,
  CONSTRAINT "buyer_id" FOREIGN KEY ("buyer_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "items_id" FOREIGN KEY ("items_id") REFERENCES "items" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Table structure for fallback
-- ----------------------------
DROP TABLE IF EXISTS "fallback";
CREATE TABLE "fallback" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "buyer_id" INTEGER NOT NULL,
  "seller_id" INTEGER NOT NULL,
  "item_id" INTEGER NOT NULL,
  "rate" integer,
  "comment" TEXT,
  "type" integer,
  CONSTRAINT "buyer_id" FOREIGN KEY ("buyer_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "seller_id" FOREIGN KEY ("seller_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "item_id" FOREIGN KEY ("item_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "items";
CREATE TABLE "items" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "seller_id" INTEGER NOT NULL,
  "title" TEXT,
  "description" TEXT,
  "starting_bid_price" REAL,
  "bidding_increment" integer,
  "start_time" TEXT,
  "end_time" TEXT,
  "type_id" INTEGER NOT NULL,
  CONSTRAINT "seller_id" FOREIGN KEY ("seller_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "type_id" FOREIGN KEY ("type_id") REFERENCES "items_type" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Table structure for items_type
-- ----------------------------
DROP TABLE IF EXISTS "items_type";
CREATE TABLE "items_type" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL
);

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS "members";
CREATE TABLE "members" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "email" TEXT,
  "name" TEXT NOT NULL DEFAULT NULL,
  "password" TEXT NOT NULL,
  "home_address" TEXT,
  "phone_number" INTEGER,
  "bank_account_number" INTEGER,
  "routing_number" INTEGER,
  "shipping_address" TEXT,
  "type" integer
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name" ,
  "seq" 
);

-- ----------------------------
-- Auto increment value for fallback
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 16 WHERE name = 'fallback';

-- ----------------------------
-- Auto increment value for items
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 8 WHERE name = 'items';

-- ----------------------------
-- Auto increment value for items_type
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 2 WHERE name = 'items_type';

-- ----------------------------
-- Auto increment value for members
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 8 WHERE name = 'members';

PRAGMA foreign_keys = true;

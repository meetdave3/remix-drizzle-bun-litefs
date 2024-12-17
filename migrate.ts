import { migrate } from "drizzle-orm/bun-sqlite/migrator";

import { drizzle } from "drizzle-orm/bun-sqlite";
import { Database } from "bun:sqlite";

try {
  const sqlite = new Database(process.env.DB_FILE_NAME);
  const db = drizzle(sqlite);
  await migrate(db, { migrationsFolder: "./drizzle" });  
} catch (error) {
  console.error('error :>> ', error);
}


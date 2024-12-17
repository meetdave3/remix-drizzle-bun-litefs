import db from "./drizzle.server";
import { usersTable } from "./db/schema";

export async function createUser() {
  const result = await db.insert(usersTable).values({
    name: 'John Doe',
    age: 25,
    email: 'john.doe@example.com',
  });

  return result; 
}

export async function getUsers() {
  const users = await db.select().from(usersTable);
  return users;
}

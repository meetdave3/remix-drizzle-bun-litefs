# remix-drizzle-bun-litefs (beta) 🚀

Includes the following configuration:

- React 19
- React Router 7
- Bun runtime + Bun server
- SQLite database
- Drizzle ORM
- LiteFS
- Hono v4 middleware
- Vite v6
- Prettier
- ESlint
- Tailwind CSS
- Production ready Docker image
- Fly.io (deploy at ~$2 per month)
- Quick deploys with GitHub Actions
- Vite HMR + Watch Bun server with one script
- Launch & debug dev server with "Bun for Visual Studio Code" extension

## Development

Install Bun, recommended: v1.1.38

Experience the fastest way to install node modules, run:

```shellscript
bun i
```

Set the env file: 

```dotenv
NODE_ENV=development
DB_FILE_NAME=mydb.sqlite
```

Drizzle Migration and push to local Sqlite:

```shellscript
bun run generate
```

Push changes:
```
bun run migrate
```

Run the dev server:

```shellscript
bun run dev
```

This starts the Vite dev server and also listens for changes on the Bun server. 

## Production

Ensure you have set the `NODE_ENV` environment variable to `production` in the `.env` file:

```dotenv
NODE_ENV=production
DB_FILE_NAME=mydb.sqlite
```

Build and start the production server:

```shellscript
bun run build
```

```shellscript
bun run start
```

## Deployment (TODO)

Deploy the Bun app using the production-ready Dockerfile 🐳 on Fly.io with:

```sh
fly launch
```

Works fine with the bare minimum machine configuration (shared-cpu-1x / 256mb RAM). Less than 100mb memory footprint.

## Styling

This template comes with [Tailwind CSS](https://tailwindcss.com/) already configured for a simple default starting experience. You can use whatever css framework you prefer. See the [Vite docs on css](https://vitejs.dev/guide/features.html#css) for more information.

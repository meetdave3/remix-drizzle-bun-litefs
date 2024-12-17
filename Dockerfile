FROM oven/bun:slim as builder
WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y \
    ca-certificates \
    fuse3 \
    sqlite3 \
    python3 \
    build-essential \
    python-is-python3

# Copy only the files needed for installation
COPY package.json bun.lockb ./

# Install all dependencies (including devDependencies) for build
RUN bun install --frozen-lockfile

# Copy necessary files for build
COPY . .

# Build the application
RUN bun run build

# Production image
FROM oven/bun:slim
WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y \
    ca-certificates \
    fuse3 \
    sqlite3 \
    python3 \
    build-essential \
    python-is-python3

# Copy only production dependencies
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile --production --no-cache

# Copy build output and server
COPY --from=builder /app/build ./build
COPY --from=builder /app/drizzle ./drizzle
COPY handler.ts .
COPY server.ts .
COPY migrate.ts .
COPY --from=flyio/litefs:0.5 /usr/local/bin/litefs /usr/local/bin/litefs
# Copy our LiteFS configuration.
ADD litefs.yml /etc/litefs.yml

# Ensure our mount & data directories exists before mounting with LiteFS.
RUN mkdir -p /data /mnt/sqlite

ENV NODE_ENV=production
EXPOSE 3000

CMD ["litefs", "mount"]   
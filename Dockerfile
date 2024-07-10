# Stage 1: Build the application
FROM swift:latest as build

WORKDIR /app

# Copy only the Package.swift and resolve dependencies to cache these steps
COPY ./Package.swift ./
COPY ./Package.resolved ./

RUN swift package resolve

# Copy the entire project and build it
COPY . .

RUN swift build --configuration release --disable-sandbox

# Stage 2: Create the final image
FROM swift:slim

WORKDIR /app

# Copy the built binary from the build stage
COPY --from=build /app/.build/release /app

# Copy the necessary configuration files, if any
COPY ./Public /app/Public
COPY ./Resources /app/Resources

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["./Run", "serve", "--env", "production"]

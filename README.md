# Docker Antigravity CLI

This project provides a containerized version of the new **Antigravity CLI** (`agy`), which replaces the deprecated `gemini-cli`. 

Running the CLI within a Docker container ensures an isolated, reproducible environment without the need to install dependencies directly on your host machine.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed on your system.

---

## Usage

### Running Locally
To run the Antigravity CLI locally using the pre-built Docker image, you can use the provided `start_local.sh` script:

```bash
./start_local.sh <command>
```

**Example:**
```bash
./start_local.sh --help
```

**Note on Volumes:**
The `start_local.sh` script automatically mounts your local configuration directory (`~/.gemini/antigravity-cli`) into the container at `/root/.gemini/antigravity-cli`. This ensures that your CLI settings, login states, and other configurations persist across runs.

---

## Building the Image Locally

If you want to build the Docker image yourself instead of pulling the pre-built one, run the local build script:

```bash
./build_local.sh
```

This script will:
- Download the current pinned version of the Antigravity CLI.
- Build the Docker image locally.
- Tag the image as `peez/antigravity-cli:latest` and with the pinned version tag (e.g., `1.0.16`).

---

## CI/CD and Docker Hub

This repository is equipped with a GitHub Actions workflow (`docker-image.yml`). 

On every push or pull request to the `main` branch, the workflow automatically:
1. Builds the Docker image for multiple architectures (`linux/amd64` and `linux/arm64`).
2. Pushes the built image to Docker Hub under the repository `peez/antigravity-cli`.

You can always pull the latest image manually via:
```bash
docker pull peez/antigravity-cli:latest
```

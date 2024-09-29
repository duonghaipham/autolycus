## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Motivation

Learn to deploy an app with Docker and GitHub Actions

Steps:

1. Dockerize the Nextjs project.
2. Trigger build a docker image based on the Dockerfile once pushing into `main`.
3. Push the image to GHCR.
4. Establish an SSH connection to the server.
5. Pull the latest image.
6. Compose up the necessary service.

## Deploy on Vercel

Currently the web is deployed on https://autolycus.gorgo.click

# Personal website

[![Build and deploy](https://github.com/christianfosli/christianfosli.github.io/actions/workflows/build-deploy.yaml/badge.svg)](https://github.com/christianfosli/christianfosli.github.io/actions/workflows/build-deploy.yaml)

Built using [zola](https://github.com/getzola/zola) (rust-based alternative to hugo).

See it live: [https://www.christianfosli.com](https://www.christianfosli.com)

## Development

### Running locally with docker / docker compose

```sh
# Build and run
docker compose up -d --build

# Build, run, and automatically re-build when source changes
docker compose watch
```

Open [http://localhost:8000](http://localhost:8000) in a web browser.

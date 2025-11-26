# VitePress Documentation Website

This repository contains the source code for a static VitePress documentation website.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Building the project](#building-the-project)
- [Developing the project](#developing-the-project)
- [Previewing the project](#previewing-the-project)
- [Repository structure](#repository-structure)
- [Managing content](#managing-content)

## Prerequisites

You need to have `npm` installed on your system to manage the dependencies and run the project. If you don't have it installed, you can follow these instructions:

### Windows

1. Download the Node.js installer from the [official website](https://nodejs.org/en/download/).
2. Run the installer and follow the instructions.
3. Open a new command prompt and verify the installation by running `npm -v`.

### Linux

1. Open a terminal and run the following commands to install Node.js and `npm`:

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

2. Verify the installation by running `npm -v`.

## Building the project

To build the project for production, run the following command:

```bash
npm run docs:build
```

This will generate a `dist` directory containing the static files to be served.

## Developing the project

To start a local development server, run the following command:

```bash
npm run docs:dev
```

This will start a development server with hot-reloading enabled. Open your browser and navigate to `http://localhost:5173` to view the website

## Previewing the project

To preview the built project, run the following command:

```bash
npm run docs:preview
```

This will start a local server serving the `dist` directory. Open your browser and navigate to `http://localhost:4137` to view the website.

## Repository structure

The documentation files are located in the `docs` directory.
Use the following structure to allow AERIUS applications to retrieve the correct documentation for a certain product:

- The product, and when applicable followed by the product profile (e.g. `calculator`, `check`, `register`, ...).
- The major version. When this is not relevant since only one version runs in production use `latest` (e.g. `2023`, `latest`, ...).
- The content language (e.g. `nl`, `en`, ...).

## Managing content

To manage the content of the website, you will need to edit the Markdown files located in the `docs` directory. For a detailed explanation on how to manage the content, please refer to the [managing-content.md](managing-content.md) document.

## License

This project is open source and available under the [aGPL License](LICENSE).

## Contribution

Feel free to contribute to the project by opening issues or submitting pull requests.

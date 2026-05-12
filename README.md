# GitSetu Landing Page

This is the source code for [gitsetu.bhaskarjha.dev](https://gitsetu.bhaskarjha.dev), the marketing landing page for the GitSetu CLI tool.

## What is GitSetu?

[GitSetu](https://github.com/bhaskarjha-com/gitsetu) is a zero-dependency, pure Bash 3.2 CLI tool that automatically switches your Git identity, SSH keys, and credentials based on the directory you are working in.

**This repository only contains the website.** For the core CLI tool, bug reports, and documentation, please visit the [main GitSetu repository](https://github.com/bhaskarjha-com/gitsetu).

## Tech Stack

This website is built with an extreme focus on performance and minimal dependencies, mirroring the philosophy of the CLI tool it promotes.

- **Framework:** [Astro](https://astro.build/)
- **Styling:** Pure CSS (CSS Custom Properties)
- **JavaScript:** Zero external dependencies. Ships ~0.5 KB of vanilla JS for the copy button and terminal scroll animation.
- **Hosting:** Cloudflare Pages

## Local Development

To run the website locally, you will need Node.js (v18+).

```bash
# Install dependencies
npm install

# Start the local development server (localhost:4321)
npm run dev

# Build for production
npm run build

# Preview the production build
npm run preview
```

## Project Structure

```text
├── public/                 # Static assets (images, fonts, favicon)
├── src/
│   ├── components/         # Astro components (UI sections)
│   ├── layouts/            # Base HTML wrapper
│   ├── pages/              # index.astro (the single page)
│   └── styles/             # global.css (design system tokens)
├── astro.config.mjs        # Astro configuration
└── package.json            # Project dependencies
```

## Contributing

While we welcome fixes for typos or styling issues, major design overhauls should be discussed in an issue first. Please ensure that any changes maintain the "zero external JavaScript dependency" rule for the frontend.

## License

[MIT](LICENSE) © Bhaskar Jha

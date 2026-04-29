# Steefan Contractor Website

Personal website built with Hugo and Hugo Blox.

The editing workflow is documented in [docs/quick-start.md](docs/quick-start.md).

## Main Files

- `content/_index.md`: homepage sections
- `content/authors/admin/_index.md`: biography, role, interests, education, social links
- `content/project/<slug>/index.md`: project pages shown on the homepage
- `content/post/<slug>/index.md`: blog posts
- `content/publication/<slug>/index.md`: publications
- `content/event/<slug>/index.md`: talks and events
- `config/_default/hugo.yaml`: Hugo and build settings
- `config/_default/params.yaml`: site features and appearance
- `config/_default/menus.yaml`: top navigation
- `assets/scss/custom.scss`: custom styling overrides

## Local Preview

```bash
hugo server -D
```

The site is served at `http://localhost:1313/`.

## Deployment

GitHub Actions builds the site with Hugo and deploys the generated `dist/` output to GitHub Pages.

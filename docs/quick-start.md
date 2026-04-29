# Quick Start

This site is built with Hugo and Hugo Blox.

## Daily Workflow

1. Edit content and config in this repository.
2. Preview locally with `hugo server -D`.
3. Commit and push to GitHub.
4. GitHub Actions builds the site and deploys it to GitHub Pages.

## Local Preview

Run:

```bash
hugo server -D
```

Open `http://localhost:1313/`.

Notes:
- Draft content is included because of `-D`.
- The local output directory is `dist/`.
- If you want a production-style local build, run `hugo --gc --minify --environment production`.

## Homepage Editing

The homepage layout is defined in `content/_index.md`.

Current sections:
- `about.biography`
- `portfolio`
- `contact`

The biography content itself comes from `content/authors/admin/_index.md`.

## Biography Editing

Edit `content/authors/admin/_index.md` to update:
- name
- role
- organizations
- interests
- education
- social links
- biography body text

The local override in `layouts/partials/blocks/about.biography.html` only preserves compatibility with current Hugo Blox. It still reads all biography data from `content/authors/admin/_index.md`.

## Creating New Content

This repo uses page bundles for most content types, so prefer creating content as `index.md` inside its own folder.

Local archetypes are included for `project`, `post`, `publication`, `event`, and `slides`, so `hugo new` will generate a starter file with the front matter this site expects.

### New project

```bash
hugo new project/my-new-project/index.md
```

This will use `archetypes/project.md`.

Use this for a project page that should live under `content/project/` and, by default, be eligible for the homepage portfolio section.

Then edit:
- `content/project/my-new-project/index.md`
- optional featured image such as `content/project/my-new-project/featured.jpg`

Projects appear on the homepage because `content/_index.md` includes a portfolio block that reads from the `project` section.

### New post

```bash
hugo new post/my-new-post/index.md
```

This will use `archetypes/post.md`.

Use this for a normal blog-style post under `content/post/`.

### New publication

```bash
hugo new publication/my-new-publication/index.md
```

This will use `archetypes/publication.md`.

Use this for papers, preprints, reports, or other publication records under `content/publication/`.

### New event or talk

```bash
hugo new event/my-new-talk/index.md
```

This will use `archetypes/event.md`.

Use this for the event or talk page metadata.

### New slide deck

```bash
hugo new slides/my-new-deck/index.md
```

This will use `archetypes/slides.md`.

Use this for a standalone reveal.js slide deck. Existing examples live under `content/slides/`.

If you want an event page to link to the deck, set `slides: my-new-deck` in `content/event/my-new-talk/index.md`.

## Important Paths

- `content/_index.md`: homepage sections
- `content/authors/admin/_index.md`: biography/profile data
- `content/project/`: projects
- `content/post/`: blog posts
- `content/publication/`: publications
- `content/event/`: talks and events
- `content/slides/`: slide decks
- `config/_default/hugo.yaml`: Hugo and build configuration
- `config/_default/params.yaml`: site settings and features
- `config/_default/menus.yaml`: top navigation
- `assets/scss/custom.scss`: custom styling

## Publishing

Publishing is handled by GitHub Actions in `.github/workflows/hugo.yaml`.

Current behavior:
- pushes to `main` trigger the workflow
- GitHub Actions builds the site with Hugo
- the generated `dist/` directory is deployed to GitHub Pages

To publish changes:

```bash
git add .
git commit -m "Update site"
git push origin main
```

## Troubleshooting

### `hugo server -D` fails

Check:
- you are in the repository root
- your Hugo version is recent enough
- the YAML you edited is valid

### The site builds locally but not on GitHub

Check:
- `.github/workflows/hugo.yaml`
- whether the workflow is still pinned to the expected Hugo version
- whether the branch being pushed is `main`

### Biography is not updating

Check:
- `content/authors/admin/_index.md`
- `content/_index.md` still points the about block to `username: admin`

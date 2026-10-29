# Iselin Magnussen – Portfolio

My developer portfolio, live at [iselinmagnussen.devdrop.dev](https://iselinmagnussen.devdrop.dev).

[![Test and deploy](https://github.com/iselinmag/iselinmag.github.io/actions/workflows/ci.yml/badge.svg)](https://github.com/iselinmag/iselinmag.github.io/actions/workflows/ci.yml)

Built by hand in plain HTML and CSS, without frameworks, and designed mobile first.

Built with help from Claude as a pair programmer. I decided the content, structure and design, set up the domain, pipeline and branch rules, and reviewed every change.

## How it is tested

Every push runs a pipeline in GitHub Actions. The site is only published when all tests pass.

| Step | Tool | What it checks |
| --- | --- | --- |
| Validate HTML | html-validate | Valid, semantic HTML on every page |
| Check links | linkinator | No broken internal or external links |
| Accessibility | pa11y-ci with axe and HTML_CodeSniffer | WCAG 2 level AA on every page |
| Deploy | GitHub Pages | Only from `main`, and only when the tests pass |

The first accessibility run found 74 errors. Almost all were orange text with too little contrast (3.3:1, where 4.5:1 is required), and the videos had no captions. Text now uses a darker orange (at least 5.2:1), and the videos have caption tracks.

## Run the tests locally

Requires Node.js 22 and Python 3.

```bash
npm ci
npm run test:html
npm run test:links
python3 -m http.server 8080 &
npm run test:a11y
```

## Structure

```
index.html            Front page
*/index.html          One folder per project, for clean URLs
style.css             One stylesheet for the whole site
bilder/               Images and videos
filer/                Gherkin files and video captions
ikoner/               Font Awesome
CNAME                 Custom domain for GitHub Pages
.github/workflows/    The pipeline
```

## Domain setup

1. `devdrop.dev` is verified under Settings → Pages in the GitHub account, which also covers its subdomains.
2. In the repository: Settings → Pages → Source: **GitHub Actions**. Custom domain: `iselinmagnussen.devdrop.dev`.
3. At the domain registrar: a CNAME record for `iselinmagnussen` pointing to `iselinmag.github.io`.
4. Turn on **Enforce HTTPS** once the option appears.

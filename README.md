# Iselin Magnussen – portefølje

Porteføljen min som utvikler, publisert på [devdrop.dev](https://devdrop.dev).

[![Test og publiser](https://github.com/iselinmag/iselinmag.github.io/actions/workflows/ci.yml/badge.svg)](https://github.com/iselinmag/iselinmag.github.io/actions/workflows/ci.yml)

Siden er laget i ren HTML og CSS, uten rammeverk, og bygget mobil først. Den samme tilnærmingen brukte jeg på webeksamen i Webutvikling.

## Slik er den testet

Hver push kjører en pipeline i GitHub Actions. Siden publiseres bare hvis alle testene er grønne.

| Steg | Verktøy | Hva det sjekker |
| --- | --- | --- |
| Valider HTML | html-validate | Gyldig og semantisk HTML på alle sider |
| Sjekk lenker | linkinator | At ingen interne eller eksterne lenker er døde |
| Universell utforming | pa11y-ci med axe og HTML_CodeSniffer | WCAG 2 nivå AA på alle sider |
| Publiser | GitHub Pages | Bare fra `main`, og bare når testene består |

Den første WCAG-testen fant 74 feil. Nesten alle var for lav kontrast på den oransje teksten (3,3:1, kravet er 4,5:1), og videoene manglet teksting. Nå bruker teksten en mørkere oransje (minst 5,2:1), og videoene har tekstspor.

## Kjør testene lokalt

Krever Node.js 22 og Python 3.

```bash
npm ci
npm run test:html
npm run test:links
python3 -m http.server 8080 &
npm run test:a11y
```

## Struktur

```
index.html            Forsiden
*.html                Én side per prosjekt
style.css             Ett stilark for hele siden
bilder/               Bilder og videoer
filer/                Gherkin-filer og teksting til videoene
ikoner/               Font Awesome
CNAME                 Eget domene for GitHub Pages
.github/workflows/    Pipelinen
```

## Oppsett av domenet

1. Verifiser `devdrop.dev` under Settings → Pages i GitHub-kontoen.
2. I repoet: Settings → Pages → Source: **GitHub Actions**. Custom domain: `devdrop.dev`.
3. Hos domeneleverandøren:
   - A-poster for `devdrop.dev` til `185.199.108.153`, `185.199.109.153`, `185.199.110.153` og `185.199.111.153`
   - CNAME-post for `www` til `iselinmag.github.io`
4. Slå på **Enforce HTTPS** når valget dukker opp. Det kan ta opptil et døgn.

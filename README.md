# index.thegreatsunra.com

A simple index page listing links to all sites under the thegreatsunra umbrella.

## How it works

The list of sites lives in [`sites.yml`](sites.yml). A bash script reads that file and splices the generated `<li>` links into [`templates/index.template.html`](templates/index.template.html), writing the result to [`public/index.html`](public/index.html).

[Pico CSS](https://picocss.com/) is vendored into `public/css/vendor/` for styling.

Tasks are run with [Task](https://taskfile.dev).

## Tasks

### `task build`

Builds `public/index.html` from `templates/index.template.html` and `sites.yml`.

```sh
task build
```

### `task serve`

Serves the `public/` directory locally at http://localhost:3000. Requires Node.js.

```sh
task serve
```

## Adding or removing a site

Edit [`sites.yml`](sites.yml), then run `task build` to regenerate `public/index.html`.

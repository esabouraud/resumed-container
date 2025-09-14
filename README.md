# jsonresume-container

[Resumed](https://github.com/rbardini/resumed) JSON Resume third-party client in a docker container.

## Usage

This container includes the [jsonresume-theme-even](https://github.com/rbardini/jsonresume-theme-even/) theme.

`docker run --rm -ti -v /c/temp:/temp resumed render -o /temp/resume.html --theme jsonresume-theme-even /temp/resume.json`

`docker run --rm -ti -v /c/temp:/temp resumed export -o /temp/resume.pdf --theme jsonresume-theme-even /temp/resume.json`

## Caveats

Export to pdf tends to be unreliable (depending on the theme), it is generally safer to render as html and use a browser to "Save to PDF".

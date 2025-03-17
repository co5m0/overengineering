---
title: Starting my personal blog in 2025
date: 14/03/2025
author:
- co5mo
description: tutorial - build a blog with pandoc
---
# Starting my personal blog in 2025: a journey of discovery

##### March 14, 2025

In this post, I'll walk you through creating a simple yet effective blogging system using Markdown and pandoc. My approach focuses on simplicity while delivering professional results that can be easily deployed to Cloudflare or similar hosting services.

I'll cover how to set up a basic project structure with separate folders for your Markdown content and generated HTML files. You'll learn how to format your Markdown posts with proper metadata, convert them to HTML using pandoc, and apply custom styling through templates. Finally, I'll show you how to automate the entire build process with a simple bash script, allowing you to focus on writing rather than technical details.

By the end, you'll have a lightweight, customizable blogging system that doesn't require learning complex frameworks or writing raw HTML.

## Get started

I decided to structure the project in 2 folders:

- __markdown__, with the md files written by me
- __html__, the destination of the computed files

The `.md` file should start with:
```md
---
title: page_title
---
```
Then you can continue with the usual Markdown format.

To convert the files from MD to HTML, you simply run pandoc with:
```bash
pandoc -s ./markdown/index.md  -o ./html/index.html
```
This outputs the plain HTML, converting the Markdown formatting into HTML tags.

## Adding some style

Pandoc supports templates, allowing you to inject the compiled Markdown content into an HTML template. There was a Hugo theme that caught my attention, so I borrowed the CSS from their GitHub[^1] page and added it to the head section, with the $body$ variable rendered in the body tag:

```html

<html lang="en">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        ...
    </style>
     <title>$title$</title>
    </head>
    <body>
            $body$
        </div>
    </body>
</html>
```

Now, compile the markdown into the html template:
```bash
pandoc -s ./markdown/index.md --template ./template.html -o ./html/index.html
```

## Automating the process

Since you'll likely have more than just an index page, you should run the command for each Markdown file. Let's automate the compilation with a simple script:
```bash
#!/bin/bash

for i in $(ls ./markdown | awk -F. '{print $1}'); do
    echo "build $i";
    pandoc -s ./markdown/$i.md --template ./template.html -o ./html/$i.html;
done
```

## Checkout the repo

If you want to have a closer look at the code checkout my [GitHub repo](https://github.com/co5m0/overengineering/)

### Refs:

[^1]: [https://github.com/panr/terminal-css/](https://github.com/panr/terminal-css/)

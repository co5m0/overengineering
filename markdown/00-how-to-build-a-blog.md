---
title: Starting my personal blog in 2025
---
# Starting my personal blog in 2025: a journey of discovery

<details>
<summary>
__TL;DR__: After wanting to start a blog for ages, I finally decided to commit to weekly writing to help complete my side projects.
After exploring options, I discovered Cloudflare's hosting capabilities and settled on using Markdown with pandoc as the ideal solution for my needs.
</summary>
I've always wanted to start a personal blog, but I never had the courage to build one or try popular platforms like Medium or Substack. A few days ago while exercising at the gym, I had a realization: setting a weekly deadline to write about my recent activities would motivate me to accomplish more and potentially finish my side projects instead of abandoning them on GitHub. Perhaps I'll finally open-source some of them.
I grabbed my phone and began researching popular options.
My requirements were straightforward:

- Custom domain support
- Simple writing and publishing process
- Clean, minimal design and features
- RSS feed functionality
- Good code display capabilities
- Free and preferably not corporate-owned

The last requirement eliminated most blogging platforms (despite Substack's interesting approach).
I then realized I would need to host something myself, so I checked Cloudflare, my domain provider, for included hosting options. I discovered they support numerous web frameworks and offer automatic building and deployment from Git repositories.
Among the frameworks listed, Hugo caught my eye, so I dove into the documentation. Unfortunately, everything seemed overly complex for my simple needs. I considered writing plain HTML files (which Cloudflare's CDN supports), but creating raw HTML is just as tedious as learning a new tool like Hugo.
I concluded that Markdown might be the ideal solution to focus on writing without HTML complexities. After exploring various tools, I discovered pandoc, which claims to be the leading converter between markup formats.
</details>

## Get started

I decided to structure the project in 2 folders:

- __markdown__, with the md files written by me
- __html__, the destination of the computed files

The `.md` file should start with
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

### Refs:

[^1]: [https://github.com/panr/terminal-css/](https://github.com/panr/terminal-css/)

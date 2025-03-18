---
title: Starting my personal blog in 2025
date: 16/03/2025
author:
- co5mo
description: weekly blog - week 1
---
# Starting my personal blog in 2025: a journey of discovery

##### March 16, 2025

<details>
<summary>
TL;DR: After wanting to start a blog for ages, I finally decided to commit to weekly writing to help complete my side projects.
After exploring options, I discovered Cloudflare's hosting capabilities and settled on using Markdown with [pandoc](https://pandoc.org/MANUAL.html) as the ideal solution for my needs.
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
I concluded that Markdown might be the ideal solution to focus on writing without HTML complexities. After exploring various tools, I discovered [pandoc](https://pandoc.org/MANUAL.html), which claims to be the leading converter between markup formats.
</details>

Here the full article on [how to build a blog using pandoc](./how-to-build-a-blog.html).

## What's in the cosmo this week

1. This super interesting [video](https://www.youtube.com/watch?v=5XY3K8DH55M&t=581s) about using Docker with Nix.
    Reproducibility is such an underrated topic in software eng world, and distributing nixos in a docker container could brint the benefit of both world.
2. A podcast [episode](https://share.transistor.fm/s/7d278697) featuring Mitchell Hashimoto discussing Ghostty.
3. I'm becoming increasingly obsessed with the [r/minilab](https://www.reddit.com/r/minilab/) subreddit every day.
4. I'm still working on rebuilding my home lab around NixOS+K3s+Flux.

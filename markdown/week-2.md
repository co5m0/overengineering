---
title: Not a vibe (over)engineer yet
date: 22/03/2025
author:
- co5mo
description: weekly blog - week 2
---
# Not a vibe (over)engineer yet

##### March 22, 2025

## What’s in the cosmo this week
- I'm continuing my exploration of [Dagger](https://docs.dagger.io/ci/quickstart/daggerize), attempting to replicate a complex GitHub workflow we use at work. My goal is to understand how much the container overhead affects total execution time. This tool could also solve another significant pain point in my company's workflow (which I believe is common beyond just my use case): the ability to run a pipeline anywhere, even on my local machine. You might think your existing pipeline works well enough and there's no reason to refactor everything you've built over the years for a shiny new tool—I completely agree with that assessment. However, we also know that eventually pipelines accumulate so much logic (spread across different places and languages) that they become proper software requiring maintenance. Since testing can be challenging, why not use a tool that leverages your programming language of choice and Docker to manage your workflows?
- This week I attended [Source Day 2025](https://osday.dev/) in Florence for the second consecutive year. Although the format changed from last year and the talks aligned less with my interests, both the atmosphere and location were excellent. These events provide opportunities to meet incredible people with shared interests, and conversing with them is always a pleasure. Working in a remote-first company, every opportunity to meet teammates in person is valuable—this was definitely the highlight of my trip. I returned home energized and motivated to contribute more to open source projects.
- This week I swapped my 7-year-old Pixelbook for another Chromebook I own, as the old one had become very sluggish. I took some time to study how ChromeOS, Termina, and Crostini work, and decided to try installing NixOS on Crostini with decent results. I'll write a detailed guide in the coming days. My journey to *put NixOS everywhere* continues...

# SIGMA Lab Website

**SIGMA** (SUFE artIficial General intelligence & Multimodal AI Lab) — 上海财经大学通用智能与多模态实验室

🌐 Live site: [https://changliu19.github.io/sigma_demo](https://changliu19.github.io/sigma_demo)

---

## About

SIGMA is affiliated with [Shanghai University of Finance and Economics (SUFE)](https://www.sufe.edu.cn/) and is dedicated to advancing international frontier research in artificial intelligence and computer vision. The lab focuses on:

- **Embodied Intelligence** — perception, reasoning, and action in physical environments
- **Multimodal Large Models** — joint understanding across image, language, audio, video, and structured data
- **Intelligent Agents** — autonomous planning, tool use, memory, and multi-agent collaboration
- **3D Spatial Intelligence** — 3D reconstruction, scene representation, and spatial reasoning
- **Scene Generation** — controllable, realistic, and semantically consistent generation of images, video, and 3D environments

## Faculty

| Name | Role | Affiliation |
|------|------|-------------|
| [Shuting He](https://heshuting555.github.io/) | Lab Director, Assistant Professor | SUFE |
| [Chang Liu](https://scai.sufe.edu.cn/lc11/main.htm) | Lab Director, Assistant Professor | SUFE |
| [Henghui Ding](https://henghuiding.com/) | Visiting Professor | Fudan University |

## Local Development

**Prerequisites:** Ruby, Bundler, Jekyll

```bash
# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve
```

Open [http://localhost:4000/sigma_demo](http://localhost:4000/sigma_demo) in your browser.

### Using Docker

```bash
bash docker-start.sh
```

## Project Structure

| Path | Description |
|------|-------------|
| `_config.yml` | Site configuration |
| `_data/` | Structured data: people, publications, news, venues |
| `_layouts/` | Page layout templates |
| `_includes/` | Reusable HTML components |
| `_sass/` | Stylesheet source files |
| `assets/` | Images, CSS, JavaScript |
| `_bibliography/papers.bib` | BibTeX publication entries |

## Updating Content

- **People:** edit `_data/people.yml`
- **Publications:** edit `_bibliography/papers.bib` and `_data/publications.yml`
- **News:** edit `_data/news.yml`
- **Home page intro / research focus:** edit `_data/home.yml`
- **Banners & photos:** add images to `assets/images/`

## Deployment

The site is deployed to GitHub Pages via GitHub Actions. Pushing to the `main` branch triggers an automatic build and deploy.

## License

Site theme based on [jekyll-theme-yat](https://github.com/jeffreytse/jekyll-theme-yat), licensed under the [MIT License](LICENSE.txt).

<!-- External links -->

[jekyll]: https://jekyllrb.com/
[yat-git-repo]: https://github.com/jeffreytse/jekyll-theme-yat/
[yat-live-demo]: https://jeffreytse.github.io/jekyll-theme-yat/
[jekyll-spaceship]: https://github.com/jeffreytse/jekyll-spaceship
[jekyll-seo-tag]: https://github.com/jekyll/jekyll-seo-tag
[jekyll-sitemap]: https://github.com/jekyll/jekyll-sitemap
[jekyll-feed]: https://github.com/jekyll/jekyll-feed
[highlight-js]: https://github.com/highlightjs/highlight.js
[photoswipe-5]: https://photoswipe.com/

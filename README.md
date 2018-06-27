A tiny docker image with a working [tectonic latex
engine](https://tectonic-typesetting.github.io/en-US/index.html) with a primed cache.

```
docker pull rekka/tectonic
```

Only **54MB** compressed.

A fully working latex engine. Packages that are not in the cache will be
downloaded on demand.

# Example: Gitlab CI

Create a `.gitlab-ci.yml` with the following content for very fast
pdf builds.

```yaml
pdf:
  image: rekka/tectonic
  script:
    - tectonic my-document.tex
  artifacts:
    paths:
      - my-document.pdf
```

# Priming the cache

After building tectonic, it is run on the tex files in this repo to
download all the common files from the tectonic bundle.


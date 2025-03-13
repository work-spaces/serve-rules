# serve-rules

Repository for serving md workspace rules in a browser.

To add this to your workspace, use:

```python
load("//@star/packages/star/spaces-cli.star", "spaces_add")
load(
    "//@star/sdk/star/checkout.star",
    "checkout_add_repo",
)

spaces_add(
    "spaces0",
    version = "v0.14.7",
)

checkout_add_repo(
    "serve-rules",
    url = "https://github.com/work-spaces/serve-rules/",
    rev = "main",
)
```

To serve the rules run:

```sh
spaces run //serve-rules:serve
```

Then open your web browser to [localhost:1313](http://localhost:1313).

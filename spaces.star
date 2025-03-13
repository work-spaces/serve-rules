"""

"""



load("//@star/sdk/star/checkout.star", "checkout_add_cargo_bin")
load("//@star/sdk/star/run.star", "run_add_exec")
load("//@star/packages/star/package.star", "package_add")
load("//@star/sdk/star/ws.star", "workspace_get_path_to_checkout")


package_add("github.com", "gohugoio", "hugo", "v0.145.0")
package_add("go.dev", "go", "go", "1.23.3")

run_add_exec(
    "hugo",
    command = "hugo",
    working_directory = ".",
    help = """Run Hugo in the serve-rules directory. This is
useful for testing hugo commands in the spaces environment.

```sh
spaces run //{}:hugo -- --help
```
""".format(workspace_get_path_to_checkout())
)

run_add_exec(
    "generate_workspace_md",
    command = "spaces",
    args = [
        "inspect", 
        "--markdown={}/content/workspace.md".format(workspace_get_path_to_checkout())
    ],
    env = {
        "PATH": "/Volumes/Code/workspace/.local/bin"
    }
)

run_add_exec(
    "serve",
    command = "hugo",
    working_directory = ".",
    args = ["server"],
    help = "Start the hugo server for the workspace rules",
    log_level = "App",
    deps = ["generate_workspace_md"]
)


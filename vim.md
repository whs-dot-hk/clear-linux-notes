```
:w !sudo tee %
```

# Insert before `<C-v>...0...I`
Assume cursor is on the second `i` of `configuration-as-code`

```
configuration-as-code
credentials-binding
docker-workflow
git
github-branch-source
job-dsl
workflow-aggregator
workflow-multibranch
```

```
<C-v>7j0I|<Space><Esc>
```

```
| configuration-as-code
| credentials-binding
| docker-workflow
| git
| github-branch-source
| job-dsl
| workflow-aggregator
| workflow-multibranch
```

# Insert after `<C-v>...$...A`

Assume cursor is on the first `|`

```
<C-v>7j$A<Space>|<Esc>
```

```
| configuration-as-code |
| credentials-binding |
| docker-workflow |
| git |
| github-branch-source |
| job-dsl |
| workflow-aggregator |
| workflow-multibranch |
```

# Marco `qa0...jq`

Assume cursor is anywhere on the first line

```
https://plugins.jenkins.io
| configuration-as-code |
| credentials-binding |
| docker-workflow |
| git |
| github-branch-source |
| job-dsl |
| workflow-aggregator |
| workflow-multibranch |
```

```
"byiWj
qa0wyW$a<Space><C-r>b/<C-r>"|<Esc>jq
7@a
```

```
https://plugins.jenkins.io
| configuration-as-code | https://plugins.jenkins.io/configuration-as-code |
| credentials-binding | https://plugins.jenkins.io/credentials-binding |
| docker-workflow | https://plugins.jenkins.io/docker-workflow |
| git | https://plugins.jenkins.io/git |
| github-branch-source | https://plugins.jenkins.io/github-branch-source |
| job-dsl | https://plugins.jenkins.io/job-dsl |
| workflow-aggregator | https://plugins.jenkins.io/workflow-aggregator |
| workflow-multibranch | https://plugins.jenkins.io/workflow-multibranch |
```

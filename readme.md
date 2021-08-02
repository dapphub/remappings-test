# remappings-test

test repo for `dapp remappings`

The dependency tree looks like this:

```
remappings-test
  tr0 <- tr-base@v0
  tr1 <- tr-base@v1
```

tr-base contains a single free function that just returns a string, "v0" or "v1" depending on the version.

the root remappings-test repo checks that the per-package remappings are applied by checking that
the correct string is returned by tr0 and tr1.



# remappings-test

test repo for `dapp remappings` that simulates the classic diamond dependency problem, where two
different packages depend on two different versions of the same package.

The dependency tree looks like this:

```
.
├── lib
│   ├── ds-test
│   │   └── src
│   │       └── test.sol
│   ├── tr0
│   │   ├── lib
│   │   │   └── tr-base@v0
│   │   │       └── src
│   │   │           └── tr-base.sol
│   │   └── src
│   │       └── tr0.sol
│   └── tr1
│       ├── lib
│       │   └── tr-base@v1
│       │       └── src
│       │           └── tr-base.sol
│       └── src
│           └── tr1.sol
└── src
    └── test.t.sol

```

`tr-base` contains a single free function that just returns a string, "v0" or "v1" depending on the version.
`tr0` and `tr1` contain a single contract that calls into different versions of `tr-base`.

the root remappings-test repo checks that the per-package remappings are correctly applied by checking that
the correct string is returned by tr0 and tr1.


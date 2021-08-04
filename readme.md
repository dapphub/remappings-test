# remappings-test

test repo for `dapp remappings` that simulates a few interesting cases. The dependency tree looks
like this:

```
.
├── lib
│   ├── ds-auth
│   │   ├── lib
│   │   │   └── ds-test
│   │   │       └── src
│   │   │           └── test.sol
│   │   └── src
│   │       ├── auth.sol
│   │       └── auth.t.sol
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


## Diamond Dependencies

We include a test case for the classic diamond dependency problem, where two
different packages depend on two different versions of the same package.

`tr-base` contains a single free function that just returns a string, "v0" or "v1" depending on the version.
`tr0` and `tr1` contain a single contract that calls into different versions of `tr-base`.

the root remappings-test repo checks that the per-package remappings are correctly applied by checking that
the correct string is returned by tr0 and tr1.

## Duplicated Packages w./ Multiple Inheritance

We include a test contract that inherits from both `DSAuthTest` and `DSTest`. Since `DSAuthTest`
also inherits from `DSTest` we have two (identical) copies of this contract in the inheritance tree.
If these copies of `DSTest` are not both imported from the same path on disk, solc will not
recognise them as identical and so will throw compiler errors due to name clashes.

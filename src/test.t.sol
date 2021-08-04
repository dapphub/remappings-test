// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.6;

import {DSTest} from "ds-test/test.sol";
import {DSAuthTest} from "ds-auth/auth.t.sol";
import {V0} from "tr0/tr0.sol";
import {V1} from "tr1/tr1.sol";

// V0 and V1 both depend on different versions of the same package (tr-base),
// here we test that the correct version is selected for both by the remapping
// scheme
contract TestVersions is DSTest {
    function testVersion() public {
        V0 v0 = new V0();
        V1 v1 = new V1();

        assertEq(v0.show(), "v0");
        assertEq(v1.show(), "v1");
    }
}

// This contract contains two instances of DSTest imported from two different
// packages (ds-test and ds-auth) in the inheritance hierarchy.  since our
// remappings scheme deduplicates identical package versions by remapping them
// to the same location on disk we should avoid a compile error here
contract TestInheritance is DSTest, DSAuthTest {}

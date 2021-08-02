// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.6;

import {DSTest} from "ds-test/test.sol";
import {V0} from "tr0/tr0.sol";
import {V1} from "tr1/tr1.sol";

contract Test is DSTest {
    function testVersion() public {
        V0 v0 = new V0();
        V1 v1 = new V1();

        assertEq(v0.show(), "v0");
        assertEq(v1.show(), "v1");
    }
}

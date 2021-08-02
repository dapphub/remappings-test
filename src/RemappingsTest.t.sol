pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./RemappingsTest.sol";

contract RemappingsTestTest is DSTest {
    RemappingsTest test;

    function setUp() public {
        test = new RemappingsTest();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}

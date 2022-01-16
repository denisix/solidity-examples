// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract HeyBro {
    uint hey;

    constructor() {
        hey = 0;
    }

    function Hey() public {
        hey++;
    }

    function getHeyCount() public view returns (uint) {
        return hey;
    }
}

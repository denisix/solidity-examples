// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/// @custom:security-contact info@dcxv.com
contract DenNFT is ERC721 {

    constructor() ERC721("DenNFT", "dNFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://github.com/denisix";
    }
}

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @custom:security-contact denisix@gmail.com
contract VeryRareCoin is ERC20 {
    
    address private owner;
    
    // event for EVM logging
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    
    // modifier to check if caller is owner
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor() ERC20("VeryRareCoin", "VXX") {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);

        // premint 1000 coins for owner
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // owner can mint more coins
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Caller is not owner");
        _mint(to, amount);
    }

    // miner can min our coin
    function mintMinerReward() public {
        _mint(block.coinbase, 1000);
    }

    // mint a miner reward for every token transfer that is included in the blockchain.
    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if (!(from == address(0) && to == block.coinbase)) {
          mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }
}

// SPDX-License-Identifier: GPL-3.0
// dedicated to the memory of King Hill (Stuart) https://en.wikipedia.org/wiki/King_Hill

pragma solidity ^0.8.11;

contract KingHill {
    address public owner;
    address payable public payableAddress;

    string public king;
    uint public highestBid;
    address public highestBidder;
    uint public time;

    event NewKingCrowned(address bidder, uint amount);

    error PayGreaterThanCurrentKing(uint highestBid);
    
    constructor(address payable payTo) {
        owner = msg.sender;
        payableAddress = payTo;
    }

    function kingMe(string memory yourNick) external payable {
        king = yourNick;

        if (msg.value <= highestBid) revert PayGreaterThanCurrentKing(highestBid);

        highestBid = msg.value;
        highestBidder = msg.sender;
        time = block.timestamp;

        payableAddress.transfer(msg.value);
        emit NewKingCrowned(msg.sender, msg.value);
    }

    function whoIsKing() public view returns(string memory) {
        return king;
    }

    function kingPrice() public view returns(uint) {
        return highestBid;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

error Raffle__NotEnoughETHEntered();

contract Raffle {
    uint private immutable i_entranceFee;
    address payable[] private s_players;

    // events
    event RaffeEnter(address indexed player);

    constructor(uint entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        emit RaffeEnter(msg.sender);
    }

    
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint index) public view returns (address) {
        return s_players[index];
    }
}

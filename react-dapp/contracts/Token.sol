//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/hardhat/console.sol";

contract Token {
    string public name = "OMW Token";
    string public symbol = "OMW";
    uint256 public totalSupply = 1000000;
    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) external {
        console.log("Sender balance is %s tokens", balances[msg.sender]);
        console.log("Trying to send %s tokens to %s", amount, to);

        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[to] += amount;
        balances[msg.sender] -= amount;
        console.log("Sender balance is %s tokens", balances[msg.sender]);
        console.log("Receiver balance is %s tokens", balances[to]);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
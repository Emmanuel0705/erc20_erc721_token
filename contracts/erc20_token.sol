// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint public salesPrice = 1000;

    constructor() ERC20("Toyota", "TY") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    event Sent(uint amount);

    function byToken(address receiver) public payable{
        uint amountToBuy = msg.value * salesPrice;

        require(amountToBuy > 0, "invalid Value");
        require(amountToBuy <= totalSupply(), "Insufficient Balance");
        _mint(receiver,amountToBuy);
        emit Sent(amountToBuy);
    }

}   
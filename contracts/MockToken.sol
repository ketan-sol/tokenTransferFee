// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockToken is ERC20 {
    uint256 burn_fee = 5;

    constructor(uint256 initialSupply) ERC20("MockToken", "MTK") {
        _mint(msg.sender, initialSupply * 10**decimals());
    }

    function transfer(address _to, uint256 _value)
        public
        virtual
        override
        returns (bool)
    {
        uint256 burnAmount = (_value * burn_fee) / 100;
        if (ERC20.transfer(_to, _value - burnAmount)) {
            _burn(_msgSender(), burnAmount);
            return true;
        } else return false;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public virtual override returns (bool) {
        uint256 burnAmount = (_value * burn_fee) / 100;
        if (ERC20.transferFrom(_from, _to, _value - burnAmount)) {
            _burn(_from, burnAmount);
            return true;
        } else return false;
    }
}

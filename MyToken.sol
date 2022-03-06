pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {

    address public admin;

    constructor() ERC20('Hazel M Token', 'HPM') {
        // Mint initial supply of tokens with 18 decimals
        _mint(msg.sender, 10000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address _to, uint _amount) external {
        // Access control will show error if not admin
        require(msg.sender == admin, 'only admin');
        _mint(_to, _amount);
    }

    function burn(uint _amount) external {
        _burn(msg.sender, _amount);
    }
}

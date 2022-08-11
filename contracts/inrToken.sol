pragma solidity^0.8.10;

import "./ERC20.sol";

contract inrToken {
    address addressOfAnotherContract;
    address public admin = msg.sender;
    uint public increaseCoin;

    modifier restriction(address own){
        require(msg.sender == own, "admin can only do this operation");
        _;
    }

    function setAddress(address _address) external {
        addressOfAnotherContract = _address;
    }

    function addNewCoin(uint newCoin) public restriction(msg.sender){
        increaseCoin += newCoin;
    }

    function mintNewINRToken(uint amount) public restriction(msg.sender) {
        ERC20 pointer = ERC20(addressOfAnotherContract);
        uint oldCoin = pointer.getCoin();
        uint newlyAddedCoin = oldCoin += amount;
        require(increaseCoin >= oldCoin," there is no new coin added ");
        require(increaseCoin >= newlyAddedCoin || increaseCoin == newlyAddedCoin , " you were trying to mint extra token");
        pointer.addCoin(amount);
        pointer.mint(amount);
    }

    function Coin() view external returns(uint){
        ERC20 pointer = ERC20(addressOfAnotherContract);
        return pointer.getCoin();
    }

    function totalINRtoken() view external returns(uint){
        ERC20 pointer = ERC20(addressOfAnotherContract);
        return pointer.viewTotalSUpply();
    }

    function removeINR(uint amount) external restriction(msg.sender){
        ERC20 pointer = ERC20(addressOfAnotherContract);
        pointer.burn(amount);
        pointer.removeCoin(amount);
    }

    function balanceOfAccount(address addressOfAccount) view external returns(uint){
        ERC20 pointer = ERC20(addressOfAnotherContract);
        return pointer.balanceOf(addressOfAccount);
    }
}
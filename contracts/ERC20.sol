pragma solidity^0.8.15;

contract ERC20  {
	uint public totalSupply;
	uint public coin;
    address public admin = msg.sender;

	mapping (address => uint) public balanceOf;

	mapping (address => mapping (address => uint)) public allowance;

	string public name = "Indian Rupee";

	string public symbol = "INR";

	uint public decimals = 1000000000000000000;

        function tokenName() view public returns(string memory){
            return name;
        }

        function tokenSymbol() view public returns(string memory){
            return symbol;
        }

        function viewOwner() view public returns(address administrator){
            return admin;
        }
		function decimalslength() view public returns(uint){
			return decimals;
        }
		function addCoin(uint amount) public returns(uint){
			return coin += amount;
		}

		function removeCoin(uint amount) public returns(uint){
			return coin -= amount;
		}

		function getCoin() public view returns(uint){
			return coin;
		}

		function mint (uint amount) public {
			balanceOf[msg.sender] += amount*decimals;
			totalSupply += amount*decimals;
		}

		event Transfer(address indexed from, address indexed to, uint256 value);

		function transfer (address recipient, uint amount) external returns (bool) {
			assert(balanceOf[msg.sender] >= amount * decimals);
			balanceOf[msg.sender] -= amount*decimals;
			balanceOf [recipient] += amount*decimals;
			emit Transfer(msg.sender, recipient, amount);
			return true;
		}

		function burn (uint amount) external {
			if(amount* decimals <=balanceOf[msg.sender]){
				balanceOf[msg.sender] -= amount * decimals;
				totalSupply -= amount*decimals;
			}
		}
        function viewTotalSUpply() view external returns(uint){
            return totalSupply;
        }
}
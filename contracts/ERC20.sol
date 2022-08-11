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
        function transfer (address recipient, uint amount) external returns (bool) {
			balanceOf[msg.sender] -= amount*decimals;
			balanceOf [recipient] += amount*decimals;
			return true;
		}

		function getCoin() public view returns(uint){
			return coin;
		}
		function approve (address spender, uint amount) external returns (bool) {
			allowance[msg.sender][spender] = amount*decimals;
			return true;
		}

		function transferFrom(address sender,address recipient, uint amount) external returns (bool) {
			allowance[sender] [msg.sender] -= amount*decimals;
			balanceOf[sender] = amount*decimals;
			balanceOf[recipient] += amount*decimals;
			return true;
		}

		function mint (uint amount) public {
			balanceOf[msg.sender] += amount*decimals;
			totalSupply += amount*decimals;
		}

		function burn (uint amount) external {
			balanceOf[msg.sender] -= amount * decimals;
            totalSupply -= amount*decimals;
		}

        function viewTotalSUpply() view external returns(uint){
            return totalSupply;
        }
}
const ERC20 = artifacts.require("ERC20")

contract("ERC20", async (account) => {
    console.log(account);
    const [owner, ...otherAccounts] = account;
    it("Contract should be deployed", async () => {
        const ERC20Token = await ERC20.deployed();
        console.log(" ERC20 token : ", ERC20Token.address);
    })
    it("Currency and token should be Indian rupee and INR", async ()=> {
        const ERC20Token = await ERC20.deployed();
        let nameOfThetoken = await ERC20Token.tokenName();
        let symbolOfTheToken = await ERC20Token.tokenSymbol();
        assert(nameOfThetoken.toString() == "indian Rupee")
        assert(symbolOfTheToken.toString() == "INR");
    })
    it("", async ()=> {
        // const ERC20Token = await ERC20.deployed();
        let nameOfThetoken = await ERC20Token.tokenName();
        assert(nameOfThetoken.toString() == "indian Rupee")
        // assert(symbolOfTheToken.toString() == "INR");
    })
})
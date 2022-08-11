const ERC20 = artifacts.require("ERC20");
const decima = 1000000000000000000;

contract("ERC20", async (account) => {

    let ERC20Token = null;
    before(async () => {
        ERC20Token = await ERC20.deployed();
    })
    console.log(account);
    const [owner, ...otherAccounts] = account;
    it("Contract should be deployed", async () => {
        const ERC20Token = await ERC20.deployed();
        console.log(" ERC20Token.address : ", ERC20Token.address);
        assert(ERC20Token.address)
    })
    it("Currency and token should be Indian rupee and INR", async () => {
        let nameOfThetoken = await ERC20Token.tokenName();
        let symbolOfTheToken = await ERC20Token.tokenSymbol();
        assert((nameOfThetoken.toString() == "Indian Rupee") && (symbolOfTheToken.toString() == "INR"))
    })
    it("Checking admin as a owner ", async () => {
        let admin = await ERC20Token.viewOwner();
        assert(admin.toString() == owner);
    })
    it("Should be 18 decimals ", async () => {
        let decimals = await ERC20Token.decimalslength();
        let decimalLength = BigInt(decimals);
        assert(decimalLength.toString() == decima)
    })
    it("Token mint ", async () => {
        await ERC20Token.mint(123);
        let TotalValue = await ERC20Token.viewTotalSUpply();
        assert(TotalValue == 123 * decima)
    })

    // it("Token burn ", async () => {
    //     await ERC20Token.burn(123);
    //     let TotalValue = await ERC20Token.burn(123);
    //     assert(TotalValue == (123*decima - 123*decima))
    // })
})

const INR = artifacts.require("inrToken");

contract("INR Token", async (account) => {

    let INRtoken = null;
    before(async () => {
        INRtoken = await INR.deployed();
    })
    // console.log(account);
    const [owner, ...otherAccounts] = account;
    it("Coin should add", async () => {
        let addCoin = await INRtoken.addNewCoin(123);
    })
    // it(" token should mint ", async ()=> {
    //     await INRtoken.mintNewINRToken(10);
    //     // console.log(" mint  : ", mint);
    // })
    it(" totalINRtoken", async () => {
        let totalINRtoken = await INRtoken.totalINRtoken();
        console.log("totalINRtoken", totalINRtoken)
    }
    )
})
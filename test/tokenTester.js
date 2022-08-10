const myToken = artifacts.require('myToken')
const {testHelper} = require('@openzeppelin/test-helpers')


contract('ERC20', function (accounts) {
    const [ initialHolder, recipient, anotherAccount ] = accounts;

    const name = 'Indian Rupee';
    const symbol = 'INR';

    const initialSupply =  1000000

    beforeEach(async function () {
      this.token = await ERC20Mock.new(name, symbol, initialHolder, initialSupply);
    });
    it('has a name', async function () {
      expect(await this.token.name()).to.equal(name);
    });

    it('has a symbol', async function () {
      expect(await this.token.symbol()).to.equal(symbol);
    });

    it('has 18 decimals', async function () {
      expect(await this.token.decimals()).to.be.bignumber.equal('18');
    });
})
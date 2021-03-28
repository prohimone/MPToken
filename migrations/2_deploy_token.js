const MPToken = artifacts.require("MPToken.sol");

module.exports = function (deployer){
    const _name = "MP Token";
    const _symbol = "MPT";
    const initialSupply = 1000000000;
    deployer.deploy(MPToken, _name, _symbol, initialSupply);

};

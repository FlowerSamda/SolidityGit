var AUTOv2 = artifacts.require("./AUTOv2.sol");
var owner = web3.eth.accounts[0];

module.exports = function(deployer) {
  deployer.deploy(AUTOv2);
}

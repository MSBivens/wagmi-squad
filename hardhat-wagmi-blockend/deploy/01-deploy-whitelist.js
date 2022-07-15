const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so `ourWhitelist` here is a factory for instances of our Whitelist contract.
  */
  const ourWhitelist = await ethers.getContractFactory("Whitelist");

  // here we deploy the contract
  const deployedWhitelist = await ourWhitelist.deploy();

  // Wait for it to finish deploying
  await deployedWhitelist.deployed();

  // prints and logs the address of the deployed contract in the console
  console.log("Contract Address:", deployedWhitelist.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

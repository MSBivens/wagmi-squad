/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: API_KEY,
      accounts: [PRIVATE_KEY],
      chainId: 5,
    },
  },
};

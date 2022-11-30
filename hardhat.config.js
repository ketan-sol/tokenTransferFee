require('@nomicfoundation/hardhat-toolbox');
//require('@openzeppelin/hardhat-upgrades');
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
const key = process.env.PRIVATE_KEY;
const api_goerli = process.env.ETH;

module.exports = {
  solidity: {
    compilers: [
      {
        version: '0.8.17',
      },
      {
        version: '0.8.16',
      },
    ],
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  gasReporter: {
    enabled: false,
  },
  networks: {
    //testnet configuration

    //ETH-GOERLI
    goerli: {
      url: api_goerli,
      accounts: [`0x${key}`],
      chainId: 5,
    },
  },
};

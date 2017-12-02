module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
      gas: 2900000
    }
  }
};


// ,
//     quorum: {
//       host: "localhost",
//       port: 20000,
//       network_id: "*"
//     }
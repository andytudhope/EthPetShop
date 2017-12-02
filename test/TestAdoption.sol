pragma solidity ^0.4.4;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() {
    uint returnedId = adoption.adopt(8);

    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // Remembering that public variables have automatic getter methods, we can retrieve the address 
  // stored by our adoption test above. Stored data will persist for the duration of our tests, so our adoption of pet 8 above can be retrieved by other tests.
  // Since the TestAdoption contract will be sending the transaction, we set the expected value 
  // to this, a contract-wide variable that gets the current contract's address.

  function testGetAdopterAddressByPetId() {
    address expected = this;

    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

// The memory attribute tells Solidity to temporarily store the value in memory, rather than saving
// it to the contract's storage.

  function testGetAdopterAddressByPetIdInArray() {
    address expected = this;

    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }

}
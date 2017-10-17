contract Royalty {
    address writer;
    address user;
    address publisher;
    
    function Royalty (address _writer, address _publisher) {
        // Publisher will initiate contract to obtain payment from user
        // Backend will store details of contract , i.e. Book price, % of royalty to writer, etc.
        user = msg.sender ; 
        writer = _writer;
        publisher = _publisher;
    }
    
    function addFunds () payable returns (bool) {
        // User to add funds to the contract
        require (msg.sender == user);
        return true;
    }
    
    function sendPayment (uint _paymentAmount) returns (bool) {
        require (msg.sender == user);
        publisher.transfer (_paymentAmount);
    } 
    
    function sendRoyalty (uint _royaltyAmount) returns (bool) {
        require (msg.sender == publisher);
        writer.transfer (_royaltyAmount);
    }
    
    function getBalance () constant_returns (uint) {
        return this.balance;
}
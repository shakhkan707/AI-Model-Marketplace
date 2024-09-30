// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AIModelMarketplace {
    struct Model {
        uint256 id;
        string name;
        string description;
        uint256 price; // in Wei
        address payable creator;
        uint256 totalRating;
        uint256 ratingCount;
        bool isPurchased;
    }

    uint256 public modelCount = 0;
    address public owner;

    mapping(uint256 => Model) public models;
    mapping(address => mapping(uint256 => bool)) public purchases; 

    event ModelListed(uint256 id, string name, uint256 price, address creator);
    event ModelPurchased(uint256 id, address buyer, uint256 price);
    event ModelRated(uint256 id, address rater, uint8 rating);
    event FundsWithdrawn(address owner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // List a new AI model
    function listModel(string memory _name, string memory _description, uint256 _price) public {
        require(_price > 0, "Price must be greater than zero");

        modelCount += 1;
        models[modelCount] = Model({
            id: modelCount,
            name: _name,
            description: _description,
            price: _price,
            creator: payable(msg.sender),
            totalRating: 0,
            ratingCount: 0,
            isPurchased: false
        });

        emit ModelListed(modelCount, _name, _price, msg.sender);
    }

    // Purchase an AI model
    function purchaseModel(uint256 _modelId) public payable {
        Model storage model = models[_modelId];
        require(_modelId > 0 && _modelId <= modelCount, "Model does not exist");
        require(msg.value == model.price, "Incorrect payment amount");
        require(msg.sender != model.creator, "Creator cannot purchase their own model");
        require(!purchases[msg.sender][_modelId], "Model already purchased");

        // Transfer payment to the creator
        model.creator.transfer(msg.value);

        purchases[msg.sender][_modelId] = true;
        model.isPurchased = true;

        emit ModelPurchased(_modelId, msg.sender, msg.value);
    }

    // Rate a purchased AI model
    function rateModel(uint256 _modelId, uint8 _rating) public {
        require(_rating >= 1 && _rating <= 5, "Rating must be between 1 and 5");
        require(purchases[msg.sender][_modelId], "Model not purchased");

        Model storage model = models[_modelId];
        model.totalRating += _rating;
        model.ratingCount += 1;

        emit ModelRated(_modelId, msg.sender, _rating);
    }

    // Withdraw funds (only owner)
    function withdrawFunds() public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        payable(owner).transfer(balance);

        emit FundsWithdrawn(owner, balance);
    }

    // Get model details
    function getModelDetails(uint256 _modelId) public view returns (
        uint256 id,
        string memory name,
        string memory description,
        uint256 price,
        address creator,
        uint256 averageRating
    ) {
        Model storage model = models[_modelId];
        require(_modelId > 0 && _modelId <= modelCount, "Model does not exist");

        if (model.ratingCount == 0) {
            averageRating = 0;
        } else {
            averageRating = model.totalRating / model.ratingCount;
        }

        return (
            model.id,
            model.name,
            model.description,
            model.price,
            model.creator,
            averageRating
        );
    }
}
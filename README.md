# AI Model Marketplace - README

## Overview

The **AI Model Marketplace** is a decentralized application (DApp) that allows users to list, purchase, and rate AI models on the Ethereum blockchain. This project uses **Web3.js** to interact with an Ethereum smart contract, with transactions facilitated through **MetaMask**. Users can:

- List AI models with details like name, description, and price.
- Purchase AI models.
- Rate models after purchasing.
- Retrieve detailed information about listed models.

## Features

- **List a Model**: Allows creators to upload AI models by specifying the model’s name, description, and price.
- **Purchase a Model**: Buyers can purchase listed models using Ether.
- **Rate a Model**: After purchasing a model, users can submit ratings.
- **Model Details**: Users can fetch the details of any listed model, such as its creator, description, price, and average rating.

## Prerequisites

To run this project locally, you need:

1. **Node.js** and **npm** installed on your system.
2. **MetaMask** browser extension for interacting with the Ethereum blockchain.
3. **Web3.js** to communicate with the Ethereum smart contract.
4. A local or test Ethereum network like **Ganache** or **Ropsten** (testnet).

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/ai-model-marketplace.git
   cd ai-model-marketplace
   ```

2. **Install dependencies**:

   ```bash
   npm install
   ```

3. **MetaMask Setup**: Install MetaMask as a browser extension and configure it to connect to a test network (e.g., Ropsten). Ensure your MetaMask wallet is funded with some test Ether.

4. **Smart Contract Setup**: Replace the `contractAddress` in `app.js` with your deployed smart contract address.

## Running the Application

1. **Start a local server**:
   
   To run the DApp locally, use the following command:

   ```bash
   npm start
   ```

2. **Access the DApp**: Open your browser and visit `http://localhost:3000`.

3. **Connect MetaMask**: Make sure MetaMask is connected to the correct Ethereum network.

## How to Use

### 1. **List a Model**
   - Enter the model name, description, and price (in Wei).
   - Click on "List Model" to upload the model to the marketplace.
   
### 2. **Purchase a Model**
   - Enter the ID of the model you wish to purchase.
   - Click on "Purchase Model" to buy the model with Ether from your MetaMask account.

### 3. **Rate a Model**
   - After purchasing a model, enter its ID and submit a rating.
   
### 4. **View Model Details**
   - Enter the model ID to get detailed information about the model, including price, creator, and average rating.

## File Structure

- **app.js**: Contains JavaScript for interacting with the Ethereum blockchain via Web3.js, including functions for listing, purchasing, rating, and fetching model details.
- **index.html**: The user interface of the AI Model Marketplace.
- **styles.css**: Basic styling for the marketplace layout.

## Smart Contract Details

- **Contract Address**: `0xEC5Be37B46CE01DF7B35c3b14068B547CB2760Ca`
- **ABI**: The contract ABI is included in `app.js`. It allows interaction with the listed models, purchase functionality, rating system, and fund withdrawals.

## Technologies Used

- **Ethereum Blockchain**: Decentralized platform to run the AI Model Marketplace.
- **Web3.js**: JavaScript library for Ethereum interaction.
- **MetaMask**: Browser extension for Ethereum wallet and transaction management.
- **Solidity**: Smart contract programming language (assumed, not included in the repository).
- **HTML/CSS/JavaScript**: Frontend technologies for UI design.

## Future Improvements

- **Add Upload Functionality**: Allow users to upload actual AI model files (currently, only metadata is listed).
- **Enhanced Model Search**: Implement a search feature to easily browse through listed models.
- **User Profiles**: Enable creators and buyers to have profile pages with transaction history.

## License

This project is licensed under the MIT License.

---

Enjoy using the AI Model Marketplace! If you encounter any issues or have questions, feel free to open an issue or contact the repository owner.

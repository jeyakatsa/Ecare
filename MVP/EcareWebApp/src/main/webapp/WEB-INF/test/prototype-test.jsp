<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="javascript/RWmodal.min.js"></script>
		<script>
		
			//Connect Wallet Functions
			var connectedWalletOne = false;
			function connectWalletOne() {
				   document.getElementById('wallet-one-connected').style.display = "block";
				   document.getElementById('wallet-one-not-connected').style.display = "none";
				   connectedWalletOne = true;
			}
			var connectedWalletTwo = false;
			function connectWalletTwo() {
				   document.getElementById('wallet-two-connected').style.display = "block";
				   document.getElementById('wallet-two-not-connected').style.display = "none";
				   connectedWalletTwo = true;
			}

			
// Combinatorial Mechanism (Below):
			
			//Wallet One Balance/Tokens/Inputs
			var walletOneBalance = 10000.00;
			var walletOneTokens = 10.00;
			var walletOneTokenValue = 0.00;
			const walletOneInput = document.getElementById("input-one").value;
			
			//Wallet Two Balance/Tokens/Inputs
			var walletTwoBalance = 5000.00;
			var walletTwoTokens = 5.00;	
			var walletTwoTokenValue = 0.00;
			const walletTwoInput = document.getElementById("input-two").value;					

			//Step 1
			function divideBalancesByTotalTokens() {

			//Wallet One:					
				//Get 'balance-one-connected' value
					//This code is for testing purposes
/* 				document.getElementById('balance-one-connected-value').style.display = "inline";
				document.getElementById('balance-one-connected').style.display = "none";
				document.getElementById('balance-one-connected-value').innerHTML = 
					walletOneBalance.toFixed(2); */
				//Get 'tokens-one-connected' value
					//This code is for testing purposes
/* 				document.getElementById('tokens-one-connected-value').style.display = "inline";
				document.getElementById('tokens-one-connected').style.display = "none";				
				document.getElementById('tokens-one-connected-value').innerHTML = 
						walletOneTokens.toFixed(2); */
				//Get walletOneTokenValue == divide walletOneBalance with walletOneTokens
 				var walletOneTokenValue = (walletOneBalance / walletOneTokens);
		 			//This code is for testing purposes	
/* 				document.getElementById('balance-one-connected-value').innerHTML = 
						walletOneTokenValue.toFixed(2); */

			//Wallet Two:
				//Get 'balance-two-connected' value
					//This code is for testing purposes
/* 				document.getElementById('balance-two-connected-value').style.display = "inline";
				document.getElementById('balance-two-connected').style.display = "none";
				document.getElementById('balance-two-connected-value').innerHTML = 
						walletTwoBalance.toFixed(2); */				
				//Get 'tokens-one-connected' value
					//This code is for testing purposes				
/* 				document.getElementById('tokens-two-connected-value').style.display = "inline";
				document.getElementById('tokens-two-connected').style.display = "none";	
				document.getElementById('tokens-two-connected-value').innerHTML = 
						walletTwoTokens.toFixed(2); */
				//Get walletOneTokenValue == divide walletOneBalance with walletOneTokens
				var walletTwoTokenValue = (walletTwoBalance / walletTwoTokens);
					//This code is for testing purposes	
/* 				document.getElementById('balance-two-connected-value').innerHTML = 
						walletTwoTokenValue.toFixed(2); */	
				
			}

			//Step 2
			function multiplyTokenValuesByTokensExchanged() {

				//Base Case
				if (walletOneTokens < walletOneInput || walletTwoTokens < walletTwoInput){
					RWmodal.open(1, 'Not Enough Total Tokens');	
					}
				else if (walletOneInput == null || walletTwoInput == null) {
					RWmodal.open(1, 'Exchange Tokens Empty');					
					}
				else {
					//Wallet One
	 				var walletOneToTwoBalanceAdd = (walletOneTokenValue * walletOneInput);
		 			//This code is for testing purposes	
	 				document.getElementById('balance-one-connected-value').innerHTML = 
						walletOneToTwoBalanceAdd;

					//Wallet Two	
					var walletTwoToOneBalanceAdd = (walletTwoTokenValue * walletTwoInput);
					//This code is for testing purposes	
	 				document.getElementById('balance-two-connected-value').innerHTML = 
						walletOneToTwoBalanceAdd;	

					RWmodal.open(1, 'Exchange Successful');							
					
					}				
				
			}			

			//Might need this for rounding exchanged Balanced & Tokens:
			//numberFormat = new Intl.NumberFormat('en-US', 
			//{ minimumFractionDigits: 2 }).format(walletOneBalance);
			//Display new balances
			//RWmodal.open(1, 'Exchange Successful');	

// Combinatorial Mechanism (Above)
			
			function resetWallets(){
				if (connectedWalletOne == false || connectedWalletTwo == false){
					RWmodal.open(1, 'Connect Both Wallets');
					}
				else if (connectedWalletOne == true && connectedWalletTwo == true){
					RWmodal.open(1, 'In Development');	
					}
			}

			
			function exchange(){
				if (connectedWalletOne == false || connectedWalletTwo == false){
					RWmodal.open(1, 'Connect Both Wallets');
					}
				else if (connectedWalletOne == true && connectedWalletTwo == true){
					//RWmodal.open(1, 'In Development');	
					
						//This code is for testing purposes
/* 						divideBalancesByTotalTokens();	 */	
						//This code is for testing purposes
						multiplyTokenValuesByTokensExchanged();
					}
			}

		</script>
				<!-- Change below links after test -->
		<link rel="stylesheet" type="text/css" href="css/test/prototype-test.css">	
		<link rel="stylesheet" href="css/test/RWmodalani-test.css" />
			
		<meta charset="UTF-8">
		
<!-- Below information for social media sharing and search-engine/browser optimization -->		
		<meta name="title" content="Ecare">
		<meta name="description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta name="google" content="nositelinkssearchbox">
		<meta name="keywords" content="Ecare, Ethereum">
		<meta name="author" content="Ecare">
		<meta name="viewport" id="viewport" content="width=device-width,user-scalable=yes,initial-scale=1" >
		
		<link rel="icon" type="image/x-icon" href="/icons&images/Iconic.ico" sizes="156x156">
				<!-- Change below link after test -->
		<link rel="canonical" href="https://ecare.exchange/prototype-test">
		
		<meta property="og:image" content="https://user-images.githubusercontent.com/51394348/169722650-92d9cef2-3288-433d-8a9f-9bebb8911c38.jpg">	
		<meta property="og:site_name" content="Ecare">	
		<meta property="og:type" content="object">				
		<meta property="og:title" content="Ecare">
				<!-- Change below link after test -->
		<meta propety="og:url" content="https://ecare.exchange/prototype-test">
		<meta property="og:description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta property="og:image:type" content="image/jpg">
		<meta property="og:image:width" content="700">
		<meta property="og:image:height" content="400">
		
		<meta name="twitter:title" content="Ecare">
		<meta name="twitter:image" content="https://user-images.githubusercontent.com/51394348/169722650-92d9cef2-3288-433d-8a9f-9bebb8911c38.jpg">
				<!-- Change below link after test -->
		<meta name="twitter:url" content="https://ecare.exchange/prototype-test">
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta name="description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
<!-- Above information for social media sharing and search-engine/browser optimization -->	

		<title>Ecare Prototype</title>
	
	</head>
	<body>
	
			<!-- Change below link after test -->
      <a href="/test" >
        <img id="img" src="/icons&images/appIcon.png"/>
      </a>
      
      		<!-- Change below link after test -->
      <form action="/prototype-test" method="GET">
      
      <section class="exchange-grid">

        <div id="left-top-wallet">
        
          <section id="wallet-one-not-connected" style="display:block">
            <button class="eth" id="choose-token">
              <img id="ethicon" src="/icons&images/eth-icon.png"/>
              <p id="eth-name">ETH</p>
            </button>
            
            <div class="form-group">
              <label id="label">Balance</label>
              <br>
              <p id="dllr-disconnected">$<span id="balance-not-connected">0.00</span></p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-not-connected">0.00</p>
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-one" type="number"></input>
            </div>	

            <br></br>

            <button onclick="connectWalletOne()" 
              id="connect-wallet-one" type="button">
              Connect Wallet One
            </button>  
          </section>
          
          <section id="wallet-one-connected" style="display:none">
	          <button class="eth" id="choose-token">
	              <img id="ethicon" src="/icons&images/eth-icon.png"/>
	              <p id="eth-name">ETH</p>
	          </button>
	          
            <div class="form-group">
              <label id="label">Balance</label>
              <br>
              <p id="dllr-connected">$
              	<span id="balance-one-connected" style="display:inline">10,000.00
              	</span>
              	<span id="balance-one-connected-value" style="display:none"></span>
              </p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-one-connected" style="display:block">10.00</p>
              <p id="tokens-one-connected-value" style="display:none"></p>
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-one" type="number"></input>
            </div>	
	
	            <br></br>
	
	            <button id="connected-wallet">
	              Connected
	            </button>  
     
          </section>
          
        </div>

        <div id="right-bottom-wallet">
          <section id="wallet-two-not-connected" style="display:block">

            <button class="weth" id="choose-token">
              <img id="ethicon" src="/icons&images/weth-icon.png"/>
              <p id="weth-name">WETH</p>
            </button>

            <div class="form-group">
              <label id="label">Balance</label>
              <br>
              <p id="dllr-disconnected">$<span id="balance-not-connected">0.00</span></p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-not-connected">0.00</p>
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-two" type="number"></input>
            </div>										
            
            <br></br>

            <button onclick="connectWalletTwo()" 
              id="connect-wallet-two" type="button">
              Connect Wallet Two
            </button>
          </section>
          
          <section id="wallet-two-connected" style="display:none">

            <button class="weth" id="choose-token">
              <img id="ethicon" src="/icons&images/weth-icon.png"/>
              <p id="weth-name">WETH</p>
            </button>

            <div class="form-group">
              <label id="label">Balance</label>
              <br>
              <p id="dllr-connected">$
              	<span id="balance-two-connected" style="display:inline">5,000.00
              	</span>
              	<span id="balance-two-connected-value" style="display:none"></span>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-two-connected" style="display:block">5.00</p>
              <p id="tokens-two-connected-value" style="display:none"></p>              
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-two" type="number"></input>
            </div>										
            
            <br></br>

	            <button id="connected-wallet">
	              Connected
	            </button>
          </section>
          
        </div>

      </section>
      
      
      
      <a onclick="resetWallets()">
        <img id="refresh" src="/icons&images/refreshIcon.png"/>
      </a>      
      
      <br>
      
      <a onclick="exchange()" id="exchange" style="display:block">
          EXCHANGE
      </a>
      
<!--       <button onclick="exchange()" 
      type="submit" id="exchange">
          EXCHANGE
      </button> -->
      
      </form>


      <hr></hr>

      <h3 id="name">
        <p id="names">ethereum</p>
        <p id="names">combinatorial</p>
        <p id="names">auction</p>
        <p id="names">rate</p>
        <p id="names">exchange</p>
        <p id="proto-name">prototype</p>
      </h3>
      
      <br>
     	    <!-- Change below link after test -->
      <a href="/guide-test" target="_blank" id="guide">
      	Guide
      </a>
	
	</body>
</html>
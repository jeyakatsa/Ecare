<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="javascript/RWmodal.min.js"></script>
		<script type="text/javascript">
		
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
/* 			var walletOneBalance = 10000.00;
			var walletOneTokens = 10.00;
			var walletOneTokenValue = 0.00; */
			
			//Wallet Two Balance/Tokens/Inputs
/* 			var walletTwoBalance = 5000.00;
			var walletTwoTokens = 5.00;	
			var walletTwoTokenValue = 0.00; */

			//inputTest		
	        function getInputValue(){	        
	            // Selecting the input element and get its value 
	            
	            // Displaying the value
	            alert();
	        }			

			//Step 1 [Trial & Error Purposes]
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

			//Step 2 [Trial & Error Purposes]
			function multiplyTokenValuesByTokensExchanged() {
				
				//Step 1
 				var walletOneTokenValue = (walletOneBalance / walletOneTokens);
				var walletTwoTokenValue = (walletTwoBalance / walletTwoTokens);

 				
				//Step 2
				var walletOneInput = parseFloat(document.getElementById('input-one').value);	
				var walletTwoInput = parseFloat(document.getElementById('input-two').value);

					//Wallet One
	 				var walletOneToTwoBalanceAdd = (walletOneTokenValue * walletOneInput);
		 			//This code is for testing purposes	
/* 		 			document.getElementById('balance-one-connected-value').style.display = "inline";
				    document.getElementById('balance-one-connected').style.display = "none";
	 				document.getElementById('balance-one-connected-value').innerHTML = 
	 					walletOneToTwoBalanceAdd.toFixed(2); */

					//Wallet Two	
					var walletTwoToOneBalanceAdd = (walletTwoTokenValue * walletTwoInput);
					//This code is for testing purposes	
/* 		 			document.getElementById('balance-two-connected-value').style.display = "inline";
				    document.getElementById('balance-two-connected').style.display = "none";					
	 				document.getElementById('balance-two-connected-value').innerHTML = 
	 					walletTwoToOneBalanceAdd.toFixed(2);	

					RWmodal.open(1, 'Exchange Successful');		 */													
				
			}		

			//Step 3 [Trial & Error Purposes]
			function compareContrastExchangeTokens(){
/* 				//Wallet One Balance/Tokens/Inputs
				var walletOneBalance = 100000.00;
				var walletOneTokens = 100.00;
				var walletOneInput = parseFloat(document.getElementById('input-one').value);
				//Wallet One Balance/Tokens Updates
				var walletOneTokenValue = 0.00;
				var walletOneToTwoBalanceAdd = 0.00;
				var newWalletOneTokens = document.getElementById('tokens-one-connected-value').innerHTML;
				
				//Wallet Two Balance/Tokens/Inputs
				var walletTwoBalance = 90000.00;
				var walletTwoTokens = 90.00;
				var walletTwoInput = parseFloat(document.getElementById('input-two').value);
				//Wallet Two Balance/Tokens Updates				
				var walletTwoTokenValue = 0.00;
				var walletTwoToOneBalanceAdd = 0.00;
				var newWalletTwoTokens = document.getElementById('tokens-two-connected-value').innerHTML;

				
				//Base Cases
				if (document.getElementById('input-one').value == "" ||
						document.getElementById('input-two').value == "") {
					RWmodal.open(1, 'Exchange Tokens');				
				}
				else if ((walletOneTokens < walletOneInput || 
						walletTwoTokens < walletTwoInput) 
						||
						(newWalletOneTokens < walletOneInput || 
								newWalletTwoTokens < walletTwoInput)){
					RWmodal.open(1, 'Limited Total Tokens');	
				}					
				//Main Algorithm
				else if (newWalletOneTokens == 0 || newWalletTwoTokens == 0) {
					
					walletOneTokens = (walletOneTokens - walletOneInput);
					walletTwoTokens = (walletTwoTokens - walletTwoInput);
					
					document.getElementById('tokens-one-connected-value').style.display = "inline";
					document.getElementById('tokens-one-connected').style.display = "none";	
	 				document.getElementById('tokens-one-connected-value').innerHTML = 
	 					walletOneTokens.toFixed(2);
	 				document.getElementById('input-one').value = "";	

					document.getElementById('tokens-two-connected-value').style.display = "inline";
				    document.getElementById('tokens-two-connected').style.display = "none";	
	 				document.getElementById('tokens-two-connected-value').innerHTML = 
	 					walletTwoTokens.toFixed(2);
	 				document.getElementById('input-two').value = "";
				}
				else if (newWalletOneTokens > 0 || newWalletTwoTokens > 0) {				
					
					newWalletOneTokens = (newWalletOneTokens - walletOneInput);
					newWalletTwoTokens = (newWalletTwoTokens - walletTwoInput);
					
	 				document.getElementById('tokens-one-connected-value').innerHTML = 
	 					newWalletOneTokens.toFixed(2);
	 				document.getElementById('input-one').value = "";	

	 				document.getElementById('tokens-two-connected-value').innerHTML = 
	 					newWalletTwoTokens.toFixed(2);
	 				document.getElementById('input-two').value = "";
	 				
				} */
				
			}

			//Step 4
			function updateBalances(){
				//Wallet One Balance/Tokens/Inputs
				var walletOneBalance = 100000.00;
				var walletOneTokens = 100.00;
				var walletOneInput = parseFloat(document.getElementById('input-one').value);
				//Wallet One Balance/Tokens Updates
				var walletOneTokenValue = (walletOneBalance / walletOneTokens);
				var walletOneToTwoBalanceAdd = (walletOneTokenValue * walletOneInput);
				//New Wallet One Balance/Tokens Updates
				var newWalletOneTokens = document.getElementById('tokens-one-connected-value').innerHTML;
				var newWalletOneBalance = document.getElementById('balance-one-connected-value').innerHTML;
				var newWalletOneTokenValue = (newWalletOneBalance / newWalletOneTokens);
				var newWalletOneToTwoBalanceAdd = (newWalletOneTokenValue * walletOneInput);
				
				//Wallet Two Balance/Tokens/Inputs
				var walletTwoBalance = 90000.00;
				var walletTwoTokens = 90.00;
				var walletTwoInput = parseFloat(document.getElementById('input-two').value);
				//Wallet Two Balance/Tokens Updates				
				var walletTwoTokenValue = (walletTwoBalance / walletTwoTokens);
				var walletTwoToOneBalanceAdd = (walletTwoTokenValue * walletTwoInput);
				//New Wallet One Balance/Tokens Updates
				var newWalletTwoTokens = document.getElementById('tokens-two-connected-value').innerHTML;
				var newWalletTwoBalance = document.getElementById('balance-two-connected-value').innerHTML;
				var newWalletTwoTokenValue = (newWalletTwoBalance / newWalletTwoTokens);
				var newWalletTwoToOneBalanceAdd = (newWalletTwoTokenValue * walletTwoInput);
				
				//Base Cases
				if (document.getElementById('input-one').value == "" ||
						document.getElementById('input-two').value == "") {
					RWmodal.open(1, 'Exchange Tokens');				
				}
				else if ((walletOneTokens < walletOneInput || 
						walletTwoTokens < walletTwoInput) 
						||
						(newWalletOneTokens < walletOneInput || 
								newWalletTwoTokens < walletTwoInput)){
					RWmodal.open(1, 'Limited Total Tokens');	
				}					
				//Main Algorithm
				else if (newWalletOneTokens == 0 || newWalletTwoTokens == 0) {

					//Balances Updating Algorithm
	 				walletOneBalance = (walletOneBalance + walletTwoToOneBalanceAdd);
	 				walletTwoBalance = (walletTwoBalance + walletOneToTwoBalanceAdd);

	 				document.getElementById('balance-one-connected-value').style.display = "inline";
					document.getElementById('balance-one-connected').style.display = "none";	
	 				document.getElementById('balance-one-connected-value').innerHTML = 
	 					walletOneBalance.toFixed(2);

					document.getElementById('balance-two-connected-value').style.display = "inline";
				    document.getElementById('balance-two-connected').style.display = "none";	
	 				document.getElementById('balance-two-connected-value').innerHTML = 
	 					walletTwoBalance.toFixed(2);
	 				
					//Tokens Updating Algorithm
					walletOneTokens = (walletOneTokens - walletOneInput);
					walletTwoTokens = (walletTwoTokens - walletTwoInput);
					
					document.getElementById('tokens-one-connected-value').style.display = "inline";
					document.getElementById('tokens-one-connected').style.display = "none";	
	 				document.getElementById('tokens-one-connected-value').innerHTML = 
	 					walletOneTokens.toFixed(2);
	 				document.getElementById('input-one').value = "";	

					document.getElementById('tokens-two-connected-value').style.display = "inline";
				    document.getElementById('tokens-two-connected').style.display = "none";	
	 				document.getElementById('tokens-two-connected-value').innerHTML = 
	 					walletTwoTokens.toFixed(2);
	 				document.getElementById('input-two').value = "";
				}
				else if (newWalletOneTokens > 0 || newWalletTwoTokens > 0) {	

					//Balances Updating Algorithm
	 				newWalletOneBalance = (newWalletOneBalance + walletTwoToOneBalanceAdd);
	 				newWalletTwoBalance = (newWalletTwoBalance + walletOneToTwoBalanceAdd);
	
	 				document.getElementById('balance-one-connected-value').innerHTML = 
	 					newWalletOneBalance.toFixed(2);
	
	 				document.getElementById('balance-two-connected-value').innerHTML = 
	 					newWalletTwoBalance.toFixed(2);								

					//Tokens Updating Algorithm
					newWalletOneTokens = (newWalletOneTokens - walletOneInput);
					newWalletTwoTokens = (newWalletTwoTokens - walletTwoInput);
					
	 				document.getElementById('tokens-one-connected-value').innerHTML = 
	 					newWalletOneTokens.toFixed(2);
	 				document.getElementById('input-one').value = "";	

	 				document.getElementById('tokens-two-connected-value').innerHTML = 
	 					newWalletTwoTokens.toFixed(2);
	 				document.getElementById('input-two').value = "";
	 				
				}				
			}			


			//Might need this for rounding exchanged Balanced & Tokens:
			//numberFormat = new Intl.NumberFormat('en-US', 
			//{ minimumFractionDigits: 2 }).format(walletOneBalance);
			//Display new balances
			//RWmodal.open(1, 'Exchange Successful');	
			
			//**UPDATE MECHANICS AFTER SUCCESSFUL CO
			//Integrates a cross pollination exchange mechanism
			//During exchange, tokens exchanged are transfered to burn wallets,
			//while balances of the tokens exchanged are transferred to exchange wallets
			//During exchange, tokens are subtracted while balances are added

// Combinatorial Mechanism (Above)
			
			function resetWallets(){
				if (connectedWalletOne == false || connectedWalletTwo == false){
					RWmodal.open(1, 'Connect Both Wallets');
					}
				else if (connectedWalletOne == true && connectedWalletTwo == true){
					RWmodal.open(1, 'Wallets Reset');	
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
					//Step 3	

					updateBalances();
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
        
      <section class="exchange-grid">

        <div id="left-top-wallet">
        
          <section id="wallet-one-not-connected" style="display:block">
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
              	<span id="balance-one-connected" style="display:inline">100,000.00
              	</span>
              	<span id="balance-one-connected-value" style="display:none"></span>
              </p>
            </div>
            
            <div class="form-group-tokens">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-one-connected" style="display:inline">100.00</p>
              <p id="tokens-one-connected-value" style="display:none"></p>
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-one" type="text" 
              		onkeyup="this.value = this.value.replace(/[^0-9.]/, '')"
              		step="any" value="0.00" />
            </div>	
	
	            <br></br>
	
	            <button id="connected-wallet">
	              Connected
	            </button>  
     
          </section>
          
        </div>

        <div id="right-bottom-wallet">
        
          <section id="wallet-two-not-connected" style="display:block">
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
              	<span id="balance-two-connected" style="display:inline">90,000.00
              	</span>
              	<span id="balance-two-connected-value" style="display:none"></span>
            </div>
            
            <div class="form-group-tokens">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="tokens-two-connected" style="display:inline">90.00</p>
              <p id="tokens-two-connected-value" style="display:none"></p>              
            </div>
            
            <div class="form-group-exchange">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input-two" type="text" 
              		onkeyup="this.value = this.value.replace(/[^0-9.]/, '')"              
              		step="any" value="0.00"/>
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
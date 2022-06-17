<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/test/prototype-test.css">	
		<script src="javascript/JSmodal.min.js"></script>
		<script>
			function connectWalletOne() {
				   document.getElementById('wallet-one-connected').style.display = "block";
				   document.getElementById('wallet-one-not-connected').style.display = "none";
			}
			function connectWalletTwo() {
				   document.getElementById('wallet-two-connected').style.display = "block";
				   document.getElementById('wallet-two-not-connected').style.display = "none";
			}
		</script>
		<link rel="stylesheet" href="css/test/JSmodalani-test.css" />	
			
		<meta charset="UTF-8">
		
<!-- Below information for social media sharing and search-engine/browser optimization -->		
		<meta name="title" content="Ecare">
		<meta name="description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta name="google" content="nositelinkssearchbox">
		<meta name="keywords" content="Ecare, Ethereum">
		<meta name="author" content="Ecare">
		<meta name="viewport" id="viewport" content="width=device-width,user-scalable=yes,initial-scale=1" >
		
		<link rel="icon" type="image/x-icon" href="/icons&images/Iconic.ico" sizes="156x156">
		<link rel="canonical" href="https://ecare.exchange/prototype">
		
		<meta property="og:image" content="https://user-images.githubusercontent.com/51394348/169722650-92d9cef2-3288-433d-8a9f-9bebb8911c38.jpg">	
		<meta property="og:site_name" content="Ecare">	
		<meta property="og:type" content="object">				
		<meta property="og:title" content="Ecare">
		<meta propety="og:url" content="https://ecare.exchange/prototype">
		<meta property="og:description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta property="og:image:type" content="image/jpg">
		<meta property="og:image:width" content="700">
		<meta property="og:image:height" content="400">
		
		<meta name="twitter:title" content="Ecare">
		<meta name="twitter:image" content="https://user-images.githubusercontent.com/51394348/169722650-92d9cef2-3288-433d-8a9f-9bebb8911c38.jpg">
		<meta name="twitter:url" content="https://ecare.exchange/prototype">
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
		<meta name="description" content="Ethereum Combinatorial Auction Rate Exchange Prototype">
<!-- Above information for social media sharing and search-engine/browser optimization -->	

		<title>Ecare Prototype</title>
	
	</head>
	<body>
	
      <a href="/test" >
        <img id="img" src="/icons&images/appIcon.png"/>
      </a>
      
      <form action="prototype-test.jsp" method="POST">
      
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
              <p id="numbers">$0.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="numbers">0.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input" class="form-control"></input>
            </div>	

            <br></br>

            <button onclick="connectWalletOne()" 
              id="connect-wallet" type="button">
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
              <p id="numbers">$10000.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="numbers">10.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input" class="form-control"></input>
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
              <p id="numbers">$0.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="numbers">0.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input" class="form-control"></input>
            </div>										
            
            <br></br>

            <button onclick="connectWalletTwo()" 
              id="connect-wallet" type="button">
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
              <p id="numbers">$5000.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Total Tokens</label>					
              <br>
              <p id="numbers">5.00</p>
            </div>
            
            <div class="form-group">
              <label id="label">Exchange Tokens</label>						
              <br>
              <input id="input" class="form-control"></input>
            </div>										
            
            <br></br>

	            <button id="connected-wallet">
	              Connected
	            </button>
          </section>
          
        </div>

      </section>
      
      
      
      <a onclick="JSmodal.open(1, 'IN DEVELOPMENT')">
        <img id="refresh" src="/icons&images/refreshIcon.png"/>
      </a>      
      
      <br>

      <button onclick="JSmodal.open(1, 'IN DEVELOPMENT')" 
      type="button" id="exchange">
          EXCHANGE
      </button>
      
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
	
	</body>
</html>
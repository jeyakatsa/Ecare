<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/prototype.css">	
		<script src="javascript/JSmodal.min.js">
		
		</script>
		<link rel="stylesheet" href="css/JSmodalani.css" />	
			
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
	
      <a href="/" >
        <img id="img" src="/icons&images/appIcon.png"/>
      </a>

      <section class="exchange-grid">

        <div id="left-top-wallet">
          <section>

            <button class="eth" id="choose-token">
              <img id="ethicon" src="/icons&images/eth-icon.png"/>
              <p id="eth-name">ETH</p>
            </button>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="name">Balance</label>
              <br>
              <errors id="errors" path="name"></errors>
              <label id="numbers" path="name">$0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="website">Total Tokens</label>					
              <br>
              <errors id="errors" path="website"></errors>
              <label id="numbers" path="name">0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="email">Exchange Tokens</label>						
              <br>
              <errors id="errors" path="email"></errors>
              <input id="input" class="form-control" path="email"></input>
            </div>

            <br></br>

            <input onclick="JSmodal.open(1, 'IN DEVELOPMENT')"
            id="connect-wallet" type="submit" value="Connect Wallet One"/>
          
          </section>
          <p id="wallet-connected">
            Wallet One Connected
          </p>
        </div>

        <div id="right-bottom-wallet">
          <section>

            <button class="weth" id="choose-token">
              <img id="ethicon" src="/icons&images/weth-icon.png"/>
              <p id="weth-name">WETH</p>
            </button>

            <div class="form-group" id="enter-content">
              <label id="label" path="name">Balance</label>
              <br>
              <errors id="errors" path="name"></errors>
              <label id="numbers" path="name">$0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="website">Total Tokens</label>					
              <br>
              <errors id="errors" path="website"></errors>
              <label id="numbers" path="name">0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="email">Exchange Tokens</label>						
              <br>
              <errors id="errors" path="email"></errors>
              <input id="input" class="form-control" path="email"></input>
            </div>										
            
            <br></br>

            <input onclick="JSmodal.open(1, 'IN DEVELOPMENT')" 
              id="connect-wallet" type="submit" value="Connect Wallet Two"/>
          </section>
          <p id="wallet-connected">
            Wallet Two Connected
          </p>
        </div>

      </section>

      <button onclick="JSmodal.open(1, 'IN DEVELOPMENT')" type="button" id="exchange">
          EXCHANGE
      </button>

      <hr></hr>

      <h3 id="name">
        <p>ethereum</p>
        <p>combinatorial</p>
        <p>auction</p>
        <p>rate</p>
        <p>exchange</p>
        <p id="proto-name">prototype</p>
      </h3>
	
	</body>
</html>
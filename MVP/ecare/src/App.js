import './App.css';

function App() {
  return (
    <section class="body">

      <a class="icon">
        <img id="img" src="EcareIcon.png"/>
      </a>

      <section class="exchange-grid">

        <div id="left-top-wallet">
          <form action="/connect-wallet" method="post" modelAttribute="charity">

            <select name="currencies" id="choose-token">
              <option value="ETH">
                <img id="ethicon" src="eth-icon.png"/>
                ETH
              </option>
              <option value="WETH">
                <img id="ethicon" src="weth-icon.png"/>
                WETH
              </option>
            </select>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="name">Balance</label>
              <br></br>
              <errors id="errors" path="name"></errors>
              <label id="numbers" path="name">$0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="website">Total Tokens</label>					
              <br></br>
              <errors id="errors" path="website"></errors>
              <label id="numbers" path="name">0.00</label>
            </div>
            
            <div class="form-group" id="enter-content">
              <label id="label" path="email">Exchange Tokens</label>						
              <br></br>
              <errors id="errors" path="email"></errors>
              <input id="input" class="form-control" path="email"></input>
            </div>

            <br></br>

              <input id="connect-wallet" type="submit" value="Connect Wallet One"/>
          
          </form>
          <p id="wallet-connected">
            Wallet One Connected
          </p>
        </div>

        <div id="right-bottom-wallet">
          <form action="/connect-wallet" method="post" modelAttribute="charity">

              <select name="currencies" id="choose-token">
                <option value="WETH">
                  <img id="ethicon" src="weth-icon.png"/>
                  WETH
                </option>
                <option value="ETH">
                  <img id="ethicon" src="eth-icon.png"/>
                  ETH
                </option>
              </select>

              <div class="form-group" id="enter-content">
                <label id="label" path="name">Balance</label>
                <br></br>
                <errors id="errors" path="name"></errors>
                <label id="numbers" path="name">$0.00</label>
              </div>
              
              <div class="form-group" id="enter-content">
                <label id="label" path="website">Total Tokens</label>					
                <br></br>
                <errors id="errors" path="website"></errors>
                <label id="numbers" path="name">0.00</label>
              </div>
              
              <div class="form-group" id="enter-content">
                <label id="label" path="email">Exchange Tokens</label>						
                <br></br>
                <errors id="errors" path="email"></errors>
                <input id="input" class="form-control" path="email"></input>
              </div>										
              
              <br></br>

                <input id="connect-wallet" type="submit" value="Connect Wallet Two"/>
            </form>
          <p id="wallet-connected">
            Wallet Two Connected
          </p>
        </div>

      </section>

      <button type="button" id="exchange">
          EXCHANGE
      </button>

      <hr></hr>

      <h3 id="name">
        <p id="names">ethereum</p>
        <p id="names">combinatorial</p>
        <p id="names">auction</p>
        <p id="names">rate</p>
        <p id="names">exchange</p>
      </h3>

    </section>
  );
}

export default App;

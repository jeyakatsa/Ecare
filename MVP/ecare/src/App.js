import './App.css';

function App() {
  return (
    <section class="body">
      <a class="icon">
        <img src="EcareIcon.png"/>
      </a>

        <section class="exchange-grid">
          <div id="left-top-wallet">
            <form action="/connect-wallet" method="post" modelAttribute="charity">
            <div class="form-group" id="enter-content">
              <label id="label" path="name">Balance</label>
              <errors id="errors" path="name"></errors>
              <input id="input" class="form-control" path="name"></input>
            </div>
            <div class="form-group" id="enter-content">
              <label id="label" path="website">Total Tokens</label>					
              <errors id="errors" path="website"></errors>
              <input id="input" class="form-control" path="website"></input>
            </div>
            <div class="form-group" id="enter-content">
              <label id="label" path="email">Exchange Tokens</label>						
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

            <button type="button" id="connect-wallet">
              Connect Wallet Two
            </button>
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

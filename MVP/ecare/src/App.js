import './App.css';

function App() {
  return (
    <section class="body">
      <a class="icon">
        <img src="EcareIcon.png"/>
      </a>

        <section class="exchange-grid">
          <div id="left-top-wallet">

            <button type="button" id="connect-wallet">
              Connect Wallet One
            </button>
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

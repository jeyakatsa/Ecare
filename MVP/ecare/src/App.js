import './App.css';

function App() {
  return (
    <section class="body">
      	<img class="icon" src="EcareIcon.png"/>
        <section class="exchange-grid">
          <div id="left-top-wallet">

            <button type="button" id="connect-wallet">
              Connect Wallet
            </button>
            <p id="wallet-connected">
              Wallet Connected
            </p>
          </div>
          
          <div id="right-bottom-wallet">

            <button type="button" id="connect-wallet">
              Connect Wallet
            </button>
            <p id="wallet-connected">
              Wallet Connected
            </p>
          </div>
          <button type="button" id="swap">
            SWAP
          </button>
        </section>

    </section>
  );
}

export default App;

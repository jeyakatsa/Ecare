import React, {useEffect, useState } from 'react';

function App() {

  const { 
    connectWallet, 
    currentAccount,
    formData,
    setFormData,
    handleChange } = useContext(TransactionContext);

  const handleSubmit = (e) => {
    const {
      addressTo,
      amount,
      keyword,
      message
    } = formData;

    e.preventDefault();

    if(!addressTo || !amount || !keyword || !message) return;

    sendTransaction();
  }  

  return (
    <div className="App">
      <h1 id="Title">
        Basic AMM
      </h1>
    </div>
  )
}

export default App

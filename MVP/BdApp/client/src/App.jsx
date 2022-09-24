import React, {useEffect, useState } from 'react';

function App() {

  const { 
    connectWallet, 
    currentAccount,
    formData,
    setFormData,
    handleChange } = useContext(TransactionContext);

  const handleSubmit = () => {
    const {
      addressTo,
      amount,
      keyword,
      message
    } = formData;

    e.preventDefault();
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

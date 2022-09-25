import React, {useEffect, useState } from 'react';

function App() {

  const { 
    connectWallet, 
    currentAccount,
    formData,
    setFormData,
    handleChange } = useContext(TransactionContext);


  return (
    <div className="App">
      <h1 id="Title">
        Basic AMM
      </h1>
    </div>
  )
}

export default App

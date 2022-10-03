import React, {useEffect, useState } from 'react';
import {AiFillPlayCircle} from 'react-icons/ai';
import {SiEthereum} from 'react-icons/si';
import {BsInfoCircle} from 'react-icons/bs';


import {TransactionContext} from '../context/TransactIonContext';
import {Loader} from './';

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

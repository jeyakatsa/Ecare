import React, {useEffect, useState } from 'react';
import { ethers } from 'ethers';

import{ contractABI, contractAddress } from '.../utils/constants';

export const TransactionContext = React.createContext();

const { ethereum } = window;

const getEtheremContract = () => {
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    const transcactionContract = new ethers.contract(
        contractAddress,
        contractABI,
        signer
    );

    console.log({
        provider,
        signer,
    })
}
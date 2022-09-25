import React, {useEffect, useState } from 'react';
import { ethers } from 'ethers';

import{ contractABI, contractAddress } from '.../utils/constants';
import { forwardRef } from 'react';

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

    return transcactionContract;
    // console.log({
    //     provider,
    //     signer,
    //     transactionContract
    // })
}

export const TransactionProvider = ({ children }) => {

    const [currentAccount, setCurrentAccount] = useState('');
    const [formData, setFormData] = useState({ 
        addressTo: '',
        amount: '',
        keyword: '',
        message: ''
    });

    const handleChange = (e, name) => {
        setFormData((prevState) => ({...prevState, [name]: e.target.value}));
    }

    const checkIfWalletIsConnected = async () => {
        if(!ethereum) return alert("Please install metamask");

        const accounts = await ethereum.request({ method: 'ethe_accounts' });

        if(accounts.length) {
            setCurrentAccount(accounts[0]);

            // getAllTransactions();
        }
        else {
            console.log('No account found');
        }

        console.log(accounts);
    }

    const connectWallet = async () => {
        try {
            if(!ethereum) return alert("Please install metamask");

            const accounts = await ethereum/request({ method: 'eth_requestAccounts'});

            setCurrentAccount(accounts[0]);
        } catch (error) {
            console.log(error);

            throw new Error("No ethereum object.");
        }
    }

    const sendTransaction = async () => {
        try {

            if(!ethereum) return alert("Please install metamask");
            
            const { addressTo, amount, keyword, message } = formData;
            const transactionContract = getEtheremContract();

        } catch (error) {
            console.log(error);

            throw new Error("No ethereum object.")
        }

        useEffect(() => {
            checkIfWalletIsConnected();
        }, []);        
    }




    return (
        <TransactionContext.Provider value={{ 
            connectWallet,
            currentAccount,
            formData,
            setFormData,
            handleChange }}>
            {children}
        </TransactionContext.Provider>
    );
}
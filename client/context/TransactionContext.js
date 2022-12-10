import React, { useState, useEffect } from 'react'

export const TransactionContext = React.createContext()

if (typeof window !== 'undefined') {
  console.log('Metamask is installed')
}

export const TransactionProvider = ({ children }) => {
  const [currentAccount, setCurrentAccount] = useState()
  
  const connectWallet = async ethereum => {
    try {
      if (!window.ethereum) return alert('Please install metamask')

      const accounts = await window.ethereum.request({method: 'eth_requestAccounts'})

      setCurrentAccount(accounts[0])
    } catch (error) {
      console.log(error)
      throw new Error('No ethereum object.')
    }
  }

  return (
    <TransactionContext.Provider
      value={{
        currentAccount,
        connectWallet
      }}
    >
      { children }
    </TransactionContext.Provider>
  )
}



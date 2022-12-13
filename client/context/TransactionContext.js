import React, { useState, useEffect } from 'react'

export const TransactionContext = React.createContext()

if (typeof window !== 'undefined') {
  console.log('Metamask is installed')
}

export const TransactionProvider = ({ children }) => {
  const [currentAccount, setCurrentAccount] = useState()

  useEffect(() => {
    checkWalletConnection()
  })
  
  const connectWallet = async () => {
    try {
      if (!window.ethereum) return alert('Please install metamask')

      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' })

      setCurrentAccount(accounts[0])
    } catch (error) {
      console.log(error)
      throw new Error('No ethereum object.')
    }
  }

  const checkWalletConnection = async () => {
    try {
      if (!window.ethereum) return alert('Please install metamask')

      const accounts = await window.ethereum.request({ method: 'eth_accounts' })

      if (accounts.length) {
        setCurrentAccount(accounts[0])
        console.log('Wallet is already connected!')
      }
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



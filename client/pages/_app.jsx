import '../styles/globals.css'
import { TransactionProvider } from '../context/TransactionContext'

export default function App({ Component, pageProps }) {
  return (
    <TransactionProvider>
      <Component {...pageProps} />
    </TransactionProvider>
  )
}

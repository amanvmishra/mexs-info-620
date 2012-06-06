package mexs

import java.util.Date;

class Transaction implements java.io.Serializable {
	int transactionID
	Terminal terminalID
	Patron patronID
	Employee employeeID
	double commissionRate
	Currency sourceCurrencyID
	double sourceAmount
	Currency targetCurrencyID
	double totalTargetAmount
	double totalTransactionAmount
	Date dateOfTransaction
	
    static constraints = {
    }
	
	static mapping = {
		id name: 'transactionID'
		terminalID fetch: 'join'
		patronID fetch: 'join'
		employeeID fetch: 'join'
		sourceCurrencyID fetch: 'join'
		targetCurrencyID fetch: 'join'
	}
}

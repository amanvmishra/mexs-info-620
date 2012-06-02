package mexs

class Currency {

	int currencyID
	double conversionRate
	double amount
	String countryCode
	
	static hasMany = [sourceTransactions : Transaction, targetTransactions : Transaction]
    static mappedBy = [sourceTransactions : "sourceCurrencyID", targetTransactions : "targetCurrencyID"]
	
	static constraints = {
		
    }
	
	static mapping = {
		id name: 'currencyID'
	}
	
}

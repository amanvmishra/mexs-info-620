package mexs

class Currency implements java.io.Serializable {

    int currencyID
	double buyingRate
	double sellingRate
	String currencyName
	String countryName
	String currencySymbol
	
	static hasMany = [sourceTransactions : Transaction, targetTransactions : Transaction]
    static mappedBy = [sourceTransactions : "sourceCurrencyID", targetTransactions : "targetCurrencyID"]
	
	static constraints = {
		
    }
	
	static mapping = {
		id name: 'currencyID'
	}
}

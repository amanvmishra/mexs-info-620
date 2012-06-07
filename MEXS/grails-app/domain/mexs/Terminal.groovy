package mexs

class Terminal implements java.io.Serializable {

   	int terminalID
	Bank bankID

	static hasMany = [transactions : Transaction]
	
    static constraints = {
    }
	
	static mapping = {
		id name: 'terminalID'
		id generator: 'assigned'
	}
}

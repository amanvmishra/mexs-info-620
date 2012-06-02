package mexs

class Terminal {
	
	int terminalID
	Bank bankID

	static hasMany = [transactions : Transaction]
	
    static constraints = {
    }
	
	static mapping = {
		id name: 'terminalID'
	}
}

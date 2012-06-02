package mexs

class Patron {
	
	int patronID
	String lastName
	String firstName
	int passportNumber
	Date dateOfBirth
	String country

	static hasMany = [transactions : Transaction]
	
    static constraints = {
    }
	
	static mapping = {
		id name: 'patronID'
	}
}

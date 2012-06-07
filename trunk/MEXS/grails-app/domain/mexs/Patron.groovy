package mexs

import java.util.Date;

class Patron implements java.io.Serializable {

	int patronID
	String lastName
	String firstName
	int passportNumber
	Date dateOfBirth
	String country

	static hasMany = [transactions : Transaction]
	
    static constraints = {
		dateOfBirth nullable: true
    }
	
	static mapping = {
		id name: 'patronID'
	}
}

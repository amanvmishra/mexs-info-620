package mexs

class Bank {
	
	int bankID
	String name
	String address
	String phone
	String url
	
	static hasMany = [terminals : Terminal]

    static constraints = {
		name(nullable:true)
		address(nullable:true)
		phone(nullable:true)
		url(nullable:true)
    }
	
	static mapping = {
		id name: 'bankID'
	}
}

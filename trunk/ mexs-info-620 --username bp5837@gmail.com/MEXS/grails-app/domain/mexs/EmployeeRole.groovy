package mexs

class EmployeeRole {

	int roleID
	String roleName
	
	static hasMany = [employees : Employee]
	
    static constraints = {
		roleName(nullable:true)
    }
	
	static mapping = {
		id name: 'roleID'
	}
}

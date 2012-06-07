package mexs

class EmployeeRole implements java.io.Serializable {

   	int roleID
	String roleName
	
	static hasMany = [employees : Employee]
	
    static constraints = {
		roleName(nullable:true)
    }
	
	static mapping = {
		id name: 'roleID'
		id generator: 'assigned'
	}
}

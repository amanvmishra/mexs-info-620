package mexs

class Employee implements java.io.Serializable {

    int employeeID
	EmployeeRole roleID
	String userName
	String password
	String firstName
	String lastName
	
	static hasMany = [transactions : Transaction]
	
    static constraints = {		
    }
	
	static mapping = {
		id name: 'employeeID'
		id generator: 'assigned'
	}
}

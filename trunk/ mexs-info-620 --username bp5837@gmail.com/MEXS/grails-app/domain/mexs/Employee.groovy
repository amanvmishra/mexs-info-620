package mexs

class Employee {
	
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
	}
}

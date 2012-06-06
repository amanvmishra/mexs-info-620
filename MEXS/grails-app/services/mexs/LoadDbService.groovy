package mexs

class LoadDbService {

	def serviceMethod() {
	}
	
    boolean transactional = true
	def rootDir = 'something'

	// a set method for property rootDir
	public void setRootDir(String dir) {

		rootDir = dir
		if (! (dir.endsWith("/") || dir.endsWith("\\")))
			rootDir += File.separator
	}

	def load() {

		new File(rootDir +  'Currency.csv').toCsvReader(['skipLines': 1]).eachLine{
			def currency = new Currency()
			currency.currencyID = it[0].toInteger()
			currency.buyingRate = it[1].toDouble()
			currency.sellingRate = it[2].toDouble()
			currency.currencyName = it[3]
			currency.countryName = it[4]
			currency.currencySymbol = it[5]
			currency.save(flush:true)
		}
		
		new File(rootDir +  'Bank.csv').toCsvReader(['skipLines': 1]).eachLine{
			def bank = new Bank()
			bank.bankID = it[0].toInteger()
			bank.name = it[1]
			bank.address = it[2]
			bank.phone = it[3]
			bank.url = it[4]
			bank.save(flush:true)
		}
		
		new File(rootDir +  'Terminal.csv').toCsvReader(['skipLines': 1]).eachLine{
			def terminal = new Terminal()
			terminal.terminalID = it[0].toInteger()
			terminal.bankID = Bank.findByBankID(it[1].toInteger())
			terminal.save(flush:true)
		}
		
		new File(rootDir +  'EmployeeRole.csv').toCsvReader(['skipLines': 1]).eachLine{
			def employeeRole = new EmployeeRole()
			employeeRole.roleID = it[0].toInteger()
			employeeRole.roleName = it[1]
			employeeRole.save(flush:true)
		}
		
		new File(rootDir +  'Patron.csv').toCsvReader(['skipLines': 1]).eachLine{
			def patron = new Patron()
			patron.patronID = it[0].toInteger()
			patron.lastName = it[1]
			patron.firstName = it[2]
			patron.passportNumber = it[3].toInteger()
			patron.dateOfBirth = new Date().parse("MM/DD/YYYY", it[4])
			patron.country = it[5]
			patron.save(flush:true)
		}
		
		new File(rootDir +  'Employee.csv').toCsvReader(['skipLines': 1]).eachLine{
			def employee = new Employee()
			employee.employeeID = it[0].toInteger()
			employee.roleID = EmployeeRole.findByRoleID(it[1].toInteger())
			employee.userName = it[2]
			employee.password = it[3]
			employee.firstName = it[4]
			employee.lastName = it[5]
			employee.save(flush:true)
		}
	}
}

<%@ page import="mexs.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeID', 'error')} required">
	<label for="employeeID">
		<g:message code="employee.employeeID.label" default="Employee ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="employeeID" required="" value="${fieldValue(bean: employeeInstance, field: 'employeeID')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="employee.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${employeeInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="employee.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${employeeInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${employeeInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'roleID', 'error')} required">
	<label for="roleID">
		<g:message code="employee.roleID.label" default="Role ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="roleID" name="roleID.id" from="${mexs.EmployeeRole.list()}" optionKey="id" required="" value="${employeeInstance?.roleID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'transactions', 'error')} ">
	<label for="transactions">
		<g:message code="employee.transactions.label" default="Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="employee.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${employeeInstance?.userName}"/>
</div>


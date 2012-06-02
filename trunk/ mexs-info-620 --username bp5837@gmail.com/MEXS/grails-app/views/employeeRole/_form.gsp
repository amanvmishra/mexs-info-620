<%@ page import="mexs.EmployeeRole" %>



<div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'roleName', 'error')} ">
	<label for="roleName">
		<g:message code="employeeRole.roleName.label" default="Role Name" />
		
	</label>
	<g:textField name="roleName" value="${employeeRoleInstance?.roleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'employees', 'error')} ">
	<label for="employees">
		<g:message code="employeeRole.employees.label" default="Employees" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeRoleInstance?.employees?}" var="e">
    <li><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="employee" action="create" params="['employeeRole.id': employeeRoleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'employee.label', default: 'Employee')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'roleID', 'error')} required">
	<label for="roleID">
		<g:message code="employeeRole.roleID.label" default="Role ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="roleID" required="" value="${fieldValue(bean: employeeRoleInstance, field: 'roleID')}"/>
</div>


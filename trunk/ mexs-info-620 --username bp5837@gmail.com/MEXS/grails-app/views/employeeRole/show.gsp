
<%@ page import="mexs.EmployeeRole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employeeRole.label', default: 'EmployeeRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employeeRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employeeRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employeeRole">
			
				<g:if test="${employeeRoleInstance?.roleName}">
				<li class="fieldcontain">
					<span id="roleName-label" class="property-label"><g:message code="employeeRole.roleName.label" default="Role Name" /></span>
					
						<span class="property-value" aria-labelledby="roleName-label"><g:fieldValue bean="${employeeRoleInstance}" field="roleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeRoleInstance?.employees}">
				<li class="fieldcontain">
					<span id="employees-label" class="property-label"><g:message code="employeeRole.employees.label" default="Employees" /></span>
					
						<g:each in="${employeeRoleInstance.employees}" var="e">
						<span class="property-value" aria-labelledby="employees-label"><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${employeeRoleInstance?.roleID}">
				<li class="fieldcontain">
					<span id="roleID-label" class="property-label"><g:message code="employeeRole.roleID.label" default="Role ID" /></span>
					
						<span class="property-value" aria-labelledby="roleID-label"><g:fieldValue bean="${employeeRoleInstance}" field="roleID"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${employeeRoleInstance?.id}" />
					<g:link class="edit" action="edit" id="${employeeRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

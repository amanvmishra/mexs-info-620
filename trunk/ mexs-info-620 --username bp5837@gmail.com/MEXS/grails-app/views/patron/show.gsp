
<%@ page import="mexs.Patron" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patron.label', default: 'Patron')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patron" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patron" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patron">
			
				<g:if test="${patronInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="patron.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${patronInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="patron.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${patronInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="patron.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${patronInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="patron.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${patronInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.passportNumber}">
				<li class="fieldcontain">
					<span id="passportNumber-label" class="property-label"><g:message code="patron.passportNumber.label" default="Passport Number" /></span>
					
						<span class="property-value" aria-labelledby="passportNumber-label"><g:fieldValue bean="${patronInstance}" field="passportNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.patronID}">
				<li class="fieldcontain">
					<span id="patronID-label" class="property-label"><g:message code="patron.patronID.label" default="Patron ID" /></span>
					
						<span class="property-value" aria-labelledby="patronID-label"><g:fieldValue bean="${patronInstance}" field="patronID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patronInstance?.transactions}">
				<li class="fieldcontain">
					<span id="transactions-label" class="property-label"><g:message code="patron.transactions.label" default="Transactions" /></span>
					
						<g:each in="${patronInstance.transactions}" var="t">
						<span class="property-value" aria-labelledby="transactions-label"><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${patronInstance?.id}" />
					<g:link class="edit" action="edit" id="${patronInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

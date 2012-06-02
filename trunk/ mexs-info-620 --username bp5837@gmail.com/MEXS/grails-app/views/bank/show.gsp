
<%@ page import="mexs.Bank" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bank" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bank" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bank">
			
				<g:if test="${bankInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bank.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bankInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="bank.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${bankInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="bank.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${bankInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="bank.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${bankInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.bankID}">
				<li class="fieldcontain">
					<span id="bankID-label" class="property-label"><g:message code="bank.bankID.label" default="Bank ID" /></span>
					
						<span class="property-value" aria-labelledby="bankID-label"><g:fieldValue bean="${bankInstance}" field="bankID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.terminals}">
				<li class="fieldcontain">
					<span id="terminals-label" class="property-label"><g:message code="bank.terminals.label" default="Terminals" /></span>
					
						<g:each in="${bankInstance.terminals}" var="t">
						<span class="property-value" aria-labelledby="terminals-label"><g:link controller="terminal" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bankInstance?.id}" />
					<g:link class="edit" action="edit" id="${bankInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="mexs.Terminal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'terminal.label', default: 'Terminal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-terminal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-terminal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list terminal">
			
				<g:if test="${terminalInstance?.bankID}">
				<li class="fieldcontain">
					<span id="bankID-label" class="property-label"><g:message code="terminal.bankID.label" default="Bank ID" /></span>
					
						<span class="property-value" aria-labelledby="bankID-label"><g:link controller="bank" action="show" id="${terminalInstance?.bankID?.id}">${terminalInstance?.bankID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${terminalInstance?.terminalID}">
				<li class="fieldcontain">
					<span id="terminalID-label" class="property-label"><g:message code="terminal.terminalID.label" default="Terminal ID" /></span>
					
						<span class="property-value" aria-labelledby="terminalID-label"><g:fieldValue bean="${terminalInstance}" field="terminalID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${terminalInstance?.transactions}">
				<li class="fieldcontain">
					<span id="transactions-label" class="property-label"><g:message code="terminal.transactions.label" default="Transactions" /></span>
					
						<g:each in="${terminalInstance.transactions}" var="t">
						<span class="property-value" aria-labelledby="transactions-label"><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${terminalInstance?.id}" />
					<g:link class="edit" action="edit" id="${terminalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

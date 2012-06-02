
<%@ page import="mexs.Transaction" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transaction">
			
				<g:if test="${transactionInstance?.commissionRate}">
				<li class="fieldcontain">
					<span id="commissionRate-label" class="property-label"><g:message code="transaction.commissionRate.label" default="Commission Rate" /></span>
					
						<span class="property-value" aria-labelledby="commissionRate-label"><g:fieldValue bean="${transactionInstance}" field="commissionRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.dateOfTransaction}">
				<li class="fieldcontain">
					<span id="dateOfTransaction-label" class="property-label"><g:message code="transaction.dateOfTransaction.label" default="Date Of Transaction" /></span>
					
						<span class="property-value" aria-labelledby="dateOfTransaction-label"><g:formatDate date="${transactionInstance?.dateOfTransaction}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.employeeID}">
				<li class="fieldcontain">
					<span id="employeeID-label" class="property-label"><g:message code="transaction.employeeID.label" default="Employee ID" /></span>
					
						<span class="property-value" aria-labelledby="employeeID-label"><g:link controller="employee" action="show" id="${transactionInstance?.employeeID?.id}">${transactionInstance?.employeeID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.patronID}">
				<li class="fieldcontain">
					<span id="patronID-label" class="property-label"><g:message code="transaction.patronID.label" default="Patron ID" /></span>
					
						<span class="property-value" aria-labelledby="patronID-label"><g:link controller="patron" action="show" id="${transactionInstance?.patronID?.id}">${transactionInstance?.patronID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.sourceAmount}">
				<li class="fieldcontain">
					<span id="sourceAmount-label" class="property-label"><g:message code="transaction.sourceAmount.label" default="Source Amount" /></span>
					
						<span class="property-value" aria-labelledby="sourceAmount-label"><g:fieldValue bean="${transactionInstance}" field="sourceAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.sourceCurrencyID}">
				<li class="fieldcontain">
					<span id="sourceCurrencyID-label" class="property-label"><g:message code="transaction.sourceCurrencyID.label" default="Source Currency ID" /></span>
					
						<span class="property-value" aria-labelledby="sourceCurrencyID-label"><g:link controller="currency" action="show" id="${transactionInstance?.sourceCurrencyID?.id}">${transactionInstance?.sourceCurrencyID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.targetCurrencyID}">
				<li class="fieldcontain">
					<span id="targetCurrencyID-label" class="property-label"><g:message code="transaction.targetCurrencyID.label" default="Target Currency ID" /></span>
					
						<span class="property-value" aria-labelledby="targetCurrencyID-label"><g:link controller="currency" action="show" id="${transactionInstance?.targetCurrencyID?.id}">${transactionInstance?.targetCurrencyID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.terminalID}">
				<li class="fieldcontain">
					<span id="terminalID-label" class="property-label"><g:message code="transaction.terminalID.label" default="Terminal ID" /></span>
					
						<span class="property-value" aria-labelledby="terminalID-label"><g:link controller="terminal" action="show" id="${transactionInstance?.terminalID?.id}">${transactionInstance?.terminalID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.totalTargetAmount}">
				<li class="fieldcontain">
					<span id="totalTargetAmount-label" class="property-label"><g:message code="transaction.totalTargetAmount.label" default="Total Target Amount" /></span>
					
						<span class="property-value" aria-labelledby="totalTargetAmount-label"><g:fieldValue bean="${transactionInstance}" field="totalTargetAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.totalTransactionAmount}">
				<li class="fieldcontain">
					<span id="totalTransactionAmount-label" class="property-label"><g:message code="transaction.totalTransactionAmount.label" default="Total Transaction Amount" /></span>
					
						<span class="property-value" aria-labelledby="totalTransactionAmount-label"><g:fieldValue bean="${transactionInstance}" field="totalTransactionAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.transactionID}">
				<li class="fieldcontain">
					<span id="transactionID-label" class="property-label"><g:message code="transaction.transactionID.label" default="Transaction ID" /></span>
					
						<span class="property-value" aria-labelledby="transactionID-label"><g:fieldValue bean="${transactionInstance}" field="transactionID"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${transactionInstance?.id}" />
					<g:link class="edit" action="edit" id="${transactionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

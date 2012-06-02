
<%@ page import="mexs.Currency" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-currency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-currency" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list currency">
			
				<g:if test="${currencyInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="currency.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${currencyInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.conversionRate}">
				<li class="fieldcontain">
					<span id="conversionRate-label" class="property-label"><g:message code="currency.conversionRate.label" default="Conversion Rate" /></span>
					
						<span class="property-value" aria-labelledby="conversionRate-label"><g:fieldValue bean="${currencyInstance}" field="conversionRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.countryCode}">
				<li class="fieldcontain">
					<span id="countryCode-label" class="property-label"><g:message code="currency.countryCode.label" default="Country Code" /></span>
					
						<span class="property-value" aria-labelledby="countryCode-label"><g:fieldValue bean="${currencyInstance}" field="countryCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.currencyID}">
				<li class="fieldcontain">
					<span id="currencyID-label" class="property-label"><g:message code="currency.currencyID.label" default="Currency ID" /></span>
					
						<span class="property-value" aria-labelledby="currencyID-label"><g:fieldValue bean="${currencyInstance}" field="currencyID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.sourceTransactions}">
				<li class="fieldcontain">
					<span id="sourceTransactions-label" class="property-label"><g:message code="currency.sourceTransactions.label" default="Source Transactions" /></span>
					
						<g:each in="${currencyInstance.sourceTransactions}" var="s">
						<span class="property-value" aria-labelledby="sourceTransactions-label"><g:link controller="transaction" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.targetTransactions}">
				<li class="fieldcontain">
					<span id="targetTransactions-label" class="property-label"><g:message code="currency.targetTransactions.label" default="Target Transactions" /></span>
					
						<g:each in="${currencyInstance.targetTransactions}" var="t">
						<span class="property-value" aria-labelledby="targetTransactions-label"><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${currencyInstance?.id}" />
					<g:link class="edit" action="edit" id="${currencyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

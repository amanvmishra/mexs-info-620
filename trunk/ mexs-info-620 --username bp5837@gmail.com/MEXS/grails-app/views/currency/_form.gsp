<%@ page import="mexs.Currency" %>



<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="currency.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" required="" value="${fieldValue(bean: currencyInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'conversionRate', 'error')} required">
	<label for="conversionRate">
		<g:message code="currency.conversionRate.label" default="Conversion Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="conversionRate" required="" value="${fieldValue(bean: currencyInstance, field: 'conversionRate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'countryCode', 'error')} ">
	<label for="countryCode">
		<g:message code="currency.countryCode.label" default="Country Code" />
		
	</label>
	<g:textField name="countryCode" value="${currencyInstance?.countryCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'currencyID', 'error')} required">
	<label for="currencyID">
		<g:message code="currency.currencyID.label" default="Currency ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="currencyID" required="" value="${fieldValue(bean: currencyInstance, field: 'currencyID')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'sourceTransactions', 'error')} ">
	<label for="sourceTransactions">
		<g:message code="currency.sourceTransactions.label" default="Source Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${currencyInstance?.sourceTransactions?}" var="s">
    <li><g:link controller="transaction" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['currency.id': currencyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'targetTransactions', 'error')} ">
	<label for="targetTransactions">
		<g:message code="currency.targetTransactions.label" default="Target Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${currencyInstance?.targetTransactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['currency.id': currencyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>


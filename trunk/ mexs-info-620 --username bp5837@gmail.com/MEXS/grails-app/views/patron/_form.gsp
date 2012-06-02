<%@ page import="mexs.Patron" %>



<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="patron.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${patronInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="patron.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${patronInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="patron.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${patronInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="patron.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${patronInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'passportNumber', 'error')} required">
	<label for="passportNumber">
		<g:message code="patron.passportNumber.label" default="Passport Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="passportNumber" required="" value="${fieldValue(bean: patronInstance, field: 'passportNumber')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'patronID', 'error')} required">
	<label for="patronID">
		<g:message code="patron.patronID.label" default="Patron ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="patronID" required="" value="${fieldValue(bean: patronInstance, field: 'patronID')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patronInstance, field: 'transactions', 'error')} ">
	<label for="transactions">
		<g:message code="patron.transactions.label" default="Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${patronInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['patron.id': patronInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>


<%@ page import="mexs.Terminal" %>



<div class="fieldcontain ${hasErrors(bean: terminalInstance, field: 'bankID', 'error')} required">
	<label for="bankID">
		<g:message code="terminal.bankID.label" default="Bank ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bankID" name="bankID.id" from="${mexs.Bank.list()}" optionKey="id" required="" value="${terminalInstance?.bankID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: terminalInstance, field: 'terminalID', 'error')} required">
	<label for="terminalID">
		<g:message code="terminal.terminalID.label" default="Terminal ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="terminalID" required="" value="${fieldValue(bean: terminalInstance, field: 'terminalID')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: terminalInstance, field: 'transactions', 'error')} ">
	<label for="transactions">
		<g:message code="terminal.transactions.label" default="Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${terminalInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['terminal.id': terminalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>


<%@ page import="mexs.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'commissionRate', 'error')} required">
	<label for="commissionRate">
		<g:message code="transaction.commissionRate.label" default="Commission Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="commissionRate" required="" value="${fieldValue(bean: transactionInstance, field: 'commissionRate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'dateOfTransaction', 'error')} required">
	<label for="dateOfTransaction">
		<g:message code="transaction.dateOfTransaction.label" default="Date Of Transaction" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfTransaction" precision="day"  value="${transactionInstance?.dateOfTransaction}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'employeeID', 'error')} required">
	<label for="employeeID">
		<g:message code="transaction.employeeID.label" default="Employee ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employeeID" name="employeeID.id" from="${mexs.Employee.list()}" optionKey="id" required="" value="${transactionInstance?.employeeID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'patronID', 'error')} required">
	<label for="patronID">
		<g:message code="transaction.patronID.label" default="Patron ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="patronID" name="patronID.id" from="${mexs.Patron.list()}" optionKey="id" required="" value="${transactionInstance?.patronID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sourceAmount', 'error')} required">
	<label for="sourceAmount">
		<g:message code="transaction.sourceAmount.label" default="Source Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sourceAmount" required="" value="${fieldValue(bean: transactionInstance, field: 'sourceAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sourceCurrencyID', 'error')} required">
	<label for="sourceCurrencyID">
		<g:message code="transaction.sourceCurrencyID.label" default="Source Currency ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sourceCurrencyID" name="sourceCurrencyID.id" from="${mexs.Currency.list()}" optionKey="id" required="" value="${transactionInstance?.sourceCurrencyID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'targetCurrencyID', 'error')} required">
	<label for="targetCurrencyID">
		<g:message code="transaction.targetCurrencyID.label" default="Target Currency ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="targetCurrencyID" name="targetCurrencyID.id" from="${mexs.Currency.list()}" optionKey="id" required="" value="${transactionInstance?.targetCurrencyID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'terminalID', 'error')} required">
	<label for="terminalID">
		<g:message code="transaction.terminalID.label" default="Terminal ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="terminalID" name="terminalID.id" from="${mexs.Terminal.list()}" optionKey="id" required="" value="${transactionInstance?.terminalID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'totalTargetAmount', 'error')} required">
	<label for="totalTargetAmount">
		<g:message code="transaction.totalTargetAmount.label" default="Total Target Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalTargetAmount" required="" value="${fieldValue(bean: transactionInstance, field: 'totalTargetAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'totalTransactionAmount', 'error')} required">
	<label for="totalTransactionAmount">
		<g:message code="transaction.totalTransactionAmount.label" default="Total Transaction Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalTransactionAmount" required="" value="${fieldValue(bean: transactionInstance, field: 'totalTransactionAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'transactionID', 'error')} required">
	<label for="transactionID">
		<g:message code="transaction.transactionID.label" default="Transaction ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="transactionID" required="" value="${fieldValue(bean: transactionInstance, field: 'transactionID')}"/>
</div>


<%@ page import="mexs.Bank" %>



<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="bank.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${bankInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="bank.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${bankInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="bank.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${bankInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="bank.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${bankInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'bankID', 'error')} required">
	<label for="bankID">
		<g:message code="bank.bankID.label" default="Bank ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="bankID" required="" value="${fieldValue(bean: bankInstance, field: 'bankID')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'terminals', 'error')} ">
	<label for="terminals">
		<g:message code="bank.terminals.label" default="Terminals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bankInstance?.terminals?}" var="t">
    <li><g:link controller="terminal" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="terminal" action="create" params="['bank.id': bankInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'terminal.label', default: 'Terminal')])}</g:link>
</li>
</ul>

</div>


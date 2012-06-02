
<%@ page import="mexs.Transaction" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commissionRate" title="${message(code: 'transaction.commissionRate.label', default: 'Commission Rate')}" />
					
						<g:sortableColumn property="dateOfTransaction" title="${message(code: 'transaction.dateOfTransaction.label', default: 'Date Of Transaction')}" />
					
						<th><g:message code="transaction.employeeID.label" default="Employee ID" /></th>
					
						<th><g:message code="transaction.patronID.label" default="Patron ID" /></th>
					
						<g:sortableColumn property="sourceAmount" title="${message(code: 'transaction.sourceAmount.label', default: 'Source Amount')}" />
					
						<th><g:message code="transaction.sourceCurrencyID.label" default="Source Currency ID" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "commissionRate")}</g:link></td>
					
						<td><g:formatDate date="${transactionInstance.dateOfTransaction}" /></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "employeeID")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "patronID")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "sourceAmount")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "sourceCurrencyID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transactionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

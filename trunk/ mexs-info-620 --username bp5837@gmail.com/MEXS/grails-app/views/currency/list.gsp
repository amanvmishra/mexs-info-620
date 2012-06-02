
<%@ page import="mexs.Currency" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-currency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-currency" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'currency.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="conversionRate" title="${message(code: 'currency.conversionRate.label', default: 'Conversion Rate')}" />
					
						<g:sortableColumn property="countryCode" title="${message(code: 'currency.countryCode.label', default: 'Country Code')}" />
					
						<g:sortableColumn property="currencyID" title="${message(code: 'currency.currencyID.label', default: 'Currency ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${currencyInstanceList}" status="i" var="currencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${currencyInstance.id}">${fieldValue(bean: currencyInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: currencyInstance, field: "conversionRate")}</td>
					
						<td>${fieldValue(bean: currencyInstance, field: "countryCode")}</td>
					
						<td>${fieldValue(bean: currencyInstance, field: "currencyID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${currencyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

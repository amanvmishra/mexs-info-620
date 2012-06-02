
<%@ page import="mexs.Patron" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patron.label', default: 'Patron')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patron" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-patron" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="country" title="${message(code: 'patron.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'patron.dateOfBirth.label', default: 'Date Of Birth')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'patron.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'patron.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="passportNumber" title="${message(code: 'patron.passportNumber.label', default: 'Passport Number')}" />
					
						<g:sortableColumn property="patronID" title="${message(code: 'patron.patronID.label', default: 'Patron ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patronInstanceList}" status="i" var="patronInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patronInstance.id}">${fieldValue(bean: patronInstance, field: "country")}</g:link></td>
					
						<td><g:formatDate date="${patronInstance.dateOfBirth}" /></td>
					
						<td>${fieldValue(bean: patronInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: patronInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: patronInstance, field: "passportNumber")}</td>
					
						<td>${fieldValue(bean: patronInstance, field: "patronID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patronInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

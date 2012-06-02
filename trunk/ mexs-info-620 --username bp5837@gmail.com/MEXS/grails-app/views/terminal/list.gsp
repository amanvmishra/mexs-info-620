
<%@ page import="mexs.Terminal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'terminal.label', default: 'Terminal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-terminal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-terminal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="terminal.bankID.label" default="Bank ID" /></th>
					
						<g:sortableColumn property="terminalID" title="${message(code: 'terminal.terminalID.label', default: 'Terminal ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${terminalInstanceList}" status="i" var="terminalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${terminalInstance.id}">${fieldValue(bean: terminalInstance, field: "bankID")}</g:link></td>
					
						<td>${fieldValue(bean: terminalInstance, field: "terminalID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${terminalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

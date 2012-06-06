
<%@ page import="mexs.EmployeeRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employeeRole.label', default: 'EmployeeRole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'employeeRole.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="uid" title="${message(code: 'employeeRole.uid.label', default: 'Uid')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${employeeRoleInstanceList}" status="i" var="employeeRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${employeeRoleInstance.id}">${fieldValue(bean: employeeRoleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: employeeRoleInstance, field: "uid")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${employeeRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

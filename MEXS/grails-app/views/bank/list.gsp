
<%@ page import="mexs.Bank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bank.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'bank.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'bank.address.label', default: 'Address')}" />
                        
                            <g:sortableColumn property="phone" title="${message(code: 'bank.phone.label', default: 'Phone')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'bank.url.label', default: 'Url')}" />
                        
                            <g:sortableColumn property="bankID" title="${message(code: 'bank.bankID.label', default: 'Bank ID')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bankInstanceList}" status="i" var="bankInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bankInstance.id}">${fieldValue(bean: bankInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bankInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bankInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: bankInstance, field: "phone")}</td>
                        
                            <td>${fieldValue(bean: bankInstance, field: "url")}</td>
                        
                            <td>${fieldValue(bean: bankInstance, field: "bankID")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bankInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

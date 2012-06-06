
<%@ page import="mexs.Currency" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'currency.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="buyingRate" title="${message(code: 'currency.buyingRate.label', default: 'Buying Rate')}" />
                        
                            <g:sortableColumn property="countryName" title="${message(code: 'currency.countryName.label', default: 'Country Name')}" />
                        
                            <g:sortableColumn property="currencyID" title="${message(code: 'currency.currencyID.label', default: 'Currency ID')}" />
                        
                            <g:sortableColumn property="currencyName" title="${message(code: 'currency.currencyName.label', default: 'Currency Name')}" />
                        
                            <g:sortableColumn property="currencySymbol" title="${message(code: 'currency.currencySymbol.label', default: 'Currency Symbol')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${currencyInstanceList}" status="i" var="currencyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${currencyInstance.id}">${fieldValue(bean: currencyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: currencyInstance, field: "buyingRate")}</td>
                        
                            <td>${fieldValue(bean: currencyInstance, field: "countryName")}</td>
                        
                            <td>${fieldValue(bean: currencyInstance, field: "currencyID")}</td>
                        
                            <td>${fieldValue(bean: currencyInstance, field: "currencyName")}</td>
                        
                            <td>${fieldValue(bean: currencyInstance, field: "currencySymbol")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${currencyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

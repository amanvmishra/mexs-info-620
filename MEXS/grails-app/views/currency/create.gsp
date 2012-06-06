

<%@ page import="mexs.Currency" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${currencyInstance}">
            <div class="errors">
                <g:renderErrors bean="${currencyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="buyingRate"><g:message code="currency.buyingRate.label" default="Buying Rate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'buyingRate', 'errors')}">
                                    <g:textField name="buyingRate" value="${fieldValue(bean: currencyInstance, field: 'buyingRate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countryName"><g:message code="currency.countryName.label" default="Country Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'countryName', 'errors')}">
                                    <g:textField name="countryName" value="${currencyInstance?.countryName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currencyID"><g:message code="currency.currencyID.label" default="Currency ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'currencyID', 'errors')}">
                                    <g:textField name="currencyID" value="${fieldValue(bean: currencyInstance, field: 'currencyID')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currencyName"><g:message code="currency.currencyName.label" default="Currency Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'currencyName', 'errors')}">
                                    <g:textField name="currencyName" value="${currencyInstance?.currencyName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="currencySymbol"><g:message code="currency.currencySymbol.label" default="Currency Symbol" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'currencySymbol', 'errors')}">
                                    <g:textField name="currencySymbol" value="${currencyInstance?.currencySymbol}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sellingRate"><g:message code="currency.sellingRate.label" default="Selling Rate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: currencyInstance, field: 'sellingRate', 'errors')}">
                                    <g:textField name="sellingRate" value="${fieldValue(bean: currencyInstance, field: 'sellingRate')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

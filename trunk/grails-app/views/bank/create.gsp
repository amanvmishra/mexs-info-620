

<%@ page import="mexs.Bank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
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
            <g:hasErrors bean="${bankInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="bank.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bankInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address"><g:message code="bank.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${bankInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="bank.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${bankInstance?.phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="bank.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${bankInstance?.url}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bankID"><g:message code="bank.bankID.label" default="Bank ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'bankID', 'errors')}">
                                    <g:textField name="bankID" value="${fieldValue(bean: bankInstance, field: 'bankID')}" />
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

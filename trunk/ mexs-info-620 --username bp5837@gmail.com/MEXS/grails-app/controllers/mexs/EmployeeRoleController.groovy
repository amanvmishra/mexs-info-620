package mexs

import org.springframework.dao.DataIntegrityViolationException

class EmployeeRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [employeeRoleInstanceList: EmployeeRole.list(params), employeeRoleInstanceTotal: EmployeeRole.count()]
    }

    def create() {
        [employeeRoleInstance: new EmployeeRole(params)]
    }

    def save() {
        def employeeRoleInstance = new EmployeeRole(params)
        if (!employeeRoleInstance.save(flush: true)) {
            render(view: "create", model: [employeeRoleInstance: employeeRoleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), employeeRoleInstance.id])
        redirect(action: "show", id: employeeRoleInstance.id)
    }

    def show() {
        def employeeRoleInstance = EmployeeRole.get(params.id)
        if (!employeeRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "list")
            return
        }

        [employeeRoleInstance: employeeRoleInstance]
    }

    def edit() {
        def employeeRoleInstance = EmployeeRole.get(params.id)
        if (!employeeRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "list")
            return
        }

        [employeeRoleInstance: employeeRoleInstance]
    }

    def update() {
        def employeeRoleInstance = EmployeeRole.get(params.id)
        if (!employeeRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (employeeRoleInstance.version > version) {
                employeeRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employeeRole.label', default: 'EmployeeRole')] as Object[],
                          "Another user has updated this EmployeeRole while you were editing")
                render(view: "edit", model: [employeeRoleInstance: employeeRoleInstance])
                return
            }
        }

        employeeRoleInstance.properties = params

        if (!employeeRoleInstance.save(flush: true)) {
            render(view: "edit", model: [employeeRoleInstance: employeeRoleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), employeeRoleInstance.id])
        redirect(action: "show", id: employeeRoleInstance.id)
    }

    def delete() {
        def employeeRoleInstance = EmployeeRole.get(params.id)
        if (!employeeRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "list")
            return
        }

        try {
            employeeRoleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

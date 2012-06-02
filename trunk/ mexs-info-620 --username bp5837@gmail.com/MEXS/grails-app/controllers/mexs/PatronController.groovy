package mexs

import org.springframework.dao.DataIntegrityViolationException

class PatronController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [patronInstanceList: Patron.list(params), patronInstanceTotal: Patron.count()]
    }

    def create() {
        [patronInstance: new Patron(params)]
    }

    def save() {
        def patronInstance = new Patron(params)
        if (!patronInstance.save(flush: true)) {
            render(view: "create", model: [patronInstance: patronInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'patron.label', default: 'Patron'), patronInstance.id])
        redirect(action: "show", id: patronInstance.id)
    }

    def show() {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "list")
            return
        }

        [patronInstance: patronInstance]
    }

    def edit() {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "list")
            return
        }

        [patronInstance: patronInstance]
    }

    def update() {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (patronInstance.version > version) {
                patronInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patron.label', default: 'Patron')] as Object[],
                          "Another user has updated this Patron while you were editing")
                render(view: "edit", model: [patronInstance: patronInstance])
                return
            }
        }

        patronInstance.properties = params

        if (!patronInstance.save(flush: true)) {
            render(view: "edit", model: [patronInstance: patronInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'patron.label', default: 'Patron'), patronInstance.id])
        redirect(action: "show", id: patronInstance.id)
    }

    def delete() {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "list")
            return
        }

        try {
            patronInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

package mexs

class PatronController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [patronInstanceList: Patron.list(params), patronInstanceTotal: Patron.count()]
    }

    def create = {
        def patronInstance = new Patron()
        patronInstance.properties = params
        return [patronInstance: patronInstance]
    }

    def save = {
        def patronInstance = new Patron(params)
        if (patronInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'patron.label', default: 'Patron'), patronInstance.id])}"
            redirect(action: "show", id: patronInstance.id)
        }
        else {
            render(view: "create", model: [patronInstance: patronInstance])
        }
    }

    def show = {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
            redirect(action: "list")
        }
        else {
            [patronInstance: patronInstance]
        }
    }

    def edit = {
        def patronInstance = Patron.get(params.id)
        if (!patronInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [patronInstance: patronInstance]
        }
    }

    def update = {
        def patronInstance = Patron.get(params.id)
        if (patronInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (patronInstance.version > version) {
                    
                    patronInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'patron.label', default: 'Patron')] as Object[], "Another user has updated this Patron while you were editing")
                    render(view: "edit", model: [patronInstance: patronInstance])
                    return
                }
            }
            patronInstance.properties = params
            if (!patronInstance.hasErrors() && patronInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'patron.label', default: 'Patron'), patronInstance.id])}"
                redirect(action: "show", id: patronInstance.id)
            }
            else {
                render(view: "edit", model: [patronInstance: patronInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def patronInstance = Patron.get(params.id)
        if (patronInstance) {
            try {
                patronInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'patron.label', default: 'Patron'), params.id])}"
            redirect(action: "list")
        }
    }
}

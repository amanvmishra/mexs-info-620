package mexs

class TerminalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [terminalInstanceList: Terminal.list(params), terminalInstanceTotal: Terminal.count()]
    }

    def create = {
        def terminalInstance = new Terminal()
        terminalInstance.properties = params
        return [terminalInstance: terminalInstance]
    }

    def save = {
        def terminalInstance = new Terminal(params)
        if (terminalInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'terminal.label', default: 'Terminal'), terminalInstance.id])}"
            redirect(action: "show", id: terminalInstance.id)
        }
        else {
            render(view: "create", model: [terminalInstance: terminalInstance])
        }
    }

    def show = {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
            redirect(action: "list")
        }
        else {
            [terminalInstance: terminalInstance]
        }
    }

    def edit = {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [terminalInstance: terminalInstance]
        }
    }

    def update = {
        def terminalInstance = Terminal.get(params.id)
        if (terminalInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (terminalInstance.version > version) {
                    
                    terminalInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'terminal.label', default: 'Terminal')] as Object[], "Another user has updated this Terminal while you were editing")
                    render(view: "edit", model: [terminalInstance: terminalInstance])
                    return
                }
            }
            terminalInstance.properties = params
            if (!terminalInstance.hasErrors() && terminalInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'terminal.label', default: 'Terminal'), terminalInstance.id])}"
                redirect(action: "show", id: terminalInstance.id)
            }
            else {
                render(view: "edit", model: [terminalInstance: terminalInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def terminalInstance = Terminal.get(params.id)
        if (terminalInstance) {
            try {
                terminalInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])}"
            redirect(action: "list")
        }
    }
}

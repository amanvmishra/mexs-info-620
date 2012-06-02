package mexs

import org.springframework.dao.DataIntegrityViolationException

class TerminalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [terminalInstanceList: Terminal.list(params), terminalInstanceTotal: Terminal.count()]
    }

    def create() {
        [terminalInstance: new Terminal(params)]
    }

    def save() {
        def terminalInstance = new Terminal(params)
        if (!terminalInstance.save(flush: true)) {
            render(view: "create", model: [terminalInstance: terminalInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'terminal.label', default: 'Terminal'), terminalInstance.id])
        redirect(action: "show", id: terminalInstance.id)
    }

    def show() {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "list")
            return
        }

        [terminalInstance: terminalInstance]
    }

    def edit() {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "list")
            return
        }

        [terminalInstance: terminalInstance]
    }

    def update() {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (terminalInstance.version > version) {
                terminalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'terminal.label', default: 'Terminal')] as Object[],
                          "Another user has updated this Terminal while you were editing")
                render(view: "edit", model: [terminalInstance: terminalInstance])
                return
            }
        }

        terminalInstance.properties = params

        if (!terminalInstance.save(flush: true)) {
            render(view: "edit", model: [terminalInstance: terminalInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'terminal.label', default: 'Terminal'), terminalInstance.id])
        redirect(action: "show", id: terminalInstance.id)
    }

    def delete() {
        def terminalInstance = Terminal.get(params.id)
        if (!terminalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            terminalInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'terminal.label', default: 'Terminal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

package mexs



import org.junit.*
import grails.test.mixin.*

@TestFor(TerminalController)
@Mock(Terminal)
class TerminalControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/terminal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.terminalInstanceList.size() == 0
        assert model.terminalInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.terminalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.terminalInstance != null
        assert view == '/terminal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/terminal/show/1'
        assert controller.flash.message != null
        assert Terminal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/terminal/list'


        populateValidParams(params)
        def terminal = new Terminal(params)

        assert terminal.save() != null

        params.id = terminal.id

        def model = controller.show()

        assert model.terminalInstance == terminal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/terminal/list'


        populateValidParams(params)
        def terminal = new Terminal(params)

        assert terminal.save() != null

        params.id = terminal.id

        def model = controller.edit()

        assert model.terminalInstance == terminal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/terminal/list'

        response.reset()


        populateValidParams(params)
        def terminal = new Terminal(params)

        assert terminal.save() != null

        // test invalid parameters in update
        params.id = terminal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/terminal/edit"
        assert model.terminalInstance != null

        terminal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/terminal/show/$terminal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        terminal.clearErrors()

        populateValidParams(params)
        params.id = terminal.id
        params.version = -1
        controller.update()

        assert view == "/terminal/edit"
        assert model.terminalInstance != null
        assert model.terminalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/terminal/list'

        response.reset()

        populateValidParams(params)
        def terminal = new Terminal(params)

        assert terminal.save() != null
        assert Terminal.count() == 1

        params.id = terminal.id

        controller.delete()

        assert Terminal.count() == 0
        assert Terminal.get(terminal.id) == null
        assert response.redirectedUrl == '/terminal/list'
    }
}

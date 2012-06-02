package mexs



import org.junit.*
import grails.test.mixin.*

@TestFor(PatronController)
@Mock(Patron)
class PatronControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/patron/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.patronInstanceList.size() == 0
        assert model.patronInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.patronInstance != null
    }

    void testSave() {
        controller.save()

        assert model.patronInstance != null
        assert view == '/patron/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/patron/show/1'
        assert controller.flash.message != null
        assert Patron.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/patron/list'


        populateValidParams(params)
        def patron = new Patron(params)

        assert patron.save() != null

        params.id = patron.id

        def model = controller.show()

        assert model.patronInstance == patron
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/patron/list'


        populateValidParams(params)
        def patron = new Patron(params)

        assert patron.save() != null

        params.id = patron.id

        def model = controller.edit()

        assert model.patronInstance == patron
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/patron/list'

        response.reset()


        populateValidParams(params)
        def patron = new Patron(params)

        assert patron.save() != null

        // test invalid parameters in update
        params.id = patron.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/patron/edit"
        assert model.patronInstance != null

        patron.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/patron/show/$patron.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        patron.clearErrors()

        populateValidParams(params)
        params.id = patron.id
        params.version = -1
        controller.update()

        assert view == "/patron/edit"
        assert model.patronInstance != null
        assert model.patronInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/patron/list'

        response.reset()

        populateValidParams(params)
        def patron = new Patron(params)

        assert patron.save() != null
        assert Patron.count() == 1

        params.id = patron.id

        controller.delete()

        assert Patron.count() == 0
        assert Patron.get(patron.id) == null
        assert response.redirectedUrl == '/patron/list'
    }
}

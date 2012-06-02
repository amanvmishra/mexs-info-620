package mexs



import org.junit.*
import grails.test.mixin.*

@TestFor(EmployeeRoleController)
@Mock(EmployeeRole)
class EmployeeRoleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/employeeRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.employeeRoleInstanceList.size() == 0
        assert model.employeeRoleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.employeeRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.employeeRoleInstance != null
        assert view == '/employeeRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/employeeRole/show/1'
        assert controller.flash.message != null
        assert EmployeeRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeRole/list'


        populateValidParams(params)
        def employeeRole = new EmployeeRole(params)

        assert employeeRole.save() != null

        params.id = employeeRole.id

        def model = controller.show()

        assert model.employeeRoleInstance == employeeRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeRole/list'


        populateValidParams(params)
        def employeeRole = new EmployeeRole(params)

        assert employeeRole.save() != null

        params.id = employeeRole.id

        def model = controller.edit()

        assert model.employeeRoleInstance == employeeRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeRole/list'

        response.reset()


        populateValidParams(params)
        def employeeRole = new EmployeeRole(params)

        assert employeeRole.save() != null

        // test invalid parameters in update
        params.id = employeeRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/employeeRole/edit"
        assert model.employeeRoleInstance != null

        employeeRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/employeeRole/show/$employeeRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        employeeRole.clearErrors()

        populateValidParams(params)
        params.id = employeeRole.id
        params.version = -1
        controller.update()

        assert view == "/employeeRole/edit"
        assert model.employeeRoleInstance != null
        assert model.employeeRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/employeeRole/list'

        response.reset()

        populateValidParams(params)
        def employeeRole = new EmployeeRole(params)

        assert employeeRole.save() != null
        assert EmployeeRole.count() == 1

        params.id = employeeRole.id

        controller.delete()

        assert EmployeeRole.count() == 0
        assert EmployeeRole.get(employeeRole.id) == null
        assert response.redirectedUrl == '/employeeRole/list'
    }
}

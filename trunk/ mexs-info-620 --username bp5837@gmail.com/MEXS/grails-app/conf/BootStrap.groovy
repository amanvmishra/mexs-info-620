import mexs.LoadDbService

class BootStrap {

	def init = { servletContext ->
		def dbs = new LoadDbService()

		dbs.rootDir = servletContext.getRealPath("/data/")

		println "loading initial data... " + dbs.rootDir

		dbs.load()
	}
	def destroy = {
	}
}

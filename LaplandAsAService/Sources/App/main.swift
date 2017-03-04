import Vapor
import VaporMySQL

let drop = Droplet(preparations: [Resort.self], providers: [VaporMySQL.Provider.self])

let resortController = ResortController()

drop.resource("listResorts", resortController)
drop.resource("addResort", resortController)

drop.run()

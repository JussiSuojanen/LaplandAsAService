import Vapor
import VaporMySQL

let drop = Droplet(preparations: [Resort.self], providers: [VaporMySQL.Provider.self])

drop.run()


import Kitura
import Foundation
 

let router  = Router()

router.get("/", handler: helloWorldHandler)



func helloWorldHandler(request:RouterRequest,response:RouterResponse,next:()->()) {
    
    let dic = ["2": "B", "1": "A", "3": "C"]
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        response.send(data: jsonData)
        next()
      
    } catch {
        print(error.localizedDescription)
    }
    
   
}

Kitura.addHTTPServer(onPort: 8082, with: router)
Kitura.run()

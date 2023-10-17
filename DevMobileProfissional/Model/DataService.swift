import Foundation
import SwiftUI

class DataService {
    
    // Get from API/Database
    func getTipList(uid:String?) -> [String] {
        if(uid != nil){
            return ["Gorjetinha","Milho x10","Mais um mes inscrito! <3"]
        }
        else{
            return []
        }
    }
    
    // Get from API/Database
    func getTipstersList(uid:String?) -> [String]{
        if(uid != nil){
            return ["Bruno Thuma","Alanzoka","LVndmark"]
        }
        else{
            return []
        }
    }
}

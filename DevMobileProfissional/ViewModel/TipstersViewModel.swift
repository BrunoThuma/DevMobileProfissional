import Foundation
import SwiftUI

protocol TipstersViewModelProtocol {
    func getTipstersList(uid:String?)
}

class TipstersViewModel: TipstersViewModelProtocol, ObservableObject{
    
    var dataService:DataService
    @Published var tipsters: [String] = []
    
    init(dataService:DataService) {
        self.dataService = dataService
    }
        
    func getTipstersList(uid: String?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            [weak self] in
            self?.tipsters = self?.dataService.getTipstersList(uid: uid) ?? []
        })
    }
}

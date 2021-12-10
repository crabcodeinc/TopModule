//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___VARIABLE_AtomName___ViewModel: AtomViewModelProtocol {
    
    var sendToView = Sender<___VARIABLE_AtomName___Senses.ViewModelSense>()
    
    func sensor(iSense: ___VARIABLE_AtomName___Senses.ViewSense) {
//        switch iSense {
//        // From View
//        
//        // From Papa
//        
//        }
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
}

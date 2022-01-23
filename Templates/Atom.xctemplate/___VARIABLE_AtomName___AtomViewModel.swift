//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import TopModule

final class ___VARIABLE_AtomName___AtomViewModel: AtomViewModelProtocol {
    
    var sendToView = Sender<___VARIABLE_AtomName___AtomSenses.ViewModelSense>()
    
    func sensor(iSense: ___VARIABLE_AtomName___AtomSenses.ViewSense) {
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

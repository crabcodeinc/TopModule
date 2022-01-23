//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import TopModule

final class ___VARIABLE_NavigatorName___Navigator: GeneralNavigator {
    
    func begin() {
//        let vc = FabricClass.makeBlock(navigator: self)
//        next(vc)
    }
    
    func goToBlockTwo() {
//        let vc = FabricClass.makeBlock(navigator: self)
//        next(vc)
    }
    
    func backToBlockOne() {
        previous()
    }
}

extension ___VARIABLE_NavigatorName___Navigator: GeneralNavigatorProtocol {
    
    func navigatorSensor(iSense: ___VARIABLE_NavigatorName___Senses.FlowResult) {
        switch iSense {
        
        }
    }
}

final class ___VARIABLE_NavigatorName___Senses {
    enum FlowResult {
        
    }
}

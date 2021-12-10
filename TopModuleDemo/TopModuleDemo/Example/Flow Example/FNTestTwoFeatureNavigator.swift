//
//  FNTestTwoFeatureNavigator.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import UIKit
import TopModule

class FNTestTwoFeatureNavigator: GeneralNavigator {
    
    func begin() {
        let vc = OneFNBlockFabric.makeOneFNModul(navigator: self)
        next(vc)
    }
    
    func goToBlockTwo() {
        let vc = TwoFNBlockFabric.makeTwoFNModul(navigator: self)
        next(vc)
    }
    
    func backToBlockOne() {
        previous()
    }
    
}

extension FNTestTwoFeatureNavigator: GeneralNavigatorProtocol {
    
    func navigatorSensor(iSense: TestTwoFeatureSenses.FlowResult) {
        switch iSense {
        case .goToBlockTwo:
            goToBlockTwo()
        case .backToBlockOne:
            backToBlockOne()
        }
    }
}

final class TestTwoFeatureSenses {
    enum FlowResult {
        case goToBlockTwo
        case backToBlockOne
    }
}

//
//  TwoFNBlockFabric.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit

final class TwoFNBlockFabric {
    
    static func makeTwoFNModul(navigator: FNTestTwoFeatureNavigator) -> UIViewController {
        let atomicTwoFNView = TwoFNAtomView()
        let atomicTwoFNViewModel = TwoFNAtomViewModel()
        atomicTwoFNView.connect(with: atomicTwoFNViewModel)
        
        let blockTwoFNView = TwoFNBlockView(atomicView: atomicTwoFNView)
        let blockTwoFNViewModel = TwoFNBlockViewModel(atomicViewModel: atomicTwoFNViewModel)
        blockTwoFNView.connect(with: blockTwoFNViewModel)
        
        navigator.connectToFeature(with: blockTwoFNViewModel)
        
        return blockTwoFNView
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

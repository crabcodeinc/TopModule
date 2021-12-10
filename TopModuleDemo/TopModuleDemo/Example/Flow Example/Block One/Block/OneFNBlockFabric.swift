//
//  OneFNBlockFabric.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit

final class OneFNBlockFabric {
    
    static func makeOneFNModul(navigator: FNTestTwoFeatureNavigator) -> UIViewController {
        let atomicOneFNView = OneFNAtomView()
        let atomicOneFNViewModel = OneFNAtomViewModel()
        atomicOneFNView.connect(with: atomicOneFNViewModel)
        
        let blockOneFNView = OneFNBlockView(atomicView: atomicOneFNView)
        let blockOneFNViewModel = OneFNBlockViewModel(atomicViewModel: atomicOneFNViewModel)
        blockOneFNView.connect(with: blockOneFNViewModel)
        
        navigator.connectToFeature(with: blockOneFNViewModel)
        
        return blockOneFNView
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

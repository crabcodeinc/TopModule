//
//  OneFNBlockViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

final class OneFNBlockViewModel: AtomViewModelProtocol {
    
    var sendToView = Sender<OneFNBlockSenses.ViewModelSense>()
    
    // BlockViewModelProtocol
    var sendToNavigator = SenderNavigator<TestTwoFeatureSenses.FlowResult>()
    
    var atomicViewModel: OneFNAtomViewModel
    
    init(atomicViewModel: OneFNAtomViewModel) {
        self.atomicViewModel = atomicViewModel
    }
    
    func sensor(iSense: OneFNBlockSenses.ViewSense) {
        
    }
    
    func begin() {
        sendToView.express(.setupViews)
        connectToBlock(with: atomicViewModel)
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

extension OneFNBlockViewModel: BlockViewModelProtocol {
    
    func blockSensor(iSense: OneFNBlockSenses.BlockViewModelSense) {
        switch iSense {
        case .clickOnNextButton:
            sendToNavigator.express(.goToBlockTwo)
        }
    }

}

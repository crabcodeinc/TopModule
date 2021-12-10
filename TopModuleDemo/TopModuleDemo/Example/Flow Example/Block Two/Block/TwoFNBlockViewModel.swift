//
//  TwoFNBlockViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

final class TwoFNBlockViewModel: AtomViewModelProtocol {
    
    var sendToView = Sender<TwoFNBlockSenses.ViewModelSense>()
    
    // BlockViewModelProtocol
    var sendToNavigator = SenderNavigator<TestTwoFeatureSenses.FlowResult>()
    
    var atomicViewModel: TwoFNAtomViewModel
    
    init(atomicViewModel: TwoFNAtomViewModel) {
        self.atomicViewModel = atomicViewModel
    }
    
    func sensor(iSense: TwoFNBlockSenses.ViewSense) {
        
    }
    
    func begin() {
        sendToView.express(.setupViews)
        connectToBlock(with: atomicViewModel)
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

extension TwoFNBlockViewModel: BlockViewModelProtocol {
    
    func blockSensor(iSense: TwoFNBlockSenses.BlockViewModelSense) {
        switch iSense {
        case .clickOnPreviousButton:
            sendToNavigator.express(.backToBlockOne)
        }
    }
}

//
//  FeatureBlockViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

class FeatureBlockViewModel: AtomViewModelProtocol {
    
    // свойство, через которое посылаем событие для своей view
    var sendToView = Sender<FeatureBlockSenses.ViewModelSense>()
    var sendToNavigator = SenderNavigator<FeatureBlockSenses.FlowResult>()
    
    let actionViewModel: FeatureActionViewModel
    let viewoutViewModel: FeatureViewoutViewModel
    
    init(actionViewModel: FeatureActionViewModel, viewoutViewModel: FeatureViewoutViewModel) {
        self.actionViewModel = actionViewModel
        self.viewoutViewModel = viewoutViewModel
    }
    
    func sensor(iSense: FeatureBlockSenses.ViewSense) {
    }
    
    func begin() {
        sendToView.express(.setupViews)
        // обязательный Bind actionMiniViewModel
        connectToBlock(with: actionViewModel)
        // обязательный Bind viewoutMiniViewModel
        connectToBlock(with: viewoutViewModel)
    }
}

// протокол для связи со всеми miniView's
extension FeatureBlockViewModel: BlockViewModelProtocol {
    
    func blockSensor(iSense: FeatureBlockSenses.BlockViewModelSense) {
        switch iSense {
        // From actionViewModel
        case .clickPreviousFromAction:
            viewoutViewModel.sensor(iSense: .clickPreviousFromAction)
        case .clickNextFromAction:
            viewoutViewModel.sensor(iSense: .clickNextFromAction)
            // случай, когда одно событие летит двум вьюхам
//            actionViewModel.sensor(iSense: .clickNextFromViewout)
        // From viewoutViewModel
        case .clickPreviousFromViewout:
            actionViewModel.sensor(iSense: .clickPreviousFromViewout)
        case .clickNextFromViewout:
            actionViewModel.sensor(iSense: .clickNextFromViewout)
        }
    }
}

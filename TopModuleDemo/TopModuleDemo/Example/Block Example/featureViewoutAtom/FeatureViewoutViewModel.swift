//
//  FeatureViewoutViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

class FeatureViewoutViewModel: AtomViewModelProtocol, AtomicBlockViewModelProtocol {
    
    // свойство, через которое посылаем событие в BlockViewModel
    var sendToView = Sender<FeatureViewoutSenses.ViewModelSense>()
    // свойство, через которое посылаем событие для своей view
    var sendToBlock = SenderBlock<FeatureBlockSenses.BlockViewModelSense>()
    
    private var counterColors = 0
    
    func sensor(iSense: FeatureViewoutSenses.ViewSense) {
        switch iSense {
        case .clickPreviousFromViewout:
            clickPreviousFromViewout()
        case .clickNextFromViewout:
            clickNextFromViewout()
        case .clickPreviousFromAction:
            clickPreviousFromPapa()
        case .clickNextFromAction:
            clickNextFromPapa()
        }
    }
    
    private func clickPreviousFromViewout() {
        sendToBlock.express(.clickPreviousFromViewout)
    }
    
    private func clickNextFromViewout() {
        sendToBlock.express(.clickNextFromViewout)
    }
    
    private func clickPreviousFromPapa() {
        if counterColors != 0 {
            counterColors -= 1
        }
        sendToView.express(.changeColor(counterColors))
    }

    private func clickNextFromPapa() {
        if counterColors != 4 {
            counterColors += 1
        }
        sendToView.express(.changeColor(counterColors))
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
}

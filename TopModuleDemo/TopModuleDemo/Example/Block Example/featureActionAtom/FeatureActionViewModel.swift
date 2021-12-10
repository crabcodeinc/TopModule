//
//  FeatureActionViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

class FeatureActionViewModel: AtomViewModelProtocol, AtomicBlockViewModelProtocol {
    
    var sendToView = Sender<FeatureActionSenses.ViewModelSense>()
    var sendToBlock = SenderBlock<FeatureBlockSenses.BlockViewModelSense>()
    
    private var counterColors = 0
    
    func sensor(iSense: FeatureActionSenses.ViewSense) {
        switch iSense {
        // From View
        case .clickPreviousFromAction:
            clickPreviousFromView()
        case .clickNextFromAction:
            clickNextFromView()
        // From Block
        case .clickPreviousFromViewout:
            clickPreviousFromPapa()
        case .clickNextFromViewout:
            clickNextFromPapa()
        }
    }
    
    private func clickPreviousFromView() {
        sendToBlock.express(.clickPreviousFromAction)
    }
    
    private func clickNextFromView() {
        sendToBlock.express(.clickNextFromAction)
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

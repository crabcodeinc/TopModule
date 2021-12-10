//
//  NewFeatueViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

final class NewFeatueViewModel: AtomViewModelProtocol {
//    var portToView = Port<NewFeatueSenses.ViewModelSense>()
    var sendToView = Sender<NewFeatueSenses.ViewModelSense>()
    
    private var counterColors = 0
    
    func sensor(iSense: NewFeatueSenses.ViewSense) {
        switch iSense {
        case .clickPrevious:
            clickPrevious()
        case .clickNext:
            clickNext()
        }
    }
    
    private func clickPrevious() {
        if counterColors != 0 {
            counterColors -= 1
        }
        sendToView.express(.changeColor(counterColors))
    }
    
    private func clickNext() {
        if counterColors != 4 {
            counterColors += 1
        }
        sendToView.express(.changeColor(counterColors))
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
}

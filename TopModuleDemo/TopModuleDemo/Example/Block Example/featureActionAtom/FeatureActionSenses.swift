//
//  FeatureActionSenses.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation

class FeatureActionSenses {
    
    // события от View для ViewModel
    enum ViewSense {
        // from View to ViewModel
        case clickPreviousFromAction
        case clickNextFromAction
        // from BlockViewModel to ViewModel
        case clickPreviousFromViewout
        case clickNextFromViewout
    }
    
    // события от ViewModel для View
    enum ViewModelSense {
        case changeColor(Int)
        case setupViews
    }
    
    // события перехода
    enum FlowResult {
        
    }
}

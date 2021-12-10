//
//  FeatureViewoutSenses.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation

class FeatureViewoutSenses {
    
    // события от View для ViewModel
    // или от BlockView для ViewModel
    enum ViewSense {
        // from View to ViewModel
        case clickPreviousFromViewout
        case clickNextFromViewout
        
        // from BlockViewModel to ViewModel
        case clickPreviousFromAction
        case clickNextFromAction
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

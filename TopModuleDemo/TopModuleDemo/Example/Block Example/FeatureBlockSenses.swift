//
//  FeatureBlockSenses.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation

class FeatureBlockSenses {
    
    // события от View для ViewModel
    enum ViewSense {
        
    }
    
    // события от ViewModel для View
    enum ViewModelSense {
        case setupViews
    }
    
    // события перехода
    enum FlowResult {
        
    }
}

extension FeatureBlockSenses {
    
    // события от miniViewModel's для BlockViewModel
    enum BlockViewModelSense {
        case clickPreviousFromAction
        case clickNextFromAction
        case clickPreviousFromViewout
        case clickNextFromViewout
    }
}

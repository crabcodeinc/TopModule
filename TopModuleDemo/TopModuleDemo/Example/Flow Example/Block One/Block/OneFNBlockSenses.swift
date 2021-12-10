//
//  OneFNBlockSenses.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation

final class OneFNBlockSenses {
    
    enum ViewSense {
        
    }
    
    enum ViewModelSense {
        case setupViews
    }
    
    enum FlowResult {
        case goToBlockTwo
    }
    
}

extension OneFNBlockSenses {
    
    enum BlockViewModelSense {
        case clickOnNextButton
    }
}

//
//  TwoFNBlockSenses.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

final class TwoFNBlockSenses {
    
    enum ViewSense {
        
    }
    
    enum ViewModelSense {
        case setupViews
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
    
}

extension TwoFNBlockSenses {
    
    enum BlockViewModelSense {
        case clickOnPreviousButton
    }
}

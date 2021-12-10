//
//  TwoFNAtomViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

final class TwoFNAtomViewModel: AtomViewModelProtocol, AtomicBlockViewModelProtocol {
    
    var sendToView = Sender<TwoFNAtomSenses.ViewModelSense>()
    var sendToBlock = SenderBlock<TwoFNBlockSenses.BlockViewModelSense>()
    
    func sensor(iSense: TwoFNAtomSenses.ViewSense) {
         switch iSense {
        // From View
         case .clickOnPreviousButton:
            sendToBlock.express(.clickOnPreviousButton)
        // From Block
         }
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

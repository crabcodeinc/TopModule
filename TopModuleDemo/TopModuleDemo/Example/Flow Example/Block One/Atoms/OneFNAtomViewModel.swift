//
//  OneFNAtomViewModel.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import TopModule

final class OneFNAtomViewModel: AtomViewModelProtocol, AtomicBlockViewModelProtocol {
    
    var sendToView = Sender<OneFNAtomSenses.ViewModelSense>()
    var sendToBlock = SenderBlock<OneFNBlockSenses.BlockViewModelSense>()
    
    func sensor(iSense: OneFNAtomSenses.ViewSense) {
         switch iSense {
//         From View
         case .clickOnNextButton:
            sendToBlock.express(.clickOnNextButton)
//         From Block
         }
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

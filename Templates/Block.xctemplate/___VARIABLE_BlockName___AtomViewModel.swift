//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import TopModule

final class ___VARIABLE_BlockName___AtomViewModel: AtomViewModelProtocol, AtomicBlockViewModelProtocol {
    
    var sendToView = Sender<___VARIABLE_BlockName___AtomSenses.ViewModelSense>()
    var sendToBlock = SenderBlock<___VARIABLE_BlockName___BlockSenses.BlockViewModelSense>()
    
    func sensor(iSense: ___VARIABLE_BlockName___AtomSenses.ViewSense) {
        switch iSense {
//        // From View
//
//        // From Papa
//
//        }
    }
    
    func begin() {
        sendToView.express(.setupViews)
    }
}

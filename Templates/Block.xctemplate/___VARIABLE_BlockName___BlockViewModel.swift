//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___VARIABLE_BlockName___BlockViewModel: AtomViewModelProtocol {
    
    // BlockViewModelProtocol
    var sendToNavigator = SenderNavigator<FeatureNavigator Senses.FlowResult>()
    
    var sendToView = Sender<___VARIABLE_BlockName___BlockSenses.ViewModelSense>()
    
    var atomicViewModel: ___VARIABLE_BlockName___AtomViewModel
    
    init(atomicViewModel: ___VARIABLE_BlockName___AtomViewModel) {
        self.atomicViewModel = atomicViewModel
    }
    
    func sensor(iSense: ___VARIABLE_BlockName___BlockSenses.ViewSense) {
        
    }
    
    func begin() {
        sendToView.express(.setupViews)
        connectToBlock(with: atomicViewModel)
    }
}

extension ___VARIABLE_BlockName___BlockViewModel: BlockViewModelProtocol {
    
    func blockSensor(iSense: ___VARIABLE_BlockName___BlockSenses.BlockViewModelSense) {
        switch iSense {
        
        }
    }
}

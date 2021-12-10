//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_BlockName___BlockFabric {
    
    static func make___VARIABLE_BlockName___Modul(navigator: FeatureNavigator) -> UIViewController {
        let atomic___VARIABLE_BlockName___View = ___VARIABLE_BlockName___AtomView()
        let atomic___VARIABLE_BlockName___ViewModel = ___VARIABLE_BlockName___AtomViewModel()
        atomic___VARIABLE_BlockName___View.connect(with: atomic___VARIABLE_BlockName___ViewModel)
        
        let block___VARIABLE_BlockName___View = ___VARIABLE_BlockName___BlockView(atomicView: atomic___VARIABLE_BlockName___View)
        let block___VARIABLE_BlockName___ViewModel = ___VARIABLE_BlockName___BlockViewModel(atomicViewModel: atomic___VARIABLE_BlockName___ViewModel)
        block___VARIABLE_BlockName___View.connect(with: block___VARIABLE_BlockName___ViewModel)
        
        navigator.connectToFeature(with: block___VARIABLE_BlockName___ViewModel)
        
        return block___VARIABLE_BlockName___View
    }
}

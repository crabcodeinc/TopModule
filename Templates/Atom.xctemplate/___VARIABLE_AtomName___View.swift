//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

final class ___VARIABLE_AtomName___View: UIView, AtomViewProtocol {
    var sendToViewModel = Sender<___VARIABLE_AtomName___Senses.ViewSense>()
    var atomViewModel: AnyViewModel<___VARIABLE_AtomName___Senses.ViewSense, ___VARIABLE_AtomName___Senses.ViewModelSense>?
    
    func sensor(iSense: ___VARIABLE_AtomName___Senses.ViewModelSense) {
         switch iSense {
            case .setupViews:
                setupViews()
                configureViews()
         }
    }
    
    private func configureViews() {
        // setup views settings
    }
    
    private func setupViews() {
        // setup views constraints
    }
}

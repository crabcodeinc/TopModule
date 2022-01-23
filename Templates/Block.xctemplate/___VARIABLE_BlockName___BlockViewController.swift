//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import TopModule

final class ___VARIABLE_BlockName___BlockViewController: UIViewController, AtomViewProtocol {
    var sendToViewModel = Sender<___VARIABLE_BlockName___BlockSenses.ViewSense>()
    var atomViewModel: AnyViewModel<___VARIABLE_BlockName___BlockSenses.ViewSense, ___VARIABLE_BlockName___BlockSenses.ViewModelSense>?
    
    let atomicView: ___VARIABLE_BlockName___AtomView
    
    init(atomicView: ___VARIABLE_BlockName___AtomView) {
        self.atomicView = atomicView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sensor(iSense: ___VARIABLE_BlockName___BlockSenses.ViewModelSense) {
         switch iSense {
            case .setupViews:
                setupViews()
         }
    }
    
    private func configureViews() {
        // setup views settings
    }
    
    private func setupViews() {
        // setup views constraints
    }
}

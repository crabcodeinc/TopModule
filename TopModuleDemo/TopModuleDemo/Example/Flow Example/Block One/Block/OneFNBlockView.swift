//
//  OneFNBlockView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit
import SnapKit
import TopModule

final class OneFNBlockView: UIViewController, AtomViewProtocol {
    var sendToViewModel = Sender<OneFNBlockSenses.ViewSense>()
    var atomViewModel: AnyViewModel<OneFNBlockSenses.ViewSense, OneFNBlockSenses.ViewModelSense>?
    
    var atomicView: OneFNAtomView
    
    init(atomicView: OneFNAtomView) {
        self.atomicView = atomicView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
    
    func sensor(iSense: OneFNBlockSenses.ViewModelSense) {
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
        view.addSubview(atomicView)
        atomicView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

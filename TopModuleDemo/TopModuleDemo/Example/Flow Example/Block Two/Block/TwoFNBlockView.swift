//
//  TwoFNBlockView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit
import SnapKit
import TopModule

final class TwoFNBlockView: UIViewController, AtomViewProtocol {
    var sendToViewModel = Sender<TwoFNBlockSenses.ViewSense>()
    var atomViewModel: AnyViewModel<TwoFNBlockSenses.ViewSense, TwoFNBlockSenses.ViewModelSense>?
    
    var atomicView: TwoFNAtomView
    
    init(atomicView: TwoFNAtomView) {
        self.atomicView = atomicView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sensor(iSense: TwoFNBlockSenses.ViewModelSense) {
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

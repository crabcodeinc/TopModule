//
//  FeatureBlockView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import UIKit
import TopModule

class FeatureBlockView: UIView, AtomViewProtocol {
    
    var atomViewModel: AnyViewModel<FeatureBlockSenses.ViewSense, FeatureBlockSenses.ViewModelSense>?
    var sendToViewModel = Sender<FeatureBlockSenses.ViewSense>()
    
    private let viewoutView: UIView
    private let actionView: UIView
    
    init(viewoutView: UIView, actionView: UIView) {
        self.viewoutView = viewoutView
        self.actionView = actionView
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sensor(iSense: FeatureBlockSenses.ViewModelSense) {
        switch iSense {
        case .setupViews:
            setupViews()
            configureViews()
        }
    }
    
    private func configureViews() {
    }
    
    private func setupViews() {
        addSubview(viewoutView)
        viewoutView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        addSubview(actionView)
        actionView.snp.makeConstraints {
            $0.top.equalTo(viewoutView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
}

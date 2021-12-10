//
//  OneFNAtomView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit
import SnapKit
import TopModule

final class OneFNAtomView: UIView, AtomViewProtocol {
    var sendToViewModel = Sender<OneFNAtomSenses.ViewSense>()
    var atomViewModel: AnyViewModel<OneFNAtomSenses.ViewSense, OneFNAtomSenses.ViewModelSense>?
    
    private let colorView = UIView()
    private let nextButton = UIButton()
    
    func sensor(iSense: OneFNAtomSenses.ViewModelSense) {
         switch iSense {
            case .setupViews:
                setupViews()
                configureViews()
         }
    }
    
    private func configureViews() {
        // setup views settings
        colorView.backgroundColor = .blue
        nextButton.setTitle("next", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func nextButtonAction() {
        sendToViewModel.express(.clickOnNextButton)
    }
    
    private func setupViews() {
        // setup views constraints
        addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(70)
        }
    }
    
    deinit {
        print("🙋‍♂️ deinit \(self)")
    }
}

//
//  TwoFNAtomView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit
import SnapKit
import TopModule

final class TwoFNAtomView: UIView, AtomViewProtocol {
    var sendToViewModel = Sender<TwoFNAtomSenses.ViewSense>()
    var atomViewModel: AnyViewModel<TwoFNAtomSenses.ViewSense, TwoFNAtomSenses.ViewModelSense>?
    
    private let colorView = UIView()
    private let previousButton = UIButton()
    
    func sensor(iSense: TwoFNAtomSenses.ViewModelSense) {
         switch iSense {
            case .setupViews:
                setupViews()
                configureViews()
         }
    }
    
    private func configureViews() {
        // setup views settings
        colorView.backgroundColor = .green
        previousButton.setTitle("previous", for: .normal)
        previousButton.backgroundColor = .black
        previousButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func previousButtonAction() {
        sendToViewModel.express(.clickOnPreviousButton)
    }
    
    private func setupViews() {
        // setup views constraints
        addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        addSubview(previousButton)
        previousButton.snp.makeConstraints {
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

//
//  FeatureViewoutView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import UIKit
import TopModule

class FeatureViewoutView: UIView, AtomViewProtocol {
    
    var atomViewModel: AnyViewModel<FeatureViewoutSenses.ViewSense, FeatureViewoutSenses.ViewModelSense>?
    var sendToViewModel = Sender<FeatureViewoutSenses.ViewSense>()
    
    // Viewout
    private let colorView = UIView()
    
    // Action
    private let prevoiusButton = UIButton()
    private let nextButton = UIButton()
    
    func sensor(iSense: FeatureViewoutSenses.ViewModelSense) {
        switch iSense {
        case .changeColor(let counterColors):
            changeColor(number: counterColors)
        case .setupViews:
            setupViews()
            configureViews()
        }
    }
    
    private func changeColor(number: Int) {
        let colors: [UIColor] = [.black, .white, .green, .red, .yellow]
        colorView.backgroundColor = colors[number]
    }
    
    private func configureViews() {
        // Viewout
        colorView.backgroundColor = .black
        
        // Action
        prevoiusButton.backgroundColor = .black
        prevoiusButton.setTitle("<-", for: .normal)
        prevoiusButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        
        // Action
        nextButton.backgroundColor = .black
        nextButton.setTitle("->", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    private func setupViews() {
        addSubview(prevoiusButton)
        prevoiusButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(prevoiusButton.snp.right).offset(50)
            $0.right.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        
        addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(30)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(50)
        }
    }
    
    // Action
    @objc
    private func previousButtonAction() {
        sendToViewModel.express(.clickPreviousFromViewout)
    }
    
    // Action
    @objc
    private func nextButtonAction() {
        sendToViewModel.express(.clickNextFromViewout)
    }
    
}

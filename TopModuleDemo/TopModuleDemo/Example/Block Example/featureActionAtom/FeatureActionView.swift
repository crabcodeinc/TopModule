//
//  FeatureActionView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import UIKit
import TopModule

class FeatureActionView: UIView, AtomViewProtocol {
    
    var atomViewModel: AnyViewModel<FeatureActionSenses.ViewSense, FeatureActionSenses.ViewModelSense>?
    var sendToViewModel = Sender<FeatureActionSenses.ViewSense>()
    
    private let prevoiusButton = UIButton()
    private let nextButton = UIButton()
    
    func sensor(iSense: FeatureActionSenses.ViewModelSense) {
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
        prevoiusButton.backgroundColor = colors[number]
        nextButton.backgroundColor = colors[number]
    }
    
    private func configureViews() {
        prevoiusButton.backgroundColor = .black
        prevoiusButton.setTitle("<-", for: .normal)
        prevoiusButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        
        nextButton.backgroundColor = .black
        nextButton.setTitle("->", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func previousButtonAction() {
        sendToViewModel.express(.clickPreviousFromAction)
    }
    
    @objc
    private func nextButtonAction() {
        sendToViewModel.express(.clickNextFromAction)
    }
    
    private func setupViews() {
        addSubview(prevoiusButton)
        prevoiusButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(prevoiusButton.snp.right).offset(50)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
    }
    
}

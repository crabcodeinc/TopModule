//
//  NewFeatueView.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import UIKit
import SnapKit
import TopModule

final class NewFeatueView: UIView, AtomViewProtocol {
    var sendToViewModel = Sender<NewFeatueSenses.ViewSense>()
    var atomViewModel: AnyViewModel<NewFeatueSenses.ViewSense, NewFeatueSenses.ViewModelSense>?
    
    private let colorView = UIView()
    private let previousButton = UIButton()
    private let nextButton = UIButton()
    
    func sensor(iSense: NewFeatueSenses.ViewModelSense) {
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
        colorView.backgroundColor = .black
        
        previousButton.backgroundColor = .black
        previousButton.setTitle("<-", for: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        
        nextButton.backgroundColor = .black
        nextButton.setTitle("->", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func previousButtonAction() {
        sendToViewModel.express(.clickPrevious)
    }
    
    @objc
    private func nextButtonAction() {
        sendToViewModel.express(.clickNext)
    }
    
    private func setupViews() {
        addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        addSubview(previousButton)
        previousButton.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom).offset(30)
            $0.right.equalTo(colorView.snp.left).offset(-30)
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom).offset(30)
            $0.left.equalTo(colorView.snp.right).offset(30)
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
    }
}

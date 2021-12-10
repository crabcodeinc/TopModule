//
//  ViewController.swift
//  TopModuleDemo
//
//  Created by Valery Top on 07.12.2021.
//

import UIKit
import TopModule

class ViewController: UIViewController {
    var generalNavigator: FNTestTwoFeatureNavigator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // показ работы Атома
//        setAtomModule()
        
        // показ работы Блока
//        setBlockModule()
        
        // Единый Навигационный Контроллер
        setGeneralNavigatorFlow()
    }
    
    private func setBlockModule() {
        let featureBlockView = FeatureBLockFabric.makeFeatureBlock()
        
        view.addSubview(featureBlockView)
        featureBlockView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAtomModule() {
        let testOneView = NewFeatueView()
        let testOneViewModel = NewFeatueViewModel()
        testOneView.connect(with: testOneViewModel)
        
        view.addSubview(testOneView)
        testOneView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setGeneralNavigatorFlow() {
        let superController = self.navigationController
        generalNavigator = FNTestTwoFeatureNavigator(superNavigator: superController)
        generalNavigator?.begin()
    }
}


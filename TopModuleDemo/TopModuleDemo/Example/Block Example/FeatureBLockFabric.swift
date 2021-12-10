//
//  FeatureBLockFabric.swift
//  Module.X.Demo
//
//  Created by Valery Top on 21.11.2021.
//

import Foundation
import UIKit

class FeatureBLockFabric {
    
    static func makeFeatureBlock() -> UIView {

        let featureActionView = FeatureActionView()
        let featureActionViewModel = FeatureActionViewModel()
        featureActionView.connect(with: featureActionViewModel)

        let featureViewoutView = FeatureViewoutView()
        let featureViewoutViewModel = FeatureViewoutViewModel()
        featureViewoutView.connect(with: featureViewoutViewModel)

        let featureBlockView = FeatureBlockView(viewoutView: featureViewoutView, actionView: featureActionView)
        let featureBlockViewModel = FeatureBlockViewModel(actionViewModel: featureActionViewModel,
                                                          viewoutViewModel: featureViewoutViewModel)
        featureBlockView.connect(with: featureBlockViewModel)

        return featureBlockView
    }
}

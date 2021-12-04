//
//  GeneralNavigator.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import UIKit

open class GeneralNavigator {
    
    // Ссылка для главного навигатора,
    // на котором и будет крутиться вся навигация
    weak var superNavigator: UINavigationController?
    
    // Инициализация через главный навигатор
    public init(superNavigator: UINavigationController?) {
        self.superNavigator = superNavigator
    }
    
    // Функция перехода на следующий контроллер
    public func next(_ vc: UIViewController) {
        superNavigator?.pushViewController(vc, animated: true)
    }
    
        // To Do: добавить отдельный метод для present
        // superNavigator?.present(vc, animated: true)
    
        // To Do: добавить отдельный метод для dismiss
        // superNavigator?.dismiss(animated: true)
    
        // To Do: добавить отдельный метод для popToRoot
        // superNavigator?.popToRootViewController(animated: animated)Ш
    
    // Функция перехода на предыдущий контроллер
    public func previous() {
        superNavigator?.popViewController(animated: true)
    }
}

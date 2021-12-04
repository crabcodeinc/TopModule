//
//  SenderNavigator.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import Foundation
// class SenderNavigator<NavigatorSense> - класс, который хранит обработчики событий viewModel.
// SenderNavigator нужен, что бы навигироваться от модуля к модулю
public final class SenderNavigator<NavigatorSense> {
    
    // Чтобы при объявлении был доступен инициализатор
    public init() { }
    
    // В свойстве sensorsStorage храним кложур с вызовами методов navigatorSensor(iSense: )
    var sensorStorage: ((NavigatorSense) -> Void)?
    
    // при вызове метода express(_ iSense: ) вызываем обработчик с данным NavigatorSense
    public func express(_ iSense: NavigatorSense) {
        sensorStorage?(iSense)
    }
}

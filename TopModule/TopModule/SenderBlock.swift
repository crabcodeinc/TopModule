//
//  SenderBlock.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import Foundation

// SenderBlock нужен, чтобы к классу BlockViewModel
// привязать отправку событий от AtomViewModel
public final class SenderBlock<BlockViewModelSense> {
    
    // Чтобы при объявлении был доступен инициализатор
    public init() { }
    
    // в свойстве sensorStorage храним клоужер, в который передаем sense
    // от AtomViewModel, через метод express
    var sensorStorage: ((BlockViewModelSense) -> Void)?
    
    // при вызове метода express(_ iSense:) вызываем метод blockSensor
    // у BlockViewModel
    public func express(_ iSense: BlockViewModelSense) {
        sensorStorage?(iSense)
    }
}

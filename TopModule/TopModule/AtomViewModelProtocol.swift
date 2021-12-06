//
//  AtomViewModelProtocol.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import Foundation

// associatedtype -  При определении протокола иногда полезно объявить один
// или несколько связанных типов как часть определения.
// Связанный тип задает имя-заглушку для типа, который используется в качестве части протокола.
// Фактический тип, используемый для этого связанного типа не будет указан,
// пока протокол не будет использован. Связанные типы объявляются с помощью
// ключевого слова associatedtype.
public protocol AtomViewModelProtocol {
    associatedtype ViewModelSense
    associatedtype ViewSense
    
    // sendToView нужен, чтобы к классу AtomViewModel
    // привязать методы sensor от View(View's)
    var sendToView: Sender<ViewModelSense> { get }
    
    // метод sensor(iSense: ) нужен для обработки событий от AtomView к AtomViewModel
    func sensor(iSense: ViewSense)
    
    // метод begin() используется для для действий,
    // которые нужно сделать при старте модуля
    // (например загрузить данные и сделать базовую настройку вьюхи)
    // Вызывается только один раз
    func begin()
}

//
//  AtomicBlockViewModelProtocol.swift
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
public protocol AtomicBlockViewModelProtocol: AtomViewModelProtocol {
    associatedtype BlockViewModelSense
    
    // sendToBlock нужен, чтобы посылать события от atomViewModel
    // к blockViewModel
    var sendToBlock: SenderBlock<BlockViewModelSense> { get }
}

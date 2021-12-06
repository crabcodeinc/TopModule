//
//  BlockViewModelProtocol.swift
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

// наследование от class нужно, чтобы в sensorStorage сделать [weak self]
// и для того, чтобы в extension не нужно было писать mutable func -
// так как swift'у не понятно, будет это класс или структура.
// Все дело в том, что структуры и перечисления являются типами значений.
// По умолчанию, свойства типов значений не могут быть изменены изнутри методов экземпляра.
// для этого и пишут mutable у функций фнутри структур
public protocol BlockViewModelProtocol: class {
    associatedtype BlockViewModelSense
    associatedtype NavigatorSense
    
    // sendToView нужен, чтобы передавать в навигацию
    // события от BlockViewModel
    var sendToNavigator: SenderNavigator<NavigatorSense> { get }
    
    // метод для обработки и распределения событий от atomViewModel по методам
    func blockSensor(iSense: BlockViewModelSense)
}

// дженерик ViewModelType, должен соответствовать протоколу AtomicBlockViewModelProtocol,
// где BlockViewModelSense вьюмодели совпадает с BlockViewModelSense atomView'Модели
extension BlockViewModelProtocol {
    public func connectToBlock<ViewModelType: AtomicBlockViewModelProtocol>(with vm: ViewModelType?) where
    ViewModelType.BlockViewModelSense == BlockViewModelSense {
        
        // проверяем входящую viewModel на nil
        guard let vm = vm else { return }
        
        // приравнивем параметру sensorStorage из параметра sendToBlock
        // клоужеру, который принимает событие от atomViewModel
        // и вызывает метод blockSensor, передавая ему совершонное событие
        vm.sendToBlock.sensorStorage = { [weak self] iSense in
            if #available(iOS 10.0, *) {
                // отправляем нашу задачу на главнй поток в нужном режиме
                // исполнение этой операции произойдет, когда UIKit посчитает это безопасным
                // для восприятия пользователя
                RunLoop.main.perform(inModes: [.default], block: {
                    self?.blockSensor(iSense: iSense)
                })
            } else {
                DispatchQueue.main.async {
                    self?.blockSensor(iSense: iSense)
                }
            }
        }
    }
}

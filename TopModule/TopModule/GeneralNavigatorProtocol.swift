//
//  GeneralNavigatorProtocol.swift
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
public protocol GeneralNavigatorProtocol: class {
    associatedtype NavigatorSense
    
    // navigatorSensor нужен, чтобы принимать в навигацию
    // события от BlockViewModel
    func navigatorSensor(iSense: NavigatorSense)
    
    // метод begin() запускает все флоу,
    // за который отвечает GeneralNavigator
    func begin()
}

// дженерик ViewModelType, должен соответствовать протоколу BlockViewModelProtocol,
// где NavigatorSense вьюмодели совпадает с NavigatorSense навигатора
extension GeneralNavigatorProtocol {
    public func connectToFeature<ViewModelType: BlockViewModelProtocol>(with vm: ViewModelType?) where
        ViewModelType.NavigatorSense == NavigatorSense {
        
        // проверяем входящую viewModel на nil
        guard let vm = vm else { return }
        
        // приравнивем параметру sensorStorage из параметра sendToNavigator
        // клоужеру, который принимает событие от BlockViewModel
        // и вызывает метод navigatorSensor, передавая ему совершонное событие
        vm.sendToNavigator.sensorStorage = { [weak self] iSense in
            if #available(iOS 10.0, *) {
                // отправляем нашу задачу на главнй поток в нужном режиме
                // исполнение этой операции произойдет, когда UIKit посчитает это безопасным
                // для восприятия пользователя
                RunLoop.main.perform(inModes: [RunLoop.Mode.default], block: {
                    self?.navigatorSensor(iSense: iSense)
                })
            } else {
                DispatchQueue.main.async {
                    self?.navigatorSensor(iSense: iSense)
                }
            }
            
        }
    }
}

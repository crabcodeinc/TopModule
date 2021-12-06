//
//  AtomViewProtocol.swift
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

// наследование от class нужно, чтобы в connectToBlock сделать [weak self]
// и для того, чтобы в extension не нужно было писать mutable func -
// так как swift'у не понятно, будет это класс или структура.
// Все дело в том, что структуры и перечисления являются типами значений.
// По умолчанию, свойства типов значений не могут быть изменены изнутри методов экземпляра.
// для этого и пишут mutable у функций фнутри структур
public protocol AtomViewProtocol: class {
    associatedtype ViewModelSense
    associatedtype ViewSense

    // sendToViewModel нужен, что бы к viewModel привязать методы sensor от View(View's)
    var sendToViewModel: Sender<ViewSense> { get }
    
    // хоть мы и не используем viewModel на прямую, она все равно видна
    // для нас. Так проще навигироваться и находить Sense от нашего атома или блока
    var atomViewModel: AnyViewModel<ViewSense, ViewModelSense>? { get set }
    
    // метод для обработки и распределения событий от ViewModel по методам
    func sensor(iSense: ViewModelSense)
}

extension AtomViewProtocol {
    
    // дженерик ViewModelType, должен соответствовать протоколу AtomViewModelProtocol,
    // где ViewModelSense вьюмодели совпадает с ViewModelSense вьюхи,
    // а ViewSense вьюмодели также совпадает с ViewSense вьюхи
    public func connect<ViewModelType: AtomViewModelProtocol>(with vm: ViewModelType?) where ViewModelType.ViewSense == ViewSense,
                                                                       ViewModelType.ViewModelSense == ViewModelSense {
        
        guard let vm = vm else { return }
        
        // создаем общий вариант для конкретной viewModel
        let model = AnyViewModel(viewModel: vm)
        
        // добавляем в sendToView viewModel'и клоужер с методом-обработчиком sensor от view
        model.sendToView.append({ [weak self] iSense in
            if #available(iOS 10.0, *) {
                // отправляем нашу задачу на главнй поток в нужном режиме
                // исполнение этой операции произойдет, когда UIKit посчитает это безопасным
                // для восприятия пользователя
                RunLoop.main.perform(inModes: [.default], block: {
                    self?.sensor(iSense: iSense)
                })
            } else {
                DispatchQueue.main.async {
                    self?.sensor(iSense: iSense)
                }
            }
        })
        
        // добавляем в sendToViewModel view клоужер с методом-обработчиком sensor от viewModel
        sendToViewModel.append({ [weak model] iSense in
            model?.sensor(iSense: iSense)
        })
        
        // сохраняем viewModel во view
        atomViewModel = model
        
        // делаем запуск viewModel
        model.begin()
    }
}

//
//  Sender.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import Foundation

// class Sender<Sense> - класс, который хранит обработчики событий от view и viewModel.
// Sender нужен, что бы к классу viewModel
// привязать методы sensor от View(View's) и наоборот
// у каждого из сущностей (View и ViewModel) есть свой объект Sender,
// который хранит метод обработки событий sensor(iSense: ) от противоположной сущности.
// Массив нужен для того, чтобы когда одна вью модель хочет сообщать о своих событиях
// нескольким вьюхам, например, ContainerView и ContentView (одно вложено в другое),
// мы смогли отправить одно событие нескольким вьюхам
public final class Sender<Sense> {
    
    // Чтобы при объявлении был доступен инициализатор
    public init() { }

    // В свойстве sensorsStorage храним кложуры с вызовами методов sensor(iSense: )
    public var sensorsStorage = [(Sense) -> Void]()
    
    // при вызове метода express(_ iSense: ) вызываем все обработчики с данным Sense,
    // которые его примут.
    public func express(_ iSense: Sense) {
        for sensor in sensorsStorage {
            sensor(iSense)
        }
    }
    
    // метод для добавления клоужеров,
    // с которыми взаимодействую сущности (view и viewModel)
    public func append(_ sensor: @escaping (Sense) -> Void) {
        sensorsStorage.append(sensor)
    }
}

//
//  ViewModelTypeErasure.swift
//  TopModule
//
//  Created by Valery Top on 20.11.2021.
//

import Foundation

// Нужно во View использовать не конкретную ViewModel,
// а ее протокол. Но со свойствами associatedtype
// протокол использовать нельзя. Поэтому используем
// Type Erasure, который решит эту проблему.

// Статьи:
// https://medium.com/@antonagarunov/стирание-типов-type-erasure-в-swift-9378bf1a772d
// https://bignerdranch.com/blog/breaking-down-type-erasure-in-swift/

// Пишем все это дело по аналогии со стандартными библиотеками в 3 этапа:

// Stage 1
// Пишем приватный абстрактный класс
// требования:
//  - должен имень дженерик-параметры (ViewSense, ViewModelSense)
//  - должен поддерживать протокол AtomViewModelProtocol
//  - функции и методы протокола AtomViewModelProtocol должны быть абстрактными
private class _AnyViewModelAbstract<ViewSense, ViewModelSense>: AtomViewModelProtocol {
    
    var sendToView: Sender<ViewModelSense> {
        get { fatalError("This property is abstract") }
    }
    
    func sensor(iSense: ViewSense) {
        fatalError("This method is abstract")
    }
    
    func begin() {
        fatalError("This method is abstract")
    }
}

// Stage 2
// Пишем пиватный класс обертку
// требования:
//  - должен наследоваться от абстрактного класса _AnyViewModelAbstract
//  - должен иметь дженерик параметр ViewModel, который является AtomViewModelProtocol
//  - должен получать через конструктор(init) инстанс дженерика ViewModel
//    и сохранять его в свойство _viewModel
private class _ViewModelWrapper<ViewModel: AtomViewModelProtocol>:
    _AnyViewModelAbstract<ViewModel.ViewSense, ViewModel.ViewModelSense> {
    private let _viewModel: ViewModel
    
    init(_ viewModel: ViewModel) {
        self._viewModel = viewModel
    }
    
    override var sendToView: Sender<ViewModel.ViewModelSense> {
        get { return _viewModel.sendToView}
    }
    
    override func sensor(iSense: ViewModel.ViewSense) {
        _viewModel.sensor(iSense: iSense)
    }
    
    override func begin() {
        return _viewModel.begin()
    }
}

// Stage 3
// Написать финальный класс AnyViewModel
// требованя:
//  - должен имень дженерик-параметры (ViewSense, ViewModelSense)
//  - должен поддерживать протокол AtomViewModelProtocol
//  - должен получать через конструктор(init) инстанс протокола AtomViewModelProtocol
//    и сохранять его в приватное свойство через обертку (_ViewModelWrapper)
//  - должен делегировать все методы и свойства AtomViewModelProtocol объекту _viewModel
public final class AnyViewModel<ViewSense, ViewModelSense>: AtomViewModelProtocol {
    
    private let _viewModel: _AnyViewModelAbstract<ViewSense, ViewModelSense>
    private var isBegin = false
    
    init<ViewModel: AtomViewModelProtocol>(viewModel: ViewModel) where ViewModel.ViewSense == ViewSense,
                                                                       ViewModel.ViewModelSense == ViewModelSense {
        _viewModel = _ViewModelWrapper(viewModel)
    }
    
    public var sendToView: Sender<ViewModelSense> {
        get { _viewModel.sendToView }
    }
    
    public func sensor(iSense: ViewSense) {
        return _viewModel.sensor(iSense: iSense)
    }
    
    public func begin() {
        if !isBegin {
            isBegin = true
            return _viewModel.begin()
        }
    }
}

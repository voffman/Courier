//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol OrderListTableViewProtocol: AnyObject  {
  //MARK: перенести сюда функцию конфигуреCELL в tableView func configure(...) Не получится, это внутрення функция ячейки
    // как вариант её дублировать в tableView - не вариант
    // передача значения через дделегат - отсюда в тэйбл вью, а в табле вью реализовать метод конфигурациии..  ДА Чисто post передать в extension table View ну как то так
    //  Что то типа cell.configure(title: post.title, body: post.body ..)
    // а как сделать number rows in section как вариант for index in post.id { return index.count}
    // Но для начала можно просто проверить на тестовом проекте метод .count
    // [post].count = 1111111111 или 0
}

// То, что выполняю в здесь
protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ())
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    let networkManager = NetworkManager()
    
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        networkManager.getRequest(url: URLs.CourierOrders.order, headers: [.authorization(bearerToken: Properties.bearer!)], model: CourierOrderResponseElement.self) { posts in
            completion(posts)
            
        }
    }
}

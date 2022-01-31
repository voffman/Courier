//
//  DetailOrderPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol DetailOrderTableViewProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol DetailOrderTableViewPresenterProtocol: AnyObject {
    func getSelectedOrderData()
}

class DetailOrderPresenter: DetailOrderTableViewPresenterProtocol {

    weak var view: DetailOrderTableViewProtocol?
    // Тут можно объявить модель
    func getSelectedOrderData() {
        
    }

}

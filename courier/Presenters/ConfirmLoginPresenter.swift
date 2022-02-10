//
//  ConfirmLoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol ConfirmLoginViewProtocol: AnyObject  {
    func openOrdersView()
}

// То, что выполняю в здесь
protocol ConfirmLoginViewPresenterProtocol: AnyObject {
    init(view: ConfirmLoginViewProtocol)
    func sendSMSAgain()
    func getAuthKey()
}

class ConfirmLoginPresenter: ConfirmLoginViewPresenterProtocol {
    weak var view: ConfirmLoginViewProtocol?
    // Тут можно объявить модель
    required init(view: ConfirmLoginViewProtocol) {
        self.view = view
    }
    let nv = NetworkManager()
    
    func sendSMSAgain() {
        nv.postRequest(url: URLs.Auth.getSMS, headers: [], body: ["phone": Properties.phoneNumber]) //77012559804
        print("Номер телефона: ", Properties.phoneNumber)
    }
    
    func getAuthKey() {
      //  if Properties.smsCode != nil{
            nv.postRequest(url: URLs.Auth.loginByCode,
                           headers: [],
                           body: ["phone": Properties.phoneNumber, "code": Properties.smsCode ?? ""],
                           model: UserResponse.self) { post in
                
                print("Ключ: ", post.authKey ?? "Нет данных")
                Properties.bearer = post.authKey ?? ""
                if Properties.bearer != ""{
                    self.view?.openOrdersView()
                    
               // } else{
                    // alert
               // }
            }
        }
    }
}

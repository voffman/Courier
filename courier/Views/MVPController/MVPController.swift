//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

protocol MVPControllerProtocol {
    func showErrorView(errorResponseData: ErrorResponse?)
    func showErrorView(errorResponseData: ErrorResponse?, action: Selector)
    func showAlert(name: String?, message: String?, cancelButtonSelector: Selector, sendButtonSelector: Selector, cancelButtonTitle: String?, sendButtonTitle: String?)
    func showLoadingView(isHidden: Bool)
    func showContentView(isHidden: Bool)
    func showMessage(title: String?, message: String)
    
}

class MVPController: UIViewController, MVPControllerProtocol {
    
    private let errorView = ErrorView()
    private let alertView = AlertView()
    private let loadingView = LoadingView()
    private let contentView = ContentView()
    private let messageView = MessageView()

    @objc func errorButtonAction(){
        self.navigationController?.navigationBar.layer.zPosition = +1
        self.tabBarController?.tabBar.layer.zPosition = +1
        errorView.errorView?.isHidden = true
    }
 
    func showErrorView(errorResponseData: ErrorResponse?){
        self.navigationController?.navigationBar.layer.zPosition = -1
        self.tabBarController?.tabBar.layer.zPosition = -1
        errorView.sendButton.addTarget(self, action: #selector(errorButtonAction), for: .touchUpInside)
        errorView.configureData(errorResponseData: errorResponseData ?? ErrorResponse(name: "Неизвестная ошибка!", message: "Попробуйте обновить приложение", code: 0, status: 0, type: "Нет данных"))
        errorView.showErrorView(onVC: self)
    }
    
    func showErrorView(errorResponseData: ErrorResponse?, action: Selector){
        self.navigationController?.navigationBar.layer.zPosition = -1
        self.tabBarController?.tabBar.layer.zPosition = -1
        errorView.sendButton.addTarget(self, action: action, for: .touchUpInside)
        errorView.configureData(errorResponseData: errorResponseData ?? ErrorResponse(name: "Неизвестная ошибка!", message: "Попробуйте обновить приложение", code: 0, status: 0, type: "Нет данных"))
        errorView.showErrorView(onVC: self)
    }
    
    func showAlert(name: String?, message: String?, cancelButtonSelector: Selector, sendButtonSelector: Selector, cancelButtonTitle: String? = "ОТМЕНА", sendButtonTitle: String? = "ПОДТВЕРДИТЬ"){
        self.navigationController?.navigationBar.layer.zPosition = -1
        self.tabBarController?.tabBar.layer.zPosition = -1
        
        alertView.cancelButton.title = cancelButtonTitle
        alertView.sendButton.title = sendButtonTitle
        
        alertView.cancelButton.setButton()
        alertView.sendButton.setButton()
        
        alertView.sendButton.addTarget(self, action: sendButtonSelector, for: .touchUpInside)
        alertView.cancelButton.addTarget(self, action: cancelButtonSelector, for: .touchUpInside)
        
        alertView.configureData(name: name, message: message, cancelButton: cancelButtonTitle, sendButton: sendButtonTitle)
        alertView.showAlertView(onVC: self)
         
    }
    
    func dismissAlertView(){
        self.alertView.alertView?.isHidden = true
        
        self.navigationController?.navigationBar.layer.zPosition = +1
        self.tabBarController?.tabBar.layer.zPosition = +1
    }
    
    func showLoadingView(isHidden: Bool){
        loadingView.showLoadingView(onView: self.view, isHidden: isHidden)
    }
    
    func showContentView(isHidden: Bool){
        contentView.showContentView(onView: self.view, isHidden: isHidden)
    }
    
  @objc func showMessageAction() {
      self.messageView.messageView?.isHidden = true
      
      self.navigationController?.navigationBar.layer.zPosition = +1
      self.tabBarController?.tabBar.layer.zPosition = +1
    }
    
    func showMessage(title: String? = "Внимание", message: String){
        print("Message: \(message)")
        
        self.navigationController?.navigationBar.layer.zPosition = -1
        self.tabBarController?.tabBar.layer.zPosition = -1
        

        messageView.configureData(name: title, message: message)
        messageView.showMessageView(onVC: self)
        messageView.okButton.addTarget(self, action: #selector(showMessageAction), for: .touchUpInside)
    }
    
    //func createPresenter -> T{}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
}

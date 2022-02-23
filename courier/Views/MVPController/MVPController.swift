//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

protocol MVPControllerProtocol {
    func showErrorView(errorResponseData: ErrorResponse?)
    func showAlert(name: String?, message: String?, cancelButton: String?, sendButton: String?)
    func showLoadingView(isHidden: Bool)
    func showContentView(isHidden: Bool)
    func showMessage(message: String)
    
}

class MVPController: UIViewController, MVPControllerProtocol {
    // Для привязки различных действий к кнопкам - можно использовать enum
    
    private let errorView = ErrorView()
    private let alertView = AlertView()
    private let loadingView = LoadingView()
    private let contentView = ContentView()

    @objc func errorButtonAction(){
        errorView.errorView?.isHidden = true
    }
    
    @objc func alertPrimaryButtonAction(){
        alertView.alertView?.isHidden = true
    }
    
    @objc func alertNormalButtonAction(){
        alertView.alertView?.isHidden = true
    }
    
 
    func showErrorView(errorResponseData: ErrorResponse?){
        
        errorView.sendButton.addTarget(self, action: #selector(errorButtonAction), for: .touchUpInside)
        errorView.configureData(errorResponseData: errorResponseData ?? ErrorResponse(name: "Неизвестная ошибка!", message: "Попробуйте обновить приложение", code: 0, status: 0, type: "Нет данных"))
        errorView.showErrorView(onVC: self)
    }
    
    func showAlert(name: String?, message: String?, cancelButton: String? = "Отмена", sendButton: String? = "Подтвердить"){
        
        alertView.sendButton.addTarget(self, action: #selector(alertPrimaryButtonAction), for: .touchUpInside)
        alertView.cancelButton.addTarget(self, action: #selector(alertNormalButtonAction), for: .touchUpInside)
        
        alertView.configureData(name: name, message: message, cancelButton: cancelButton, sendButton: sendButton)
        alertView.showAlertView(onVC: self)
         
    }
    
    func showLoadingView(isHidden: Bool){
        loadingView.showLoadingView(onView: self.view, isHidden: isHidden)
    }
    
    func showContentView(isHidden: Bool){
        contentView.showContentView(onView: self.view, isHidden: isHidden)
    }
    
    func showMessage(message: String){
        print("Message: \(message)")
    }
    
    //func createPresenter -> T{}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: self.view.addSubview(*view) -> выводится под вью (cardView) наследника
        self.navigationController?.isNavigationBarHidden = true
    }
}

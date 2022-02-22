//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

protocol MVPControllerProtocol {
    func showErrorView(errorResponseData: ErrorResponse?)
    func showLoadingView(isEnabled: Bool)
    func showMessage(message: String)
    func showAlert(isEnabled: Bool, name: String?, message: String?, cancelButton: String?, sendButton: String?)
}
// realizovany
class MVPController: UIViewController, MVPControllerProtocol {
    // Для привязки различных действий к кнопкам - можно использовать enum
    
    private let errorView = ErrorView()
    private let alertView = AlertView()
    
    
    @objc func errorButtonAction(){
        errorView.removeErrorView()
    }
    
    @objc func alertPrimaryButtonAction(){
        alertView.removeAlertView()
    }
    
    @objc func alertNormalButtonAction(){
        alertView.removeAlertView()
    }
    
    // состоит из подъвью
    func showErrorView(errorResponseData: ErrorResponse?){
        
        errorView.sendButton.addTarget(self, action: #selector(errorButtonAction), for: .touchUpInside)
        errorView.configureData(errorResponseData: errorResponseData ?? ErrorResponse(name: "Неизвестная ошибка!", message: "Попробуйте обновить приложение", code: 0, status: 0, type: "Нет данных"))
        errorView.showErrorView(onVC: self)
        errorView.modalTransitionStyle = .crossDissolve
        errorView.modalPresentationStyle = .overFullScreen
        self.present(errorView, animated: true, completion: nil)
        
        
    } // errorResponse в параметрах, здесь его распарсить и вывести коды ошибок из джейсона
    
    func showLoadingView(isEnabled: Bool){
        let loadingView = LoadingView()
        
        switch isEnabled{
            
        case true:
            loadingView.showSpinner(onView: self.view)
            
        case false:
            loadingView.removeSpinner()
            
            break
        }
    }
    
    func showContentView(isEnabled: Bool){
        let contentView = ContentView()
        
        switch isEnabled{
            
        case true:
            contentView.showContentView(onView: self.view)
            
        case false:
            contentView.removeContentView()
            
            break
        }
    }
    
    func showMessage(message: String){
        print("Message: \(message)")
    }
    
    func showAlert(isEnabled: Bool, name: String?, message: String?, cancelButton: String? = "Отмена", sendButton: String? = "Подтвердить"){
        switch isEnabled{
            
        case true:
            alertView.sendButton.addTarget(self, action: #selector(alertPrimaryButtonAction), for: .touchUpInside)
            alertView.cancelButton.addTarget(self, action: #selector(alertNormalButtonAction), for: .touchUpInside)
            
            alertView.configureData(name: name, message: message, cancelButton: cancelButton, sendButton: sendButton)
            alertView.showAlertView(onVC: self)
            alertView.modalPresentationStyle = .overFullScreen
            self.present(alertView, animated: true, completion: nil)
            
        case false:
            alertView.removeAlertView()
            
            break
        }
    }
    
    //func createPresenter -> T{}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //showLoadingView(isEnabled: true)
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

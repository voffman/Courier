//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

class MVPController: UIViewController {

    var targetVC = UIViewController()
    
    let presenter: MVPControllerPresenterProtocol? = nil
    
    // Для привязки различных действий к кнопкам - можно использовать enum

    private let errorView = ErrorView()
    private let alertView = AlertView()
    
    
    @objc func errorButtonAction(){
        errorView.dismiss(animated: true, completion: nil)
    }
    
    @objc func alertPrimaryButtonAction(){
        alertView.dismiss(animated: true, completion: nil)
    }
    
    @objc func alertNormalButtonAction(){
        alertView.dismiss(animated: true, completion: nil)
        print("Alert 2 экшн")
    }
    
    // состоит из подъвью
    func showErrorView(isEnabled: Bool, targetVC: UIViewController, errorResponseData: ErrorResponse?){
        
        switch isEnabled{
            
        case true:
            errorView.sendButton.addTarget(self, action: #selector(errorButtonAction), for: .touchUpInside)
            errorView.configureData(errorResponseData: errorResponseData ?? ErrorResponse(name: "Неизвестная ошибка!", message: "Попробуйте обновить приложение", code: 0, status: 0, type: "Нет данных"))
            errorView.showErrorView()
            errorView.modalPresentationStyle = .overFullScreen
            targetVC.present(errorView, animated: true, completion: nil)
            
        case false:
            errorView.removeErrorView()
            
            break
        }
    } // errorResponse в параметрах, здесь его распарсить и вывести коды ошибок из джейсона
    
    func showLoadingView(isEnabled: Bool, targetView: UIView){
        let loadingView = LoadingView()
        
        switch isEnabled{
            
        case true:
            loadingView.showSpinner(onView: targetView)
            
        case false:
            loadingView.removeSpinner()
            
            break
        }
    }
    
    func showContentView(isEnabled: Bool, targetView: UIView){
        let contentView = ContentView()

        switch isEnabled{
            
        case true:
            contentView.showContentView(onView: targetView)
            
        case false:
            contentView.removeContentView()
            
            break
        }
    }
    
    func showMessage(message: String){
        print("Message: \(message)")
    }
    
    func showAlert(isEnabled: Bool, targetVC: UIViewController, name: String?, message: String?, cancelButton: String? = "Отмена", sendButton: String? = "Подтвердить"){
        switch isEnabled{
            
        case true:
            alertView.sendButton.addTarget(self, action: #selector(alertPrimaryButtonAction), for: .touchUpInside)
            alertView.cancelButton.addTarget(self, action: #selector(alertNormalButtonAction), for: .touchUpInside)
            
            alertView.configureData(name: name, message: message, cancelButton: cancelButton, sendButton: sendButton)
            alertView.showAlertView()
            alertView.modalPresentationStyle = .overFullScreen
            targetVC.present(alertView, animated: true, completion: nil)

        case false:
            alertView.removeAlertView()
            
            break
        }
    }
    
    //func createPresenter -> T{}

    override func viewDidLoad() {
        super.viewDidLoad()

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

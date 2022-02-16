//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

class MVPController: UIViewController {
    
    var targetView = UIView()
    
    let presenter: MVPControllerPresenterProtocol? = nil
    
    @objc func errorButtonAction(){
        
    }
    
    @objc func alertPrimaryButtonAction(){
        
    }
    
    @objc func alertNormalButtonAction(){
        
    }
    
    // состоит из подъвью
    func showErrorView(isEnabled: Bool){
        let errorView = ErrorView()
        errorView.sendButton.addTarget(self, action: #selector(errorButtonAction), for: .touchUpInside)
        
        switch isEnabled{
            
        case true:
            errorView.showErrorView(onView: targetView)
            
        case false:
            errorView.removeErrorView()
            
            break
        }
    } // errorResponse в параметрах, здесь его распарсить и вывести коды ошибок из джейсона
    
    func showLoadingView(isEnabled: Bool){
        let loadingView = LoadingView()
        
        switch isEnabled{
            
        case true:
            loadingView.showSpinner(onView: targetView)
            
        case false:
            loadingView.removeSpinner()
            
            break
        }
    }
    
    func showContentView(isEnabled: Bool){
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
    
    func showAlert(isEnabled: Bool){
        let alertView = AlertView()

        switch isEnabled{
            
        case true:
            alertView.showAlertView(onView: targetView)
            
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

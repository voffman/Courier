//
//  MVPController.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import UIKit

class MVPController: UIViewController {
    
    
    // состоит из подъвью
    func showErrorView(){} // errorResponse в параметрах, здесь его распарсить и вывести коды ошибок из джейсона
    func showLoadingView(){}
    func showContentView(){}
    
    func showMessage(){
        
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

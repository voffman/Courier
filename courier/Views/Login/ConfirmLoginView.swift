//
//  CofirmLoginView.swift
//  courier
//
//  Created by Владимир Свиридов on 19.01.2022.
//

import UIKit

class ConfirmLoginView: UIViewController {

    var viewElementsLibrary = ViewElementsLibrary()
    
    func setupViewPlane(){
        view.addSubview(viewElementsLibrary.viewPlane)
        
        viewElementsLibrary.viewPlane.translatesAutoresizingMaskIntoConstraints = false

        viewElementsLibrary.viewPlane.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary.viewPlane.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.viewPlane.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        viewElementsLibrary.viewPlane.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        viewElementsLibrary.viewPlane.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        viewElementsLibrary.viewPlane.heightAnchor.constraint(equalToConstant: 394).isActive = true
        viewElementsLibrary.viewPlane.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupBoldLabel(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.boldLabel)
        viewElementsLibrary.boldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary.boldLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.topAnchor, constant: 39).isActive = true
        viewElementsLibrary.boldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func setupRegularLabel(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.regularLabel)
        viewElementsLibrary.regularLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary.regularLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        viewElementsLibrary.regularLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.boldLabel.bottomAnchor, constant: 25).isActive = true
        viewElementsLibrary.regularLabel.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        
    }
    
    func setupLightLabel(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.lightLabel)
        viewElementsLibrary.lightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary.lightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.lightLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.regularLabel.bottomAnchor, constant: 45).isActive = true
        viewElementsLibrary.lightLabel.text = "Отправить еще раз через 0:50 сек"
    }
    
    
    func setupSendAgainButton(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.orangeButton)
        viewElementsLibrary.orangeButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary.orangeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.orangeButton.topAnchor.constraint(equalTo:  viewElementsLibrary.regularLabel.bottomAnchor, constant: 30).isActive = true
        viewElementsLibrary.orangeButton.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary.orangeButton.rightAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.rightAnchor, constant: -20).isActive = true
        viewElementsLibrary.orangeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        viewElementsLibrary.orangeButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        viewElementsLibrary.orangeButton.setTitle("ОТПРАВИТЬ ЕЩЕ РАЗ", for: .normal)
        viewElementsLibrary.orangeButton.addTarget(self, action: #selector(sendAgainButtonAction), for: .touchUpInside)

    }
    
    let viewElementsLibrary2 = ViewElementsLibrary() // собственно отличие класса от структуры
    
    func setupLightLabel2(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary2.lightLabel)
        viewElementsLibrary2.lightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary2.lightLabel.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary2.lightLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.regularLabel.bottomAnchor, constant: 100).isActive = true
        viewElementsLibrary2.lightLabel.text = "Код подтверждения"
        
    }
    
    func setupTextField(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.textField)
        
        viewElementsLibrary.textField.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary.textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.textField.topAnchor.constraint(equalTo:  viewElementsLibrary2.lightLabel.bottomAnchor, constant: 10).isActive = true
        viewElementsLibrary.textField.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary.textField.rightAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.rightAnchor, constant: -20).isActive = true
        
        viewElementsLibrary.textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewElementsLibrary.textField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
    }
    
    func setupConfirmButton(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary2.orangeButton)

        viewElementsLibrary2.orangeButton.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary2.orangeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary2.orangeButton.topAnchor.constraint(equalTo:  viewElementsLibrary.textField.bottomAnchor, constant: 10).isActive = true
        viewElementsLibrary2.orangeButton.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary2.orangeButton.rightAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.rightAnchor, constant: -20).isActive = true
        viewElementsLibrary2.orangeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        viewElementsLibrary2.orangeButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        viewElementsLibrary2.orangeButton.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        
        viewElementsLibrary2.orangeButton.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
    }
 
    
    @objc func confirmButtonAction(sender: UIButton!){
        let confirmLoginView2 = ConfirmLoginView()
        confirmLoginView2.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        self.present(confirmLoginView2, animated: true)
    }

    @objc func sendAgainButtonAction(sender: UIButton!){
        // Заглушка
        setupLightLabel()
        viewElementsLibrary.orangeButton.isHidden = true
    }

    
    func setupView(){
        view.backgroundColor = Colors.lightGray
        setupViewPlane()
        setupBoldLabel()
        setupRegularLabel()
       // setupLightLabel()
        setupSendAgainButton()
        setupLightLabel2()
        setupTextField()
        setupConfirmButton()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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


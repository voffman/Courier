//
//  ViewController.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit

class LoginView: UIViewController {
    
    var viewElementsLibrary = ViewElementsLibrary()
    
    func setupViewPlane(){
        view.addSubview(viewElementsLibrary.viewPlane)
        
        viewElementsLibrary.viewPlane.translatesAutoresizingMaskIntoConstraints = false

        viewElementsLibrary.viewPlane.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary.viewPlane.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.viewPlane.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        viewElementsLibrary.viewPlane.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        viewElementsLibrary.viewPlane.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        viewElementsLibrary.viewPlane.heightAnchor.constraint(equalToConstant: 254).isActive = true
        viewElementsLibrary.viewPlane.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupBoldLabel(){
        
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.boldLabel)
        viewElementsLibrary.boldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // связываем левую сторону маленького вью с левой стороной большого вью
        viewElementsLibrary.boldLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.topAnchor, constant: 39).isActive = true
        viewElementsLibrary.boldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLightLabel(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.lightLabel)
        
        viewElementsLibrary.lightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewElementsLibrary.lightLabel.topAnchor.constraint(equalTo:  viewElementsLibrary.boldLabel.bottomAnchor, constant: 25).isActive = true
        viewElementsLibrary.lightLabel.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        
    }
    
    func setupTextField(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.textField)
        
        viewElementsLibrary.textField.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary.textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.textField.topAnchor.constraint(equalTo:  viewElementsLibrary.lightLabel.bottomAnchor, constant: 10).isActive = true
        viewElementsLibrary.textField.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary.textField.rightAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.rightAnchor, constant: -20).isActive = true
        
        viewElementsLibrary.textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewElementsLibrary.textField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        viewElementsLibrary.textField.placeholder =  "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _"
    
        
    }
    
    func setupLoginButton(){
        viewElementsLibrary.viewPlane.addSubview(viewElementsLibrary.orangeButton)
        
        viewElementsLibrary.orangeButton.translatesAutoresizingMaskIntoConstraints = false

        viewElementsLibrary.orangeButton.translatesAutoresizingMaskIntoConstraints = false
        viewElementsLibrary.orangeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewElementsLibrary.orangeButton.topAnchor.constraint(equalTo:  viewElementsLibrary.textField.bottomAnchor, constant: 10).isActive = true
        viewElementsLibrary.orangeButton.leftAnchor.constraint(equalTo: viewElementsLibrary.viewPlane.leftAnchor, constant: 20).isActive = true
        viewElementsLibrary.orangeButton.rightAnchor.constraint(equalTo:  viewElementsLibrary.viewPlane.rightAnchor, constant: -20).isActive = true
        viewElementsLibrary.orangeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        viewElementsLibrary.orangeButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        viewElementsLibrary.orangeButton.addTarget(self, action: #selector(orangeButtonAction), for: .touchUpInside)
    }
    
    func setupView(){
        view.backgroundColor = Colors.lightGray // условно
        
        setupViewPlane()
        setupBoldLabel()
        setupLightLabel()
        setupTextField()
        setupLoginButton()
    }
    
    @objc func orangeButtonAction(sender: UIButton!){
        let cofirmLoginView = ConfirmLoginView()
        cofirmLoginView.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        self.present(cofirmLoginView, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
        
    }
}

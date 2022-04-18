//
//  ViewController.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit
// 77012559804


class LoginView: MVPController {
        
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Вход для курьеров", textSize: 24, style: .bold)
    let phoneNumberLabel = CustomLabels(title: "Номер телефона", textSize: 12, style: .light)
    let phoneNumberTextField = CustomTextFields(pHolder: "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _", style: .withPhoneNumberFormatter)
    let loginButton = CustomButtons(title: "ВОЙТИ", style: .primary)
    
    private var presenter: LoginViewPresenterProtocol?
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        
        cardView.addSubview(titleLabel)
        titleLabel.setLabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 39).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupPhoneNumberLabel(){
        cardView.addSubview(phoneNumberLabel)
        phoneNumberLabel.setLabel()
        
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 25).isActive = true
        phoneNumberLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        
    }
    
    func setupPhoneNumberTextField(){
        cardView.addSubview(phoneNumberTextField)
        phoneNumberTextField.setTextField()
        
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumberTextField.topAnchor.constraint(equalTo:  phoneNumberLabel.bottomAnchor, constant: 10).isActive = true
        phoneNumberTextField.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        phoneNumberTextField.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        phoneNumberTextField.placeholder =  "  + 7 ( _ _ _ ) _ _ _ - _ _ - _ _"

        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        textField.text = text.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
        phoneNumberTextField.text = String(phoneNumberTextField.text!.prefix(24))
    }
    
    func setupLoginButton(){
        
        loginButton.setButton()
        
        cardView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo:  phoneNumberTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 20).isActive = true
        loginButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        
    }
    
    func setupView(){

        view.backgroundColor = Colors.backgroundColor
        
        setupCardView()
        setupTitleLabel()
        setupPhoneNumberLabel()
        setupPhoneNumberTextField()
        setupLoginButton()
    }
    
    @objc func loginButtonAction(sender: UIButton!){
        
        if phoneNumberTextField.text?.count == 0 {
            showMessage(message: "Введите номер телефона")
        }
        else {
            presenter?.sendSMS(phoneNumber: phoneNumberTextField.text)
            // презентер никогда не запрашивает данные от вью
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let presenter = LoginPresenter(view:  self)
        self.presenter = presenter
        setupView()
    }
}

// То, что выполняю во вью
protocol LoginViewProtocol: AnyObject, MVPControllerProtocol  {
    func goToConfirmLoginView()
    func popVC()
}

extension LoginView: LoginViewProtocol{

    func goToConfirmLoginView() {
        let vc = ConfirmLoginView(phoneNumber: phoneNumberTextField.text ?? "")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func popVC() {
        self.dismiss(animated: true, completion: nil)
    }
}



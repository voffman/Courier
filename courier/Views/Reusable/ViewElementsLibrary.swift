//
//  ReusableViewElements.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit

class ViewElementsLibrary: UIView {
    
    // MARK: надписи
    
    lazy var boldLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход для курьеров"
        label.font = UIFont.boldSystemFont(ofSize: 24.0) // в макете 24, кратно 4 и чуть больше может быть
        label.textColor = Colors.black
        
        return label
    }()
    
    lazy var regularLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы отправили СМС с кодом подтверждения на номер +7 (000) 000-00-00"
        label.font = UIFont.systemFont(ofSize: 14.0) // в макете 14
        label.textColor = Colors.black
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lightLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.font = UIFont.systemFont(ofSize: 12.0) // в макете 12
        label.textColor = Colors.gray
        
        return label
    }()
    
    // MARK: View
    
    lazy var viewPlane: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 243, width: 340, height: 254)
        view.backgroundColor = Colors.white
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2 // Условно
        view.layer.shadowOpacity = 0.21
        
        return view
    }()
    
    // MARK: Кнопки
    
    lazy var orangeButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.orange
        button.layer.cornerRadius = 4 // условно
        button.setTitle("ВОЙТИ", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        
        return button
    }()
    
    lazy var lightGreyButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.lightGray
        button.layer.cornerRadius = 4 // условно
        button.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        button.setTitleColor(Colors.darkGray, for: .normal)
        
        return button
    }()

    // MARK: Поля для заполнения
    
    lazy var textField: UITextField = {
        let textField = UITextField()

        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 0.4
        textField.layer.borderColor = Colors.gray.cgColor
        
        return textField
    }()
}


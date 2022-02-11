//
//  ProfileView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class ProfileView: UIViewController {
    
    let cardView = CustomViews(style: .withShadow)
    let profileImage = UIImageView(image: UIImage(named: "Profile"))
    let courierNameLabel = CustomLabels(title: "Валерий Пономарев", textSize: 16, style: .bold, alignment: .center)
    let inventoryLabel = CustomLabels(title: "Инвентарь: #023", textSize: 14, style: .regular, alignment: .center)
    let firstLineImage = UIImageView(image: UIImage(named: "Line"))
    let colorSchemeTitleLabel = CustomLabels(title: "Цветовая тема", textSize: 14, style: .bold)
    let colorSchemeImage = UIImageView(image: UIImage(named: "Palette"))
    let colorSchemeLabel = CustomLabels(title: "Светлая", textSize: 14, style: .regular)
    let colorSchemeSwitch = UISwitch()
    let secondLineImage = UIImageView(image: UIImage(named: "Line"))
    let activityStatusTitleLabel = CustomLabels(title: "Статус активности", textSize: 14, style: .bold)
    let activityStatusImage = UIImageView(image: UIImage(named: "Switch"))
    let activityStatusLabel = CustomLabels(title: "Активен", textSize: 14, style: .regular)
    let activityStatusSwitch = UISwitch()
    let thirdLineImage = UIImageView(image: UIImage(named: "Line"))
    let navigationTitleLabel = CustomLabels(title: "Навигация", textSize: 14, style: .bold)
    let navigationImage = UIImageView(image: UIImage(named: "Navigation"))
    let navigationLabel = CustomLabels(title: "2ГИС", textSize: 14, style: .light)
    let navigationArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    let fourthLineImage = UIImageView(image: UIImage(named: "Line"))
    let exitImage = UIImageView(image: UIImage(named: "ExitArrow"))
    let exitTitleLabel = CustomLabels(title: "Выйти из аккаунта", textSize: 16, style: .regular)
    let exitArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, title: "Профиль", navigationBarStyle: .withoutBackButton)
        navigationBar.setupNavigationBar()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     
   // MARK: Поправить
        if #available(iOS 11.0, *) {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.25).isActive = true
        } else {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.25).isActive = true
        }
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 386).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true

    }
    
    func setupProfileImage(){
        view.addSubview(profileImage)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: -20).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupCourierNameLabel(){
        view.addSubview(courierNameLabel)
        courierNameLabel.setLabel()
        
        courierNameLabel.translatesAutoresizingMaskIntoConstraints = false
        courierNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 28).isActive = true
        courierNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupInventoryLabel(){
        view.addSubview(inventoryLabel)
        inventoryLabel.setLabel()
        
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        inventoryLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 60).isActive = true
        inventoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupFirstLineImage(){
        view.addSubview(firstLineImage)
        
        firstLineImage.translatesAutoresizingMaskIntoConstraints = false
        firstLineImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 95).isActive = true
        firstLineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupColorSchemeTitleLabel(){
        view.addSubview(colorSchemeTitleLabel)
        colorSchemeTitleLabel.setLabel()
        
        colorSchemeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 130).isActive = true
        colorSchemeTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
        
    }
    
    func setupColorSchemeImage(){
        view.addSubview(colorSchemeImage)
        
        colorSchemeImage.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 141).isActive = true
        colorSchemeImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
    }
    
    func setupColorSchemeLabel(){
        view.addSubview(colorSchemeLabel)
        colorSchemeLabel.setLabel()
        
        colorSchemeLabel.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 152).isActive = true
        colorSchemeLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupColorSchemeSwitch(){
        view.addSubview(colorSchemeSwitch)
        
        colorSchemeSwitch.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeSwitch.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 134).isActive = true
        colorSchemeSwitch.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
    }
    
    func setupSecondLineImage(){
        view.addSubview(secondLineImage)
        
        secondLineImage.translatesAutoresizingMaskIntoConstraints = false
        secondLineImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 185).isActive = true
        secondLineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupActivityStatusTitleLabel(){
        view.addSubview(activityStatusTitleLabel)
        activityStatusTitleLabel.setLabel()
        
        activityStatusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        activityStatusTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 200).isActive = true
        activityStatusTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupActivityStatusImage(){
        view.addSubview(activityStatusImage)
        
        activityStatusImage.translatesAutoresizingMaskIntoConstraints = false
        activityStatusImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 215).isActive = true
        activityStatusImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
        
        
    }
    
    func setupActivityStatusLabel(){
        view.addSubview(activityStatusLabel)
        activityStatusLabel.setLabel()
        
        activityStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        activityStatusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 222).isActive = true
        activityStatusLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupActivityStatusSwitch(){
        view.addSubview(activityStatusSwitch)
        
        activityStatusSwitch.translatesAutoresizingMaskIntoConstraints = false
        activityStatusSwitch.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 205).isActive = true
        activityStatusSwitch.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
        
    }
    
    func setupThirdLineImage(){
        view.addSubview(thirdLineImage)
        
        thirdLineImage.translatesAutoresizingMaskIntoConstraints = false
        thirdLineImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 255).isActive = true
        thirdLineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupNavigationTitleLabel(){
        view.addSubview(navigationTitleLabel)
        navigationTitleLabel.setLabel()
        
        navigationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 270).isActive = true
        navigationTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
        
    }
    
    func setupNavigationImage(){
        view.addSubview(navigationImage)
        
        navigationImage.translatesAutoresizingMaskIntoConstraints = false
        navigationImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 280).isActive = true
        navigationImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true

    }
    
    func setupNavigationLabel(){
        view.addSubview(navigationLabel)
        navigationLabel.setLabel()
        
        navigationLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 292).isActive = true
        navigationLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true

    }
    
    func setupNavigationArrowButtonImage(){
        view.addSubview(navigationArrowButtonImage)
        
        navigationArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
        navigationArrowButtonImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 285).isActive = true
        navigationArrowButtonImage.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
    }
    
    func setupFourthLineImage(){
        view.addSubview(fourthLineImage)
        
        fourthLineImage.translatesAutoresizingMaskIntoConstraints = false
        fourthLineImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 325).isActive = true
        fourthLineImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupExitImage(){
        view.addSubview(exitImage)
        
        exitImage.translatesAutoresizingMaskIntoConstraints = false
        exitImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 348).isActive = true
        exitImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
    }
    
    func setupExitTitleLabel(){
        view.addSubview(exitTitleLabel)
        exitTitleLabel.setLabel()
        
        exitTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        exitTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 343).isActive = true
        exitTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupExitArrowButtonImage(){
        view.addSubview(exitArrowButtonImage)
        
        exitArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
        exitArrowButtonImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 348).isActive = true
        exitArrowButtonImage.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
    }
    
    func setupView(){
        self.view.backgroundColor = Colors.backgroundColor
        setupCardView()
        setupProfileImage()
        setupCourierNameLabel()
        setupInventoryLabel()
        setupFirstLineImage()
        setupColorSchemeTitleLabel()
        setupColorSchemeImage()
        setupColorSchemeLabel()
        setupColorSchemeSwitch()
        setupSecondLineImage()
        setupActivityStatusTitleLabel()
        setupActivityStatusImage()
        setupActivityStatusLabel()
        setupActivityStatusSwitch()
        setupThirdLineImage()
        setupNavigationTitleLabel()
        setupNavigationImage()
        setupNavigationLabel()
        setupNavigationArrowButtonImage()
        setupFourthLineImage()
        setupExitImage()
        setupExitTitleLabel()
        setupExitArrowButtonImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupView()
        
    }

}

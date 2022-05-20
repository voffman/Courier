//
//  ProfileView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class ProfileView: MVPController {
    
    let colors = Colors()
    
    let cardView = CustomViews(style: .withShadow)
    let profileBackgroundView = CustomViews(style: .circle)
    let profileBorderView = CustomViews(cicrleWidth: 48, circleHeight: 48)
    let profileImage = UIImageView(image: UIImage(named: "Avatar"))
    let courierNameLabel = CustomLabels(title: "Пользователь", textSize: 16, style: .bold, alignment: .center)
    let inventoryLabel = CustomLabels(title: "Инвентарь: #", textSize: 14, style: .regular, alignment: .center)
    let firstDividerView = CustomViews(style: .divider)
    let colorSchemeTitleLabel = CustomLabels(title: "Цветовая тема", textSize: 14, style: .bold)
    let colorSchemeImage = UIImageView(image: UIImage(named: "Palette")?.withRenderingMode(.alwaysTemplate))
    let colorSchemeLabel = CustomLabels(title: "Светлая", textSize: 14, style: .regular)
    let colorSchemeSwitch = UISwitch()
    let secondDividerView = CustomViews(style: .divider)
    let activityStatusTitleLabel = CustomLabels(title: "Статус активности", textSize: 14, style: .bold)
    let activityStatusImage = UIImageView(image: UIImage(named: "Switch")?.withRenderingMode(.alwaysTemplate))
    let activityStatusLabel = CustomLabels(title: "Неизвестно", textSize: 14, style: .regular)
    let activityStatusSwitch = UISwitch()
    let thirdDividerView = CustomViews(style: .divider)
    let navigationSettingTitleLabel = CustomLabels(title: "Навигация", textSize: 14, style: .bold)
    let navigationSettingImage = UIImageView(image: UIImage(named: "Navigation")?.withRenderingMode(.alwaysTemplate))
    let navigationSettingLabel = CustomLabels(title: "Нет данных", textSize: 14, style: .light)
    let navigationSettingArrowButtonImage = UIImageView(image: UIImage(named: "Arrow")?.withRenderingMode(.alwaysTemplate))
    let navigationSettingButton = CustomButtons(title: "", style: .transparent)
    let fourthDividerView = CustomViews(style: .divider)
    let exitImage = UIImageView(image: UIImage(named: "ExitArrow")?.withRenderingMode(.alwaysTemplate))
    let exitTitleLabel = CustomLabels(title: "Выйти из аккаунта", textSize: 16, style: .regular)
//    let exitArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    let exitButton = CustomButtons(title: "", style: .transparent)
    
    private var presenter: ProfileViewPresenterProtocol?
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if #available(iOS 11, *) {
            cardView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
            
        } else {
        if UIScreen.main.bounds.size.height > 750 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
        }
        
        if UIScreen.main.bounds.size.height > 640 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 640 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/6.5).isActive = true
        }
        }
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 386).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true

    }
    
    func setupProfileBorderView(){
        view.addSubview(profileBorderView)
        profileBorderView.setView()
        profileBorderView.translatesAutoresizingMaskIntoConstraints = false
        profileBorderView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: -24).isActive = true
        profileBorderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileBorderView.backgroundColor = Colors.backgroundColor
    }
    
    func setupProfileBackgroundView(){
        profileBorderView.addSubview(profileBackgroundView)
        profileBackgroundView.setView()
        profileBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        profileBackgroundView.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor).isActive = true
        profileBackgroundView.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor).isActive = true
    }
    
    func setupProfileImage() {
        profileBackgroundView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerXAnchor.constraint(equalTo: profileBackgroundView.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: profileBackgroundView.centerYAnchor).isActive = true
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
    
    func setupFirstDividerView(){
        view.addSubview(firstDividerView)
        firstDividerView.setView()
        firstDividerView.translatesAutoresizingMaskIntoConstraints = false
        firstDividerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 95).isActive = true
        firstDividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstDividerView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        firstDividerView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true

    }
    
    func setupColorSchemeTitleLabel(){
        view.addSubview(colorSchemeTitleLabel)
        colorSchemeTitleLabel.setLabel()
        
        colorSchemeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 110).isActive = true
        colorSchemeTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
        
    }
    
    func setupColorSchemeImage(){
        view.addSubview(colorSchemeImage)
        colorSchemeImage.tintColor = Colors.black
        colorSchemeImage.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 121).isActive = true
        colorSchemeImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
    }
    
    func setupColorSchemeLabel(){
        view.addSubview(colorSchemeLabel)
        colorSchemeLabel.setLabel()
        
        colorSchemeLabel.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 132).isActive = true
        colorSchemeLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupColorSchemeSwitch(){
        view.addSubview(colorSchemeSwitch)
        colorSchemeSwitch.isOn = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)
        colorSchemeSwitch.translatesAutoresizingMaskIntoConstraints = false
        colorSchemeSwitch.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 114).isActive = true
        colorSchemeSwitch.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
        colorSchemeSwitch.addTarget(self, action: #selector(themeSwitchStateDidChange(_:)), for: .valueChanged)
    }
    
    func setupSecondDividerView(){
        view.addSubview(secondDividerView)
        secondDividerView.setView()
        secondDividerView.translatesAutoresizingMaskIntoConstraints = false
        secondDividerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 165).isActive = true
        secondDividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondDividerView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        secondDividerView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupActivityStatusTitleLabel(){
        view.addSubview(activityStatusTitleLabel)
        activityStatusTitleLabel.setLabel()
        
        activityStatusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        activityStatusTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 180).isActive = true
        activityStatusTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupActivityStatusImage(){
        view.addSubview(activityStatusImage)
        activityStatusImage.tintColor = Colors.black
        activityStatusImage.translatesAutoresizingMaskIntoConstraints = false
        activityStatusImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 195).isActive = true
        activityStatusImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
        
        
    }
    
    func setupActivityStatusLabel(){
        view.addSubview(activityStatusLabel)
        activityStatusLabel.setLabel()
        
        activityStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        activityStatusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 202).isActive = true
        activityStatusLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
    func setupActivityStatusSwitch(){
        view.addSubview(activityStatusSwitch)
        
        activityStatusSwitch.translatesAutoresizingMaskIntoConstraints = false
        activityStatusSwitch.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 185).isActive = true
        activityStatusSwitch.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
        activityStatusSwitch.addTarget(self, action: #selector(activitySwitchStateDidChange(_:)), for: .valueChanged)
    }
    
    func setupThirdDividerView(){
        view.addSubview(thirdDividerView)
        thirdDividerView.setView()
        thirdDividerView.translatesAutoresizingMaskIntoConstraints = false
        thirdDividerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 235).isActive = true
        thirdDividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdDividerView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        thirdDividerView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupNavigationTitleLabel(){
        view.addSubview(navigationSettingTitleLabel)
        navigationSettingTitleLabel.setLabel()
        
        navigationSettingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationSettingTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 250).isActive = true
        navigationSettingTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
        
    }
    
    func setupNavigationImage(){
        view.addSubview(navigationSettingImage)
        navigationSettingImage.tintColor = Colors.black
        navigationSettingImage.translatesAutoresizingMaskIntoConstraints = false
        navigationSettingImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 260).isActive = true
        navigationSettingImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true

    }
    
    func setupNavigationLabel(){
        view.addSubview(navigationSettingLabel)
        navigationSettingLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationSettingLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 272).isActive = true
        navigationSettingLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true

    }
    
//    func setupNavigationArrowButtonImage(){
//        view.addSubview(navigationSettingArrowButtonImage)
//
//        navigationSettingArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
//        navigationSettingArrowButtonImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 285).isActive = true
//        navigationSettingArrowButtonImage.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
//    }
    
    func setupNavigationSettingButton(){
        view.addSubview(navigationSettingButton)
        navigationSettingButton.setButton()
        
        navigationSettingButton.translatesAutoresizingMaskIntoConstraints = false
        navigationSettingButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 236).isActive = true
        navigationSettingButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5).isActive = true
        navigationSettingButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5).isActive = true
        navigationSettingButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -81).isActive = true
        navigationSettingButton.setImage(UIImage(named: "Arrow"), for: .normal)
        navigationSettingButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: -UIScreen.main.bounds.width + 63)
        navigationSettingButton.addTarget(self, action: #selector(navigationSettingButtonAction(sender:)), for: .touchUpInside)
    }
    
    func setupFourthLineImage(){
        view.addSubview(fourthDividerView)
        fourthDividerView.setView()
        fourthDividerView.translatesAutoresizingMaskIntoConstraints = false
        fourthDividerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 305).isActive = true
        fourthDividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fourthDividerView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        fourthDividerView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupExitImage(){
        view.addSubview(exitImage)
        exitImage.tintColor = Colors.black
        exitImage.translatesAutoresizingMaskIntoConstraints = false
        exitImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 328).isActive = true
        exitImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
    }
    
    func setupExitTitleLabel(){
        view.addSubview(exitTitleLabel)
        exitTitleLabel.setLabel()
        
        exitTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        exitTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 323).isActive = true
        exitTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 56).isActive = true
    }
    
//    func setupExitArrowButtonImage(){
//        view.addSubview(exitArrowButtonImage)
//
//        exitArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
//        exitArrowButtonImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 348).isActive = true
//        exitArrowButtonImage.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
//    }
    
    func setupExitButton(){
        view.addSubview(exitButton)
        exitButton.setButton()
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 306).isActive = true
        exitButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5).isActive = true
        exitButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5).isActive = true
        exitButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10).isActive = true
        exitButton.setImage(UIImage(named: "Arrow"), for: .normal)
        exitButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 20, right: -UIScreen.main.bounds.width + 63)
        exitButton.addTarget(self, action: #selector(exitButtonAction(sender:)), for: .touchUpInside)
    }
    
    @objc func navigationSettingButtonAction(sender: UIButton){
        // MARK: для тестирования остановки таймера
      //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStopTracking"), object: nil)
        goToChooseNavigatorView()

    }
    
    @objc func exitButtonAction(sender: UIButton){
        presenter?.exitButtonTapped()
    }
    
    func setupView(){
        self.view.backgroundColor = Colors.backgroundColor
        setupCardView()
        setupProfileBorderView()
        setupProfileBackgroundView()
        setupProfileImage()
        setupCourierNameLabel()
        setupInventoryLabel()
        setupFirstDividerView()
        setupColorSchemeTitleLabel()
        setupColorSchemeImage()
        setupColorSchemeLabel()
        setupColorSchemeSwitch()
        setupSecondDividerView()
        setupActivityStatusTitleLabel()
        setupActivityStatusImage()
        setupActivityStatusLabel()
        setupActivityStatusSwitch()
        setupThirdDividerView()
        setupNavigationTitleLabel()
        setupNavigationImage()
        setupNavigationLabel()
      //  setupNavigationArrowButtonImage()
        setupNavigationSettingButton()
        setupFourthLineImage()
        setupExitImage()
        setupExitTitleLabel()
      //  setupExitArrowButtonImage() // вместо этого используется exitButton.imageEdgeInsets
        setupExitButton()

    }

    func checkThemeMode() {
      let isDarkMode = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)
        if isDarkMode {
            colorSchemeLabel.text = "Темная"
        }
        else {
            colorSchemeLabel.text = "Светлая"
        }
    }
    
    @objc func themeSwitchStateDidChange(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isDarkMode)
            colorSchemeLabel.text = "Темная"
            Colors.isDarkMode = true
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeChanged"), object: nil)
        }
        else{
            UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isDarkMode)
            colorSchemeLabel.text = "Светлая"
            Colors.isDarkMode = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeChanged"), object: nil)
        }
    }

    @objc func activitySwitchStateDidChange(_ sender: UISwitch){
        if (sender.isOn == true){
            presenter?.activityStatusSwitchTurnOn()
            activityStatusLabel.text = "Активен"
            activityStatusLabel.textColor = Colors.lightGreen
        }
        else {
            presenter?.activityStatusSwitchTurnOff()
            activityStatusLabel.text = "Неактивен"
            activityStatusLabel.textColor = Colors.red
        }
    }
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Профиль", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
    }
    
    func clearStubText(){
        courierNameLabel.text = ""
        inventoryLabel.text = ""
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar()
        presenter?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ProfilePresenter(view: self)
        self.presenter = presenter

        setupView()
        presenter.viewDidLoad()

        checkThemeMode()
        clearStubText()
    }
}

// То, что выполняю во вью
protocol ProfileViewProtocol: AnyObject, MVPControllerProtocol {
    func goToLoginView()
    func goToChooseNavigatorView()
    func updateSessionStatus(post: CourierSlotResponse)
    func getNavigatorValue(value: String)
    func configureData(post: EmployeeResponse)
}

extension ProfileView: ProfileViewProtocol{

    func goToLoginView() {
        let vc = LoginView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func goToChooseNavigatorView() {
        let chooseNavigatorView = ChooseNavigatorView()
        self.navigationController?.pushViewController(chooseNavigatorView, animated: true)
    }
    
    func updateSessionStatus(post: CourierSlotResponse) {
        if post.status ?? false {
            self.activityStatusLabel.text = "Активен"
            self.activityStatusLabel.textColor = Colors.lightGreen
            self.activityStatusSwitch.isOn = true
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
        }
        else {
            self.activityStatusLabel.text = "Неактивен"
            self.activityStatusLabel.textColor = Colors.red
            self.activityStatusSwitch.isOn = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
        }
    }
    
    func getNavigatorValue(value: String) {
        navigationSettingLabel.title = value
        navigationSettingLabel.setLabel()
    }
    
    func configureData(post: EmployeeResponse){
        self.courierNameLabel.text = post.fio
        self.inventoryLabel.text = "Инвентарь: \(post.inventory ?? "")"
    }

}

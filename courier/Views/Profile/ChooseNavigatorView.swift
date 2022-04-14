//
//  ChooseNavigatorView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.04.2022.
//

import UIKit

class ChooseNavigatorView: MVPController {
    
    let cardView = CustomViews(style: .withShadow)
    let gisTitleLabel = CustomLabels(title: "2ГИС", textSize: 16, style: .regular)
//    let exitArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    let gisButton = CustomButtons(title: "", style: .transparent)
    let firstDividerView = CustomViews(style: .divider)
    let yaNavTitleLabel = CustomLabels(title: "Яндекс Навигатор", textSize: 16, style: .regular)
//    let exitArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    let yaNavButton = CustomButtons(title: "", style: .transparent)
    
    private var presenter: ChooseNavigatorPresenterProtocol?
    
    func setupCardView(){
        view.addSubview(cardView)
        cardView.setView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if UIScreen.main.bounds.size.height > 750 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
        }
        
        if UIScreen.main.bounds.size.height > 640 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/7.5).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 640 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/6.5).isActive = true
        }
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 109).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true

    }
    
    func setupFirstDividerView(){
        view.addSubview(firstDividerView)
        firstDividerView.setView()
        firstDividerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 51).isActive = true
        firstDividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstDividerView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        firstDividerView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupGisTitleLabel(){
        view.addSubview(gisTitleLabel)
        gisTitleLabel.setLabel()
        
        gisTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        gisTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20).isActive = true
        gisTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
    }
    
    func setupGisButton(){
        view.addSubview(gisButton)
        gisButton.setButton()
        
        gisButton.translatesAutoresizingMaskIntoConstraints = false
        gisButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
        gisButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5).isActive = true
        gisButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5).isActive = true
        gisButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -59).isActive = true
        gisButton.setImage(UIImage(named: "Arrow"), for: .normal)
        gisButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -UIScreen.main.bounds.width + 63)
      //  gisButton.backgroundColor = .red.withAlphaComponent(0.5)
        gisButton.addTarget(self, action: #selector(gisButtonAction(sender:)), for: .touchUpInside)
    }
    
    func setupYaNavTitleLabel(){
        view.addSubview(yaNavTitleLabel)
        yaNavTitleLabel.setLabel()
        
        yaNavTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        yaNavTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 74).isActive = true
        yaNavTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
    }
    
    func setupYaNavButton(){
        view.addSubview(yaNavButton)
        yaNavButton.setButton()
        
        yaNavButton.translatesAutoresizingMaskIntoConstraints = false
        yaNavButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 53).isActive = true
        yaNavButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5).isActive = true
        yaNavButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5).isActive = true
        yaNavButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -5).isActive = true
        yaNavButton.setImage(UIImage(named: "Arrow"), for: .normal)
        yaNavButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: -UIScreen.main.bounds.width + 63)
       // yaNavButton.backgroundColor = .red.withAlphaComponent(0.5)
        yaNavButton.addTarget(self, action: #selector(yaNavButtonAction(sender:)), for: .touchUpInside)
    }
    
    @objc func gisButtonAction(sender: UIButton){
        presenter?.setDefaultNavigatorTo2GIS()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func yaNavButtonAction(sender: UIButton){
        presenter?.setDefaultNavigatorToYandex()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func navigationSettingButtonAction(sender: UIButton){
        print("navigationSettingButtonAction")
    }
    
    
    func setupView(){
        self.view.backgroundColor = Colors.backgroundColor
        setupCardView()
        setupFirstDividerView()
        setupGisTitleLabel()
        setupGisButton()
        setupYaNavTitleLabel()
        setupYaNavButton()

    }

    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "BackArrow")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = Colors.black
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Навигация", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.title = "Навигация"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.black]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ChooseNavigatorPresenter(view: self)
        self.presenter = presenter
        createNavigationBar()
        setupView()
    }
}

// То, что выполняю во вью
protocol ChooseNavigatorViewProtocol: AnyObject, MVPControllerProtocol {

}

extension ChooseNavigatorView: ChooseNavigatorViewProtocol{

}

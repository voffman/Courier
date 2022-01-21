//
//  OrdersView.swift
//  courier
//
//  Created by Владимир Свиридов on 20.01.2022.
//

import UIKit

class OrdersView: UIViewController {

    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "В списке пусто", textSize: 24, style: .bold, alignment: .center)
    
    let helpLabel = CustomLabels(title: "Чтобы принимать заказы, нажмите кнопку «Начать работу»", textSize: 16, style: .regular, alignment: .center)
    let startWorkButton = CustomButtons(title: "НАЧАТЬ РАБОТУ", style: .primary)
    
    
    func setupNonActiveOrdersCardView(){
        view.addSubview(cardView.view)
        cardView.setView()
        
        cardView.view.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        cardView.view.topAnchor.constraint(equalTo:  view.topAnchor, constant: 97).isActive = true
        cardView.view.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.view.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.view.heightAnchor.constraint(equalToConstant: 265).isActive = true
        cardView.view.widthAnchor.constraint(equalToConstant: 340).isActive = true

    }
    
    func setupTitleLabel(){
        
        cardView.view.addSubview(titleLabel.label)
        titleLabel.setLabel()
        
        titleLabel.label.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.label.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 39).isActive = true
        titleLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    func setupHelpLabel(){
        
        cardView.view.addSubview(helpLabel.label)
        helpLabel.setLabel()
        helpLabel.label.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.label.textAlignment = .center

        helpLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helpLabel.label.topAnchor.constraint(equalTo:  titleLabel.label.bottomAnchor, constant: 25).isActive = true

        helpLabel.label.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 20).isActive = true
    }

    
    func setupStartWorkButton(){
        
        cardView.view.addSubview(startWorkButton.button)
        startWorkButton.setButton()
        startWorkButton.button.translatesAutoresizingMaskIntoConstraints = false
        
        startWorkButton.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startWorkButton.button.topAnchor.constraint(equalTo:  helpLabel.label.bottomAnchor, constant: 50).isActive = true
        startWorkButton.button.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 85).isActive = true
        startWorkButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -85).isActive = true
        startWorkButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        startWorkButton.button.widthAnchor.constraint(equalToConstant: 320).isActive = true
        startWorkButton.button.addTarget(self, action: #selector(startWorkButtonAction), for: .touchUpInside)
    
    }
    
    func setupActiveOrdersView(){
        helpLabel.title = "Ожидайте поступления заказов"
        setupHelpLabel()
        startWorkButton.button.isHidden = true
        startWorkButton.setButton()
        cardView.view.heightAnchor.constraint(equalToConstant: 149).isActive = true
        
    }
    
    @objc func startWorkButtonAction(){
        
        setupActiveOrdersView()
        
      //  let orderListTableView = OrderListTableView()
      //  orderListTableView.modalPresentationStyle = .fullScreen
      //  present(orderListTableView, animated: true)


    }

    func setupView(){
        view.backgroundColor = Colors.lightGray // условно
        let navigationBar = CustomNavigationBars(targetView: self.view, navigationBarStyle: .orderList)
        navigationBar.setupNavigationBar()
        setupNonActiveOrdersCardView()
        setupTitleLabel()
        setupHelpLabel()
        setupStartWorkButton()
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

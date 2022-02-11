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
    
    private var presenter: OrdersViewPresenterProtocol?
    
    func setupNonActiveOrdersCardView(){
        view.addSubview(cardView)
        cardView.setView()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, title: "Заказы",  navigationBarStyle: .withSOSButton)
        navigationBar.setupNavigationBar()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // MARK: Поправить
        if #available(iOS 11.0, *) {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9.25).isActive = true
        } else {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: self.view.frame.height/9.25).isActive = true
        }
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 265).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
    }
    
    func setupTitleLabel(){
        
        cardView.addSubview(titleLabel)
        titleLabel.setLabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 39).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    func setupHelpLabel(){
        
        cardView.addSubview(helpLabel)
        helpLabel.setLabel()
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.textAlignment = .center
        
        helpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helpLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 25).isActive = true
        
        helpLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
    }
    
    
    func setupStartWorkButton(){
        
        cardView.addSubview(startWorkButton)
        startWorkButton.setButton()
        startWorkButton.translatesAutoresizingMaskIntoConstraints = false
        
        startWorkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startWorkButton.topAnchor.constraint(equalTo:  helpLabel.bottomAnchor, constant: 50).isActive = true
        startWorkButton.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 85).isActive = true
        startWorkButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -85).isActive = true
        startWorkButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        startWorkButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        startWorkButton.addTarget(self, action: #selector(startWorkButtonAction), for: .touchUpInside)
        
    }
    
 /*   func setupActiveOrdersView(){
        helpLabel.title = "Ожидайте поступления заказов"
        setupHelpLabel()
        startWorkButton.isHidden = true
        startWorkButton.setButton()
        cardView.heightAnchor.constraint(equalToConstant: 149).isActive = true
        
    }
*/
    
    @objc func startWorkButtonAction(){
        
        let customTabBar = CustomTabBar()
       // setupActiveOrdersView()

        presenter?.checkOrders(completion: { posts in
            if posts.count != 0{
                customTabBar.modalPresentationStyle = .fullScreen
                self.present(customTabBar, animated: true, completion: nil)
            }
        })
    }
    
    func setupView(){
        view.backgroundColor = Colors.backgroundColor
        
        setupNonActiveOrdersCardView()
        setupTitleLabel()
        setupHelpLabel()
        setupStartWorkButton()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = OrdersPresenter(view:  self)
        self.presenter = presenter
        
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

extension OrdersView: OrdersViewProtocol {
    
}

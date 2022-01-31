//
//  ShopSubview.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class ShopSubview: UIViewController {
    
    weak private var shopSubviewPresenter: ShopSubviewPresenterProtocol!
    
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Направляйтесь      в отправную точку", textSize: 20, style: .bold, alignment: .justified)
    let sourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let toCallButton = CustomButtons(title: "ПОЗВОНИТЬ", style: .normal)
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()

    }
    
    func addSubviews(){
        self.view.addSubview(cardView)
        cardView.setView()
        self.view.addSubview(titleLabel)
        titleLabel.setLabel()
        self.view.addSubview(sourceLabel)
        sourceLabel.setLabel()
        self.view.addSubview(orderFromImage)
        self.view.addSubview(addressLabel)
        addressLabel.setLabel()
        self.view.addSubview(toCallButton)
        toCallButton.setButton()
        self.view.addSubview(routeButton)
        routeButton.setButton()
    }
    
    func setupCardView(){
        cardView.frame = CGRect(x: 0,
                                     y: 0,
                                     width:  self.view.frame.size.width,
                                     height:  self.view.frame.size.height)
    }
    
    func setupTitleLabel(){
       titleLabel.frame = CGRect(x: 16,
                                          y: 14,
                                          width: 180,
                                          height: 50)
    }
    
    func setupSourceLabel(){
        sourceLabel.frame = CGRect(x: 16,
                                              y: 81,
                                              width: sourceLabel.intrinsicContentSize.width,
                                              height: sourceLabel.intrinsicContentSize.height)
    }
    
    func setupOrderFromImage(){
        orderFromImage.frame = CGRect(x: 16,
                                      y: 118,
                                      width: 40,
                                      height: 40)
    }
    
    func setupAddressLabel(){
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        addressLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 118).isActive = true
        
        addressLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
        
    }
    func setupToCallButton(){
        toCallButton.translatesAutoresizingMaskIntoConstraints = false
        toCallButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 191).isActive = true
        toCallButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        toCallButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = false
        toCallButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        toCallButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
       // toCallButton.button.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
        
    }
    
    func setupRouteButton(){
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        routeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 191).isActive = true
        routeButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        
        routeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        routeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    
    func setupCell(){
        setupCardView()
        setupTitleLabel()
        setupSourceLabel()
        setupOrderFromImage()
        setupAddressLabel()
        setupToCallButton()
        setupRouteButton()

    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         setupCell()
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

extension ShopSubview: ShopSubviewProtocol{
    public func configure(source: String?, address: String?){
        self.sourceLabel.text = source
        self.addressLabel.text = address
    }
}

//
//  ShopSubview.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class ShopSubview: UIViewController {
    
    var targetView = UIView()
    
    private var presenter: ShopSubviewPresenterProtocol?
    
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Направляйтесь      в отправную точку", textSize: 20, style: .bold, alignment: .justified)
    let sourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let toCallButton = CustomButtons(title: "ПОЗВОНИТЬ", style: .normal)
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    
    let phoneNumber: String = ""
    var latitude: String = "0"
    var longitude: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ShopSubviewPresenter(view: self)
        presenter.view = self
        self.presenter = presenter
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
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     
   // MARK: Поправить
        if #available(iOS 11.0, *), UIScreen.main.bounds.size.height > 640{
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 0).isActive = true
        } else if UIScreen.main.bounds.size.height > 640 {
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 0).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 640{
            cardView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 20).isActive = true
        }
        
        cardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 0).isActive = true
        cardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: 0).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 265).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setupSourceLabel(){
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 81).isActive = true
        sourceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        sourceLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true

    }
    
    func setupOrderFromImage(){
        orderFromImage.translatesAutoresizingMaskIntoConstraints = false
        orderFromImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 118).isActive = true
        orderFromImage.leftAnchor.constraint(equalTo:cardView.leftAnchor, constant: 16).isActive = true
        orderFromImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        orderFromImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
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
        toCallButton.rightAnchor.constraint(equalTo: cardView.centerXAnchor, constant: -5).isActive = true
        toCallButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        toCallButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        toCallButton.addTarget(self, action: #selector(toCallButtonAction), for: .touchUpInside)
        
    }
    
    func setupRouteButton(){
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        routeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 191).isActive = true
        routeButton.leftAnchor.constraint(equalTo: cardView.centerXAnchor, constant: 5).isActive = true
        routeButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        
        routeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        routeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        routeButton.addTarget(self, action: #selector(routeButtonAction), for: .touchUpInside)
    }
    
    @objc func routeButtonAction(){
        presenter?.getCoordinates(latitude: latitude, longitude: longitude)
    }
    
    @objc func toCallButtonAction(){
        presenter?.getPhoneNumber(phoneNumber: phoneNumber)
    }
    
    func setupOnlyCallButtonState(){
        routeButton.isHidden = true
        toCallButton.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        titleLabel.text = "Заберите заказ"
    }
    
    
    func setupCell(){
        setupCardView()
        setupTitleLabel()
        setupSourceLabel()
        setupOrderFromImage()
        setupAddressLabel()
        setupToCallButton()
        setupRouteButton()
//        setupOnlyCallButtonState()
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

// То, что выполняю во вью
protocol ShopSubviewProtocol: AnyObject  {
    func configure(source: String?,
                   address: String?,
                   phoneNumber: String?,
                   latitude: String?,
                   longitude: String?)
    func openApp(appURL: URL)

}

extension ShopSubview: ShopSubviewProtocol{
    func openApp(appURL: URL) {
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            presenter?.openDownloadLink()
        }
    }
    
    public func configure(source: String?, address: String?, phoneNumber: String?, latitude: String?, longitude: String?){
        self.sourceLabel.text = source
        self.addressLabel.text = address
        self.latitude = latitude ?? "0"
        self.longitude = longitude ?? "0"
    }
}

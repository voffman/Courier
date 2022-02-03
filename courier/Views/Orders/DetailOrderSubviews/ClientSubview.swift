//
//  ClientCell.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class ClientSubview: UIViewController {
    
    private var presenter: ClientSubviewPresenterProtocol?
    
    let cardView = CustomViews(style: .withShadow)
    
    let clientImage = UIImageView(image: UIImage(named: "Client"))
    let clientLabel = CustomLabels(title: "Валерия Добровольская", textSize: 14, style: .light)
    let phoneLabel = CustomLabels(title: "8 (700) 700 70 70", textSize: 14, style: .regular)
    let lineImage = UIImageView(image: UIImage(named: "Line"))
    let addressImage = UIImageView(image: UIImage(named: "Place"))
    let addressTitleLabel = CustomLabels(title: "Адрес", textSize: 14, style: .light)
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    
    let commentCardView = CustomViews(style: .withShadow)
    let commentImage = UIImageView(image: UIImage(named: "Comment"))
    let commentTitleLabel = CustomLabels(title: "Комментарий клиента", textSize: 14, style: .light, alignment: .center)
    let commentLabel = CustomLabels(title: "Пожалуйста, пусть курьер позвонит, когда подъедет. Я хочу встретить его и забрать заказ. Это сюрприз для детей.", textSize: 16, style: .regular, alignment: .justified)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ClientSubviewPresenter(view:  self)
        self.presenter = presenter
        
        addSubviews()
    }
    
    func addSubviews(){
        self.view.addSubview(cardView)
        cardView.setView()
        self.view.addSubview(clientImage)
        self.view.addSubview(clientLabel)
        clientLabel.setLabel()
        self.view.addSubview(phoneLabel)
        phoneLabel.setLabel()
        self.view.addSubview(lineImage)
        self.view.addSubview(addressImage)
        self.view.addSubview(addressTitleLabel)
        addressTitleLabel.setLabel()
        self.view.addSubview(addressLabel)
        addressLabel.setLabel()
        self.view.addSubview(routeButton)
        routeButton.setButton()
        self.view.addSubview(commentCardView)
        commentCardView.setView()
        self.view.addSubview(commentImage)
        self.view.addSubview(commentTitleLabel)
        commentTitleLabel.setLabel()
        self.view.addSubview(commentLabel)
        commentLabel.setLabel()

        
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
        cardView.heightAnchor.constraint(equalToConstant: 234).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupClientImage(){
        clientImage.translatesAutoresizingMaskIntoConstraints = false
        clientImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        clientImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        clientImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        clientImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func setupClientLabel(){
        clientLabel.translatesAutoresizingMaskIntoConstraints = false
        clientLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        clientLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        clientLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupPhoneLabel(){
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 36).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupLineImage(){
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        lineImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lineImage.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 71).isActive = true
        lineImage.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 15).isActive = true
        lineImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -15).isActive = true
        
    }
    
    
    func setupAddressImage(){
        addressImage.translatesAutoresizingMaskIntoConstraints = false
        addressImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 89).isActive = true
        addressImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        addressImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupAddressTitleLabel(){
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTitleLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        addressTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 89).isActive = true
        addressTitleLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupAddressLabel(){
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        addressLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 110).isActive = true
        
        addressLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    
    
    func setupRouteButton(){
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        
        routeButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 170).isActive = true
        routeButton.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 16).isActive = true
        routeButton.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -16).isActive = true
        routeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        routeButton.widthAnchor.constraint(equalToConstant: 308).isActive = true
        routeButton.addTarget(self, action: #selector(routeButtonAction), for: .touchUpInside)
    }
    
    // MARK: Комментарий клиента
    
    func setupCommentCardView(){
        commentCardView.translatesAutoresizingMaskIntoConstraints = false
        commentCardView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 30).isActive = true
        commentCardView.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 0).isActive = true
        commentCardView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: 0).isActive = true
       // commentCardView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        commentCardView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        // поправка на отступы CardView
      //  commentCardView.makeClearHole(rect: CGRect(x: self.view.frame.size.width/2 - 20, y: -20, width: 40, height: 40))
    }
    
    
    func setupCommentTitleLabel(){
        commentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        commentTitleLabel.topAnchor.constraint(equalTo: commentCardView.topAnchor, constant: 28).isActive = true
        commentTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //commentTitleLabel.leftAnchor.constraint(equalTo: commentCardView.leftAnchor, constant: 16).isActive = true
        //commentTitleLabel.rightAnchor.constraint(equalTo: commentCardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupCommentImage(){
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        commentImage.topAnchor.constraint(equalTo: commentCardView.topAnchor, constant: -20).isActive = true
        commentImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupCommentLabel(){
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: commentCardView.topAnchor, constant: 54).isActive = true
        commentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        commentLabel.leftAnchor.constraint(equalTo: commentCardView.leftAnchor, constant: 16).isActive = true
        commentLabel.rightAnchor.constraint(equalTo: commentCardView.rightAnchor, constant: -16).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: commentCardView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func routeButtonAction(){
        presenter?.getCoordinates()
    }
    
    
    func setupCell(){
        setupCardView()
        setupClientImage()
        setupClientLabel()
        setupPhoneLabel()
        setupLineImage()
        setupAddressImage()
        setupAddressTitleLabel()
        setupAddressLabel()
        setupRouteButton()
        setupCommentCardView()
        setupCommentImage()
        setupCommentTitleLabel()
        setupCommentLabel()
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
//MARK: видимо сделать в отдельном файле
/*
extension ClientSubview {
    // тут вью с комментарием пользователя
    let cardView = CustomViews(style: .withShadow) // .withCircleCut
    let commentImage = UIImageView(image: UIImage(named: "Comment"))
    
    
}
*/

extension ClientSubview: ClientSubviewProtocol{
    func openApp(appURL: URL) {
        if UIApplication.shared.canOpenURL(appURL) {
         UIApplication.shared.open(appURL)
        }
    }
    
    
    public func configure(clientName: String?,
                          clientPhone: String?,
                          address: String?){
        self.clientLabel.text = clientName
        self.phoneLabel.text = clientPhone
        self.addressLabel.text = address
        
    }
}

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
    
    let titleLabel = CustomLabels(title: "Доставьте заказ клиенту", textSize: 20, style: .bold, alignment: .justified)
    let clientImage = UIImageView(image: UIImage(named: "Client"))
    let clientLabel = CustomLabels(title: "Валерия Добровольская", textSize: 14, style: .light)
    let phoneLabel = CustomLabels(title: "8 (700) 700 70 70", textSize: 14, style: .regular)
    let lineImage = UIImageView(image: UIImage(named: "Line"))
    let addressImage = UIImageView(image: UIImage(named: "Place"))
    let addressTitleLabel = CustomLabels(title: "Адрес", textSize: 14, style: .light)
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    let toCallButton = CustomButtons(title: "ПОЗВОНИТЬ", style: .normal)
    let commentCardView = CustomViews(style: .withShadow)
    let commentImage = UIImageView(image: UIImage(named: "Comment"))
    let commentTitleLabel = CustomLabels(title: "Комментарий клиента", textSize: 14, style: .light, alignment: .center)
    let commentLabel = CustomLabels(title: "Пожалуйста, пусть курьер позвонит, когда подъедет. Я хочу встретить его и забрать заказ. Это сюрприз для детей.", textSize: 16, style: .regular, alignment: .justified)
    
    var latitude: String = "0"
    var longitude: String = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ClientSubviewPresenter(view:  self)
        self.presenter = presenter
        
        addSubviews()
    }
    
    func addSubviews(){
        self.view.addSubview(cardView)
        cardView.setView()
        self.view.addSubview(titleLabel)
        titleLabel.setLabel()
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
        self.view.addSubview(toCallButton)
        toCallButton.setButton()
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
        cardView.heightAnchor.constraint(equalToConstant: 234).isActive = true // + 36
        cardView.widthAnchor.constraint(equalToConstant: 340).isActive = true
    }
    
    func setupTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 7).isActive = true // 14
        if UIScreen.main.bounds.size.height <= 640{
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: -3.5).isActive = true // 14
        }
        titleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.numberOfLines = 1
    }
    
    func setupClientImage(){
        clientImage.translatesAutoresizingMaskIntoConstraints = false
        clientImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true // 16
        clientImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        clientImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        clientImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func setupClientLabel(){
        clientLabel.translatesAutoresizingMaskIntoConstraints = false
        clientLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        clientLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true // 16
        clientLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupPhoneLabel(){
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 36).isActive = true // 36
        phoneLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
        phoneLabel.text? = phoneLabel.text?.applyPatternOnNumbers(pattern: "+# (###) ### ####", replacementCharacter: "#") ?? ""
    }
    
    func setupLineImage(){
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        lineImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lineImage.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: 71).isActive = true // 71
        lineImage.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 15).isActive = true
        lineImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -15).isActive = true
        
    }
    
    func setupAddressImage(){
        addressImage.translatesAutoresizingMaskIntoConstraints = false
        addressImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 89).isActive = true // 89
        addressImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        addressImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupAddressTitleLabel(){
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTitleLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        addressTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 89).isActive = true // 89
        addressTitleLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
    }
    
    func setupAddressLabel(){
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leftAnchor.constraint(equalTo:  cardView.leftAnchor, constant: 64).isActive = true
        addressLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 110).isActive = true // 110
        
        addressLabel.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    func setupToCallButton(){
        toCallButton.translatesAutoresizingMaskIntoConstraints = false
        toCallButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 191).isActive = true // 191
        toCallButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        toCallButton.rightAnchor.constraint(equalTo: cardView.centerXAnchor, constant: -5).isActive = true
        toCallButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        toCallButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        toCallButton.addTarget(self, action: #selector(toCallButtonAction), for: .touchUpInside)
        
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
    
    @objc func toCallButtonAction(){
        presenter?.getPhoneNumber(phoneNumber: phoneLabel.text ?? "")

    }
    
    @objc func routeButtonAction(){
        presenter?.getCoordinates(latitude: latitude, longitude: longitude)
    }
    
    func setupTwoButtonsState(){
        titleLabel.isHidden = false
        toCallButton.isHidden = false
        
        clientImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        clientLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 61).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 81).isActive = true
        lineImage.topAnchor.constraint(equalTo:  view.topAnchor, constant: 116).isActive = true
        addressImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 133).isActive = true
        addressTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 134).isActive = true
        addressLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 154).isActive = true

        toCallButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 206).isActive = true
        toCallButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        toCallButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -UIScreen.main.bounds.width / 2).isActive = true

        routeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 206).isActive = true // 191
        routeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIScreen.main.bounds.width / 2).isActive = true
        routeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true

        cardView.bottomAnchor.constraint(equalTo: routeButton.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func setupOnlyCallButtonState(){
        titleLabel.isHidden = false
        routeButton.isHidden = true
        toCallButton.isHidden = false
        
        clientImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        clientLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 61).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 81).isActive = true
        lineImage.topAnchor.constraint(equalTo:  view.topAnchor, constant: 116).isActive = true
        addressImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 133).isActive = true
        addressTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 134).isActive = true
        addressLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 154).isActive = true

        toCallButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true

        cardView.bottomAnchor.constraint(equalTo: toCallButton.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func setupCell(){
        setupCardView()
        setupTitleLabel()
        titleLabel.isHidden = true
        setupClientImage()
        setupClientLabel()
        setupPhoneLabel()
        setupLineImage()
        setupAddressImage()
        setupAddressTitleLabel()
        setupAddressLabel()
        setupToCallButton()
        toCallButton.isHidden = true
        setupRouteButton()
        setupCommentCardView()
        setupCommentImage()
        setupCommentTitleLabel()
        setupCommentLabel()
      //  setupTwoButtonsState()
      //  setupOnlyCallButtonState()
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

// То, что выполняю во вью
protocol ClientSubviewProtocol: AnyObject  {
    func configure(clientName: String?,
                   clientPhone: String?,
                   address: String?,
                   comment: String?,
                   latitude: String?,
                   longitude: String?)
    func openApp(appURL: URL)
}

extension ClientSubview: ClientSubviewProtocol{
    func openApp(appURL: URL) {
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            presenter?.openDownloadLink()
        }
    }
    
    
    public func configure(clientName: String?,
                          clientPhone: String?,
                          address: String?, comment: String?, latitude: String?, longitude: String?){
        self.clientLabel.text = clientName
        self.phoneLabel.text = clientPhone
        self.addressLabel.text = address
        self.commentLabel.text = comment
        self.latitude = latitude ?? "0"
        self.longitude = longitude ?? "0"
    }
}

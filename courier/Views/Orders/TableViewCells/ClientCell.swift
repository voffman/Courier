//
//  ClientCell.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class ClientCell: UITableViewCell {
    
    static let identifire = "clientCell"
    
    let cardView = CustomViews(style: .withShadow)
    
    let clientImage = UIImageView(image: UIImage(named: "Client"))
    let clientLabel = CustomLabels(title: "Валерия Добровольская", textSize: 14, style: .light)
    let phoneLabel = CustomLabels(title: "8 (700) 700 70 70", textSize: 14, style: .regular)
    let lineImage = UIImageView(image: UIImage(named: "Line"))
    let addressImage = UIImageView(image: UIImage(named: "Place"))
    let addressTitlelabel = CustomLabels(title: "Адрес", textSize: 14, style: .light)
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView.view)
        cardView.setView()
        contentView.addSubview(clientImage)
        contentView.addSubview(clientLabel.label)
        clientLabel.setLabel()
        contentView.addSubview(phoneLabel.label)
        phoneLabel.setLabel()
        contentView.addSubview(lineImage)
        contentView.addSubview(addressImage)
        contentView.addSubview(addressTitlelabel.label)
        addressTitlelabel.setLabel()
        contentView.addSubview(addressLabel.label)
        addressLabel.setLabel()
        contentView.addSubview(routeButton.button)
        routeButton.setButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // для использования в tableView
    public func configure(clientName: String?,
                          clientPhone: String?,
                          address: String?){
        self.clientLabel.label.text = clientName
        self.phoneLabel.label.text = clientPhone
        self.addressLabel.label.text = address
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func insertPaddingsBetweenCells(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 10,
                                                                     bottom: 10,
                                                                     right: 10))
    }
    
    
    func setupCardView(){
        cardView.view.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: contentView.frame.size.height)
    }
    
    func setupClientImage(){
        clientImage.frame = CGRect(x: 16,
                                      y: 16,
                                      width: 40,
                                      height: 40)
        
    }
    
    func setupClientLabel(){
       clientLabel.label.frame = CGRect(x: 64,
                                        y: 16,
                                        width: clientLabel.label.intrinsicContentSize.width,
                                        height: clientLabel.label.intrinsicContentSize.height)
    }
    
    func setupPhoneLabel(){
        phoneLabel.label.frame = CGRect(x: 64,
                                         y: 36,
                                         width: phoneLabel.label.intrinsicContentSize.width,
                                         height: phoneLabel.label.intrinsicContentSize.height)
    }
    
    func setupLineImage(){
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        lineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lineImage.topAnchor.constraint(equalTo:  cardView.view.topAnchor, constant: 71).isActive = true
        lineImage.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 15).isActive = true
        lineImage.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -15).isActive = true
        
    }
    
    
    func setupAddressImage(){
        addressImage.frame = CGRect(x: 16,
                                      y: 89,
                                      width: 40,
                                      height: 40)
    }
    
    func setupAddressTitleLabel(){
        addressTitlelabel.label.frame = CGRect(x: 64,
                                         y: 89,
                                         width: clientLabel.label.intrinsicContentSize.width,
                                         height: clientLabel.label.intrinsicContentSize.height)
    }
    
    func setupAddressLabel(){
        addressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        addressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 110).isActive = true
        
        addressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    
    
    func setupRouteButton(){
        routeButton.button.translatesAutoresizingMaskIntoConstraints = false
        
        routeButton.button.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 170).isActive = true
        routeButton.button.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 16).isActive = true
        routeButton.button.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -16).isActive = true
        routeButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        routeButton.button.widthAnchor.constraint(equalToConstant: 308).isActive = true
       // routeButton.button.addTarget(self, action: #selector(routeButtonAction), for: .touchUpInside)
    }
    
    
    func setupCell(){
        insertPaddingsBetweenCells()
        
        setupCardView()
        setupClientImage()
        setupClientLabel()
        setupPhoneLabel()
        setupLineImage()
        setupAddressImage()
        setupAddressTitleLabel()
        setupAddressLabel()
        setupRouteButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
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

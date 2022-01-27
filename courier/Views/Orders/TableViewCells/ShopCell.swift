//
//  ShopCell.swift
//  courier
//
//  Created by Владимир Свиридов on 27.01.2022.
//

import UIKit

class ShopCell: UITableViewCell {
    
    static let identifire = "shopCell"
    
    let cardView = CustomViews(style: .withShadow)
    let titleLabel = CustomLabels(title: "Направляйтесь      в отправную точку", textSize: 20, style: .bold, alignment: .justified)
    let sourceLabel = CustomLabels(title: "Источник (название заведения)", textSize: 14, style: .regular)
    let orderFromImage = UIImageView(image: UIImage(named: "Storefront"))
    let addressLabel = CustomLabels(title: "Казыбек Би, Нуркена Абдирова, 7, дом 8, квартира 42", textSize: 14, style: .regular)
    let toCallButton = CustomButtons(title: "ПОЗВОНИТЬ", style: .normal)
    let routeButton = CustomButtons(title: "МАРШРУТ", style: .normal)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView.view)
        cardView.setView()
        contentView.addSubview(titleLabel.label)
        titleLabel.setLabel()
        contentView.addSubview(sourceLabel.label)
        sourceLabel.setLabel()
        contentView.addSubview(orderFromImage)
        contentView.addSubview(addressLabel.label)
        addressLabel.setLabel()
        contentView.addSubview(toCallButton.button)
        toCallButton.setButton()
        contentView.addSubview(routeButton.button)
        routeButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(source: String?, address: String?){
        self.sourceLabel.label.text = source
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
    
    func setupTitleLabel(){
       titleLabel.label.frame = CGRect(x: 16,
                                          y: 14,
                                          width: 180,
                                          height: 50)
    }
    
    func setupSourceLabel(){
        sourceLabel.label.frame = CGRect(x: 16,
                                              y: 81,
                                              width: sourceLabel.label.intrinsicContentSize.width,
                                              height: sourceLabel.label.intrinsicContentSize.height)
    }
    
    func setupOrderFromImage(){
        orderFromImage.frame = CGRect(x: 16,
                                      y: 118,
                                      width: 40,
                                      height: 40)
    }
    
    func setupAddressLabel(){
        addressLabel.label.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.label.leftAnchor.constraint(equalTo:  cardView.view.leftAnchor, constant: 64).isActive = true
        addressLabel.label.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 118).isActive = true
        
        addressLabel.label.rightAnchor.constraint(equalTo:  cardView.view.rightAnchor, constant: -10).isActive = true
        
    }
    func setupToCallButton(){
        toCallButton.button.translatesAutoresizingMaskIntoConstraints = false
        toCallButton.button.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 191).isActive = true
        toCallButton.button.leftAnchor.constraint(equalTo: cardView.view.leftAnchor, constant: 16).isActive = true
        toCallButton.button.rightAnchor.constraint(equalTo: cardView.view.rightAnchor, constant: -16).isActive = false
        toCallButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        toCallButton.button.widthAnchor.constraint(equalToConstant: 150).isActive = true
       // toCallButton.button.addTarget(self, action: #selector(changeButtonState), for: .touchUpInside)
        
    }
    
    func setupRouteButton(){
        routeButton.button.translatesAutoresizingMaskIntoConstraints = false
        routeButton.button.topAnchor.constraint(equalTo: cardView.view.topAnchor, constant: 191).isActive = true
        routeButton.button.rightAnchor.constraint(equalTo: cardView.view.rightAnchor, constant: -16).isActive = true
        
        routeButton.button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        routeButton.button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    
    func setupCell(){
        insertPaddingsBetweenCells()
        
        setupCardView()
        setupTitleLabel()
        setupSourceLabel()
        setupOrderFromImage()
        setupAddressLabel()
        setupToCallButton()
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

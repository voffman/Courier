//
//  ScheduleCell.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    static let identifire = "scheduleCell"
    
    let cardView = CustomViews(style: .withShadow)
    let dateLabel = CustomLabels(title: "9 мар - 15 мар", textSize: 14, style: .bold)
    let acceptLabel = CustomLabels(title: "Требуется ваше подтверждение", textSize: 14, style: .regular)
    let orderTransitionArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    let transitionButton = CustomButtons(title: "", style: .transparent)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(dateLabel)
        dateLabel.setLabel()
        contentView.addSubview(acceptLabel)
        acceptLabel.setLabel()
        contentView.addSubview(orderTransitionArrowButtonImage)
        contentView.addSubview(transitionButton)
        transitionButton.setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(date: String?,
                          accept: String?) {
        self.dateLabel.text = date
        self.acceptLabel.text = accept
 
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
        cardView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: contentView.frame.size.width,
                                     height: contentView.frame.size.height)
    }
    
    func setupDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 12).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -24).isActive = true
    }
    
    func setupAcceptLabel(){
        acceptLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 36).isActive = true
        acceptLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 12).isActive = true
        acceptLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -24).isActive = true
    }
    
    func setupTransitionArrowButtonImage(){
        orderTransitionArrowButtonImage.translatesAutoresizingMaskIntoConstraints = false
        orderTransitionArrowButtonImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        orderTransitionArrowButtonImage.rightAnchor.constraint(equalTo:  cardView.rightAnchor, constant: -20).isActive = true
        orderTransitionArrowButtonImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        orderTransitionArrowButtonImage.widthAnchor.constraint(equalToConstant: 7.4).isActive = true
        
    }
    
    func setupTransitionButton(){
        transitionButton.frame = CGRect(x: 0,
                                                  y: 0,
                                                  width: contentView.frame.size.width,
                                                  height: contentView.frame.size.height)
    }
    
    //MARK: Добавить оранжевую полосу
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupDateLabel()
        setupAcceptLabel()
        setupTransitionArrowButtonImage()
        setupTransitionButton()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

    }
    
}

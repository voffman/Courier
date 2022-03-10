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
    let lineImage = UIImageView(image: UIImage(named: "ScheduleLine"))
    let dateLabel = CustomLabels(title: "30 февр. - 31 февр.", textSize: 14, style: .bold)
    let acceptLabel = CustomLabels(title: "Требуется ваше подтверждение", textSize: 14, style: .regular)
    let orderTransitionArrowButtonImage = UIImageView(image: UIImage(named: "Arrow"))
    
    let dateManager = DateManager()
    var isDateEnd: Bool = false
    var isCurrentDateBetweenDates: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(lineImage)
        contentView.addSubview(dateLabel)
        dateLabel.setLabel()
        contentView.addSubview(acceptLabel)
        acceptLabel.setLabel()
        contentView.addSubview(orderTransitionArrowButtonImage)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(dateStart: String?, dateEnd: String?,
                          accept: Bool?) {
        
        guard let dateStart = dateStart else {
            return
        }
        guard let dateEnd = dateEnd else {
            return
        }
        
        self.dateLabel.text = dateManager.convert(dateString: dateStart, convertToDateFormat: "dd MMM") + " - " + dateManager.convert(dateString: dateEnd, convertToDateFormat: "dd MMM")
        
        
        isDateEnd = dateManager.compareCurrentDateWithDate(dateString: dateEnd)
        isCurrentDateBetweenDates = dateManager.compareDate(firstDateString: dateStart, secondDateString: dateEnd)
        //    isCurrentDateBetweenDates = dateManager.compareDate(firstDateString: "2016-05-01", secondDateString: "2016-05-09")
        //    print("дата ", isCurrentDateBetweenDates)
        
        
        let acceptString: String
        if accept ?? false {
            acceptString = "Вы подтвердили"
            self.acceptLabel.textColor = Colors.lightGreen
        } else{
            acceptString = "Требуется ваше подтверждение"
            self.acceptLabel.textColor = Colors.red
        }
        
        self.acceptLabel.text = acceptString
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func insertPaddingsBetweenCells(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5,
                                                                     left: 10,
                                                                     bottom: 5,
                                                                     right: 10))
    }
    
    
    func setupCardView(){
        cardView.frame = CGRect(x: 0,
                                y: 0,
                                width: contentView.frame.size.width,
                                height: contentView.frame.size.height)
    }
    
    func setupLineImage(isHidden: Bool){
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        lineImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        lineImage.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        
        lineImage.isHidden = isHidden
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
    
    func setupDateEndState(isDateEnd: Bool){
        if isDateEnd{
            acceptLabel.title = "Истекло"
            acceptLabel.style = .light
            acceptLabel.setLabel()
            
        }
    }
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupLineImage(isHidden: !isCurrentDateBetweenDates)
        setupDateLabel()
        setupAcceptLabel()
        setupTransitionArrowButtonImage()
        setupDateEndState(isDateEnd: isDateEnd)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
        
    }
    
}

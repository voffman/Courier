//
//  ScheduleDayOffCell.swift
//  courier
//
//  Created by Владимир Свиридов on 07.02.2022.
//

import UIKit

class ScheduleDayOffCell: UITableViewCell {
    static let identifire = "scheduleDayOffCell"
    
    let cardView = CustomViews(style: .withShadow)
    
    let dayOfWeekLabel = CustomLabels(title: "Суббота", textSize: 14, style: .bold)
    let dateLabel = CustomLabels(title: "• 29 фев", textSize: 14, style: .light)
    let dayOffLabel = CustomLabels(title: "Выходной", textSize: 14, style: .regular)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(dayOfWeekLabel)
        dayOfWeekLabel.setLabel()
        contentView.addSubview(dateLabel)
        dateLabel.setLabel()
        contentView.addSubview(dayOffLabel)
        dayOffLabel.setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(dayOfWeek: String?,
                          date: String?, time: String?, sourcePoint: String?) {
        self.dayOfWeekLabel.text = dayOfWeek
        self.dateLabel.text = date
 
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
    
    
    func setupDayOfWeekLabel(){
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        dayOfWeekLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dayOfWeekLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: -1).isActive = true
    }
    
    func setupDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dayOfWeekLabel.rightAnchor, constant: 2).isActive = true
    }
    
    func setupDayOffLabel(){
        dayOffLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOffLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        dayOffLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    //MARK: Добавить оранжевую полосу
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupDayOfWeekLabel()
        setupDateLabel()
        setupDayOffLabel()

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

    }

}

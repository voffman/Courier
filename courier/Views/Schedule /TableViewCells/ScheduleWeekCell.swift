//
//  ScheduleWeekCell.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekCell: UITableViewCell {

    static let identifire = "scheduleWeekCell"
    
    let cardView = CustomViews(style: .withShadow)
    
    let dayOfWeekLabel = CustomLabels(title: "Понедельник", textSize: 14, style: .bold)
    let dateLabel = CustomLabels(title: "• 24 фев", textSize: 14, style: .light)
    let timeLabel = CustomLabels(title: "9:00 - 16:00", textSize: 14, style: .regular)
    let sourcePointLabel = CustomLabels(title: "Название отправной точки", textSize: 14, style: .regular)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(dayOfWeekLabel)
        dayOfWeekLabel.setLabel()
        contentView.addSubview(dateLabel)
        dateLabel.setLabel()
        contentView.addSubview(timeLabel)
        timeLabel.setLabel()
        contentView.addSubview(sourcePointLabel)
        sourcePointLabel.setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // для использования в tableView
    public func configure(dayOfWeek: String?,
                          date: String?, time: String?, sourcePoint: String?) {
        self.dayOfWeekLabel.text = dayOfWeek
        self.dateLabel.text = date
        self.timeLabel.text = time
        self.sourcePointLabel.text = sourcePoint
 
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
        dayOfWeekLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dayOfWeekLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dayOfWeekLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: -1).isActive = true
    }
    
    func setupDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 112).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: -1).isActive = true
    }
    
    func setupTimeLabel(){
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
    }
    
    func setupSourcePointLabel(){
        sourcePointLabel.translatesAutoresizingMaskIntoConstraints = false
        sourcePointLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 37).isActive = true
        sourcePointLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        sourcePointLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -1).isActive = true
    }
    
    //MARK: Добавить оранжевую полосу
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupDayOfWeekLabel()
        setupDateLabel()
        setupTimeLabel()
        setupSourcePointLabel()

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()

    }

}

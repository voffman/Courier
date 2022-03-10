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
    let lineImage = UIImageView(image: UIImage(named: "ScheduleLine"))
    let dayOfWeekLabel = CustomLabels(title: "Понедельник", textSize: 14, style: .bold)
    let dateLabel = CustomLabels(title: "• 24 фев", textSize: 14, style: .light)
    let timeLabel = CustomLabels(title: "9:00 - 16:00", textSize: 14, style: .regular)
    let sourcePointLabel = CustomLabels(title: "Название отправной точки", textSize: 14, style: .regular)

    let dateManager = DateManager()
    var isCurrentDateBetweenDates: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.setView()
        contentView.addSubview(lineImage)
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
                          date: String?, timeStart: String?, timeEnd: String?, sourcePoint: String?) {

        guard let timeStart = timeStart else {
            return
        }

        guard let timeEnd = timeEnd else {
            return
        }
        
        guard let dayOfWeek = dayOfWeek else {
            return
        }
        
        guard let date = date else {
            return
        }
        
        self.dayOfWeekLabel.text = dateManager.convert(dateString: dayOfWeek, convertToDateFormat: "EEEE").capitalized
        self.dateLabel.text = " • " + dateManager.convert(dateString: date, convertToDateFormat: "dd MMM")
        
        isCurrentDateBetweenDates = dateManager.compareDate(firstDateString: date, secondDateString: date)
     //    isCurrentDateBetweenDates = dateManager.compareDate(firstDateString: "2016-05-01", secondDateString: "2016-05-09")
     //    print("дата ", isCurrentDateBetweenDates)
        
        self.timeLabel.text = timeStart + " - " + timeEnd
        self.sourcePointLabel.text = sourcePoint
 
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
    
    func setupDayOfWeekLabel(){
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dayOfWeekLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dayOfWeekLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: -1).isActive = true
    }
    
    func setupDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dayOfWeekLabel.rightAnchor, constant: 2).isActive = true
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
    
    func setupCell(){
        insertPaddingsBetweenCells()
        setupCardView()
        setupLineImage(isHidden: !isCurrentDateBetweenDates)
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

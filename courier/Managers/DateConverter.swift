//
//  DateConverter.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

class DateConverter{
    
    func convert(dateString: String, dateFormat: String) -> String {

        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd"
        let convertedDate = formatter.date(from: dateString)
        guard let convertedDate = convertedDate else {
            return "Нет данных"
        }

        formatter.dateFormat = dateFormat
        
        return formatter.string(from: convertedDate)
    }
}

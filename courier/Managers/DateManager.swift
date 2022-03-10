//
//  DateManager.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

class DateManager{
    
    func convert(dateString: String, stringDateFormat: String? = "yyyy-MM-dd", convertToDateFormat: String) -> String {

        let formatter = DateFormatter()

        formatter.dateFormat = stringDateFormat
        let convertedDate = formatter.date(from: dateString)
        guard let convertedDate = convertedDate else {
            return "Нет данных"
        }

        formatter.dateFormat = convertToDateFormat
        
        return formatter.string(from: convertedDate)
    }
    
    func compareDate(firstDateString: String, secondDateString: String, stringDateFormat: String? = "yyyy-MM-dd") -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = stringDateFormat
        let firstDate = formatter.date(from: firstDateString)
        let secondDate = formatter.date(from: secondDateString)
       
        guard let convertedFirstDate = firstDate else {
            return false
        }
        guard let convertedSecondDate = secondDate else {
            return false
        }
        
        let currentDate = Date()

        if currentDate >= convertedFirstDate && currentDate <= convertedSecondDate {
            return true
        }
        else {
            return false
        }
    }
    
    // MARK: Дописать функцию для сравнения является ли текущая дата больше secondData, если так, то расписание истекло
    
    func compareCurrentDateWithDate(dateString: String, stringDateFormat: String? = "yyyy-MM-dd") -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = stringDateFormat
        let userDate = formatter.date(from: dateString)

        guard let convertedDate = userDate else {
            return false
        }
        
        let currentDate = Date()

        if currentDate > convertedDate {
            return true
        }
        else {
            return false
        }
    }
    
}

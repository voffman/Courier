//
//  HistoryPickerView.swift
//  courier
//
//  Created by Владимир Свиридов on 03.03.2022.
//

import UIKit

class HistoryPickerView: UIPickerView {
  /*
    let onView: UIView
    
    init (onView: UIView){
        self.onView = onView
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   */
    
    let pickerValues = ["День", "Неделя", "Месяц", "Квартал"]
    
    func createPickerView(onView: UIView){
        self.delegate = self
        self.dataSource = self

        onView.addSubview(self)

    }
}

extension HistoryPickerView: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = pickerValues[row]
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Ряд: \(row)")
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    
}

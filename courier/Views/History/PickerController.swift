//
//  PickerController.swift
//  courier
//
//  Created by Владимир Свиридов on 09.03.2022.
//

import UIKit

class PickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var selectedRow = 0
    
    let pickerValues = ["День", "Неделя", "Месяц", "Квартал"]
    
    let pickerView = UIPickerView()
   
    let pickerViewButton = UIButton()
    
   fileprivate func setupButton(){
       pickerViewButton.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
       pickerViewButton.backgroundColor = Colors.white3
       
       pickerViewButton.layer.borderColor = Colors.white.cgColor
       pickerViewButton.layer.cornerRadius = 4
       pickerViewButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .thin)
       pickerViewButton.layer.shadowRadius = 0.25
       pickerViewButton.setTitle("Сегодня", for: .normal)
       pickerViewButton.setTitleColor(Colors.black, for: .normal)
       pickerViewButton.setImage(UIImage(named: "Arrow"), for: .normal)
       pickerViewButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
       pickerViewButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       pickerViewButton.contentHorizontalAlignment = .center

    }
    
    func createPickerView(onView: UIView){
        setupButton()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        onView.addSubview(self.view)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        pickerViewButton.backgroundColor = Colors.white
        self.view.addSubview(pickerViewButton)
    }
    
    

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = Array(pickerValues)[row]
        label.sizeToFit()
        //label.textAlignment = .center
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1 //return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 50
    }
}


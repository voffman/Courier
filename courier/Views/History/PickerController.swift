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
       pickerViewButton.addTarget(self, action: #selector(popUpPicker(sender:)), for: .touchUpInside)
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
        self.view.addSubview(pickerViewButton)
    }
    

    @objc func popUpPicker(sender: UIButton) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth - 20, height: screenHeight/4)

        
        
        if #available(iOS 11.0, *), UIScreen.main.bounds.size.height > 750{
            pickerView.frame = CGRect(x: 0, y: -40, width: screenWidth - 20, height:screenHeight/4)
         } else if UIScreen.main.bounds.size.height > 640 {
             pickerView.frame = CGRect(x: 0, y: -40, width: screenWidth - 20, height:screenHeight/3)
         }
         
         if UIScreen.main.bounds.size.height <= 640{
             pickerView.frame = CGRect(x: 0, y: -40, width: screenWidth - 20, height:screenHeight/3)
         }


        
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        //pickerView.selectRow(selectedRowTextColor, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Выберите период", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = pickerViewButton
        alert.popoverPresentationController?.sourceRect = pickerViewButton.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (UIAlertAction) in
        }))
        
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (UIAlertAction) in
            self.selectedRow = self.pickerView.selectedRow(inComponent: 0)
            let selected = Array(self.pickerValues)[self.selectedRow]
            self.pickerViewButton.setTitle(selected, for: .normal)

        }))
        
        self.present(alert, animated: true, completion: nil)
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


//
//  CustomAlerts.swift
//  courier
//
//  Created by Владимир Свиридов on 26.01.2022.
//

import UIKit.UIAlertView

// MARK: Не готов для использования
class CustomAlerts: UIView{
    
    enum CustomAlertStyles {
        case checkGeo
        case isArriveToShop
        case isGotOrder
        case isArriveToClient
    }
    
    let style: CustomAlertStyles?
    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
    
    
    var alertTitle: String? = ""
    var alertMessage: String? = ""
    var alertFirstButtonTitle: String? = ""
    var alertSecondButtonTitle: String? = ""
    
    init(style: CustomAlertStyles){
        self.style = style
        super.init(frame: .zero )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAlert(){
        switch style{
        case .checkGeo:
            alert.title = "Геолокация неактивна"
            alert.message = "Разнообразный и богатый опыт консультация с широким активом способствует подготовки и реализации новых предложений. Не следует, однако забывать, что консультация с широким активом способствует подготовки и реализации соответствующий условий активизации."
            alertFirstButtonTitle = "ОТМЕНА"
            alertSecondButtonTitle = "ВКЛЮЧИТЬ"
            
            alert.addAction(UIAlertAction(title: alertFirstButtonTitle, style: .default, handler: {_ in
                
                print("Включить геолокацию")
                
            }))
            
            alert.addAction(UIAlertAction(title: alertSecondButtonTitle, style: .cancel, handler: nil))
            
            
        case .isArriveToShop:
            alert.title = "Находитесь в заведении?"
            alert.message = "Разнообразный и богатый опыт консультация с широким активом способствует подготовки и реализации новых предложений. Не следует, однако забывать, что консультация с широким активом способствует подготовки и реализации соответствующий условий активизации."
            alertFirstButtonTitle = "НЕТ, ЕЩЕ В ПУТИ"
            alertSecondButtonTitle = "ДА, УЖЕ ЗДЕСЬ"
            
            
            alert.addAction(UIAlertAction(title: alertFirstButtonTitle, style: .default, handler: {_ in
                
                
                print("Уведомить о входе в заведение")
                
            }))
            
            alert.addAction(UIAlertAction(title: alertSecondButtonTitle, style: .cancel, handler: nil))
            
        case .isGotOrder:
            alert.title = "Получили заказ?"
            alert.message = "Разнообразный и богатый опыт консультация с широким активом способствует подготовки и реализации новых предложений. Не следует, однако забывать, что консультация с широким активом способствует подготовки и реализации соответствующий условий активизации."
            alertFirstButtonTitle = "НЕ ПОЛУЧИЛ"
            alertSecondButtonTitle = "ДА, ПОЛУЧИЛ"
            
            alert.addAction(UIAlertAction(title: alertFirstButtonTitle, style: .default, handler: {_ in
                
                print("Уведомить о получении заказа")
                
            }))
            
            alert.addAction(UIAlertAction(title: alertSecondButtonTitle, style: .cancel, handler: nil))
            
        case .isArriveToClient:
            alert.title = "Вы прибыли по адресу клиента?"
            alert.message = "Разнообразный и богатый опыт консультация с широким активом способствует подготовки и реализации новых предложений. Не следует, однако забывать, что консультация с широким активом способствует подготовки и реализации соответствующий условий активизации."
            alertFirstButtonTitle = "НЕТ, ЕЩЕ В ПУТИ"
            alertSecondButtonTitle = "ДА, ПРИБЫЛ"
            
            alert.addAction(UIAlertAction(title: alertFirstButtonTitle, style: .default, handler: {_ in
                
                print("Уведомить о прибытии к клиенту")
                
            }))
            
            alert.addAction(UIAlertAction(title: alertSecondButtonTitle, style: .cancel, handler: nil))
            
        case .none:
            print("none")
        }
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

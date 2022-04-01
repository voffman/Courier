//
//  HistoryTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class HistoryTableView: MVPController {
    
    let tableView = UITableView()

    let pickerController = PickerController()
    
    private var presenter: HistoryTableViewPresenterProtocol?
    
    let dateManager = DateManager()
    
    var data: [HistoryElement] = []
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "История", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
    }
    
    @objc func popUpPicker(sender: UIButton) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: pickerController.screenWidth - 20, height: pickerController.screenHeight/4)

        
        if #available(iOS 11.0, *), UIScreen.main.bounds.size.height > 750{
            pickerController.pickerView.frame = CGRect(x: 0, y: -40, width: pickerController.screenWidth - 20, height:pickerController.screenHeight/4)
         } else if UIScreen.main.bounds.size.height > 640 {
             pickerController.pickerView.frame = CGRect(x: 0, y: -40, width: pickerController.screenWidth - 20, height:pickerController.screenHeight/3)
         }
         
         if UIScreen.main.bounds.size.height <= 640{
             pickerController.pickerView.frame = CGRect(x: 0, y: -40, width: pickerController.screenWidth - 20, height:pickerController.screenHeight/3)
         }
        
        pickerController.pickerView.selectRow(pickerController.selectedRow, inComponent: 0, animated: false)
        //pickerView.selectRow(selectedRowTextColor, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerController.pickerView)
        pickerController.pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerController.pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Выберите период", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = pickerController.pickerViewButton
        alert.popoverPresentationController?.sourceRect = pickerController.pickerViewButton.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (UIAlertAction) in
        }))
        
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { (UIAlertAction) in
            self.pickerController.selectedRow = self.pickerController.pickerView.selectedRow(inComponent: 0)
            let selected = Array(self.pickerController.pickerValues)[self.pickerController.selectedRow]
            self.pickerController.pickerViewButton.setTitle(selected, for: .normal)

            switch self.pickerController.selectedRow{
                
            case 0:
                self.checkPosts(dateStart: self.dateManager.getStringDateFor(days: 0), dateFinish: self.dateManager.getStringDateFor(days: 0))
                
            case 1:
                self.checkPosts(dateStart: self.dateManager.getStringDateFor(days: -7), dateFinish: self.dateManager.getStringDateFor(days: 0))
                
            case 2:
                self.checkPosts(dateStart: self.dateManager.getStringDateFor(days: -30), dateFinish: self.dateManager.getStringDateFor(days: 0))
                
            case 3:
                self.checkPosts(dateStart: self.dateManager.getStringDateFor(days: -90), dateFinish: self.dateManager.getStringDateFor(days: 0))

            default:
                break
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = HistoryPresenter(view:  self)
        self.presenter = presenter
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.backgroundColor
        
        pickerController.createPickerView(onView: self.view)
        pickerController.pickerViewButton.addTarget(self, action: #selector(popUpPicker(sender:)), for: .touchUpInside)
        pickerController.pickerViewButton.translatesAutoresizingMaskIntoConstraints = false
        pickerController.pickerViewButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pickerController.pickerViewButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5).isActive = true
        pickerController.pickerViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if UIScreen.main.bounds.size.height > 750{        pickerController.pickerViewButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 97).isActive = true
        } else if UIScreen.main.bounds.size.height > 640 {
            pickerController.pickerViewButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 69).isActive = true
        }
        
        if UIScreen.main.bounds.size.height <= 640{
            pickerController.pickerViewButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 69).isActive = true
        }
        
        setupTableView()
        checkPosts(dateStart: self.dateManager.getStringDateFor(days: 0), dateFinish: self.dateManager.getStringDateFor(days: 0))
    }

}


extension HistoryTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + 50).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 50).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifire, for: indexPath) as! HistoryCell
        cell.configure(orderId: post.id, orderDate: post.dateTimeFinish, orderPrice: post.sumTotal, orderStatus: post.statusName, orderSource: post.companyName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
}

protocol HistoryTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func checkPosts(dateStart: String, dateFinish: String)
}

extension HistoryTableView: HistoryTableViewProtocol{
    func checkPosts(dateStart: String, dateFinish: String) {
        presenter?.getHistory(dateStart: dateStart, dateFinish: dateFinish, completion: { posts in
            if !posts.isEmpty{
                print("Кол-во постов \(posts.count)")
                self.data = posts
                self.tableView.reloadData()
            }
            else{
                self.data = posts
                self.tableView.reloadData()
            }
        })
    }
}


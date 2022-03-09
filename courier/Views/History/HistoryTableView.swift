//
//  HistoryTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class HistoryTableView: UIViewController {
    
    let tableView = UITableView()

    let pickerController  = PickerController()
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "История", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.backgroundColor
        
        pickerController.createPickerView(onView: self.view)
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
        // Do any additional setup after loading the view.
    }

}


extension HistoryTableView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifire, for: indexPath) as! HistoryCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112 
    }
    
}

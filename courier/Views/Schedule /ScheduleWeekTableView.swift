//
//  ScheduleWeekTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekTableView: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backgroundColor
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    @objc func backButtonAction(){
        dismiss(animated: true, completion: nil)
    }
}

extension ScheduleWeekTableView: UITableViewDelegate, UITableViewDataSource{
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ScheduleWeekCell.self, forCellReuseIdentifier: ScheduleWeekCell.identifire)
        tableView.register(ScheduleDayOffCell.self, forCellReuseIdentifier: ScheduleDayOffCell.identifire)
        tableView.register(ScheduleSubmitCell.self, forCellReuseIdentifier: ScheduleSubmitCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationBar = CustomNavigationBars(targetView: self.view, title: "", navigationBarStyle: .withBackButton)
        navigationBar.info = "2 мар - 8 мар"
        navigationBar.barButton.action = #selector(backButtonAction)
        navigationBar.setupNavigationBar()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top + navigationBar.barHeight - 1).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: navigationBar.barHeight - 1).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleWeekCell.identifire, for: indexPath) as! ScheduleWeekCell
            return cell
        }
        if indexPath.row >= 5 && indexPath.row < 7{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: ScheduleDayOffCell.identifire, for: indexPath) as! ScheduleDayOffCell
            return cell2
        }
        
        if indexPath.row == 7 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: ScheduleSubmitCell.identifire, for: indexPath) as! ScheduleSubmitCell
            
            return cell3
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7 {
            return 68
        }
        return 90
    }    
}

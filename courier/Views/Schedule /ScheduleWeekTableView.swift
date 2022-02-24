//
//  ScheduleWeekTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekTableView: MVPController {

    let tableView = UITableView()
    private var presenter: ScheduleWeekTableViewPresenterProtocol?
    
    var data: [ScheduleByIDElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ScheduleWeekPresenter(view:  self)
        self.presenter = presenter
        
        self.view.backgroundColor = Colors.backgroundColor
        setupTableView()
        
        checkOrders(id: "1") // MARK: тут что-то сделать
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
    
    func createNavigationBar(title: String){
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.title = title
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar(title: "24 фев - 1 мар")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
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
        
        
        if indexPath.row < 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleWeekCell.identifire, for: indexPath) as! ScheduleWeekCell
          //  cell.configure(dayOfWeek: post.dateItem, date: "", time: post.timeStart + post.timeEnd, sourcePoint: post.point?.name)
            return cell
        }
        if indexPath.row >= 5 && indexPath.row < 7{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: ScheduleDayOffCell.identifire, for: indexPath) as! ScheduleDayOffCell
          //  cell2.configure(dayOfWeek: post.timeStart, date: post.timeEnd, time: post.dateItem, sourcePoint: post.point?.name)
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

protocol ScheduleWeekTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func checkOrders(id: String)
}

extension ScheduleWeekTableView: ScheduleWeekTableViewProtocol{
    func checkOrders(id: String) {
        presenter?.getScheduleWeek(id: id, completion: { posts in
            if posts.count != 0{
                print("Кол-во постов по айди \(posts.count)")
                self.data = posts
                self.tableView.reloadData()
            }
        })
    }
}

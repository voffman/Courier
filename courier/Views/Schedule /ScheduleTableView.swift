//
//  ScheduleTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class ScheduleTableView: MVPController {
    
    let tableView = UITableView()
    
    private var presenter: ScheduleTableViewPresenterProtocol?
    
    var data: [ScheduleElement] = []
    
    func createNavigationBar(){
        let navigationBarLeftItemLabel = CustomLabels(title: "Расписание", textSize: 20, style: .bold)
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBarLeftItemLabel.setLabel()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarLeftItemLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "SOSButton"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = Colors.red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = SchedulePresenter(view:  self)
        self.presenter = presenter
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.backgroundColor
        setupTableView()
        
        checkOrders()
    }

}

extension ScheduleTableView: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ScheduleCell.self, forCellReuseIdentifier: ScheduleCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createNavigationBar()
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCell.identifire, for: indexPath) as! ScheduleCell
        
        cell.configure(dateStart: post.dateStart, dateEnd: post.dateEnd, accept: post.isConfirmed)
        
        cell.transitionButton.addTarget(self, action: #selector(transitionButtonTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func transitionButtonTapped(sender: UIButton){
        let scheduleWeekTableView = ScheduleWeekTableView()
        scheduleWeekTableView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(scheduleWeekTableView, animated: true)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}

protocol ScheduleTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func checkOrders()
}

extension ScheduleTableView: ScheduleTableViewProtocol{
    func checkOrders() {
        presenter?.getSchedule(page: "0", completion: { posts in
            if posts.count != 0{
                print("Кол-во постов \(posts.count)")
                self.data = posts
                self.tableView.reloadData()
            }
        })
    }
    
}

//
//  ScheduleWeekTableView.swift
//  courier
//
//  Created by Владимир Свиридов on 06.02.2022.
//

import UIKit

class ScheduleWeekTableView: MVPController {
    
    let dataPosts: ScheduleElement
    
    init(scheduleElement: ScheduleElement){
        self.dataPosts = scheduleElement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let tableView = UITableView()
    private var presenter: ScheduleWeekTableViewPresenterProtocol?
    
    var data: [ScheduleByIDElement] = []
    
    let dateManager = DateManager()
    
    let scheduleFooterView = ScheduleFooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 68))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = ScheduleWeekPresenter(view:  self)
        self.presenter = presenter
        
        self.view.backgroundColor = Colors.backgroundColor
        setupTableView()

        scheduleFooterView.submitButton.addTarget(self, action: #selector(submitScheduleAction), for: .touchUpInside)
    }
    
    @objc func backButtonAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submitScheduleAction(){
        presenter?.applyStatusById(id: String(dataPosts.id))
    }
}



extension ScheduleWeekTableView: UITableViewDelegate, UITableViewDataSource{
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ScheduleWeekCell.self, forCellReuseIdentifier: ScheduleWeekCell.identifire)
        tableView.register(ScheduleDayOffCell.self, forCellReuseIdentifier: ScheduleDayOffCell.identifire)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.backgroundColor
        tableView.allowsSelection = false
        
        view.addSubview(tableView)
    }
    
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "BackArrow")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = Colors.black
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func createNavigationBar(title: String){
        self.navigationController?.navigationBar.backgroundColor = Colors.white
        self.navigationController?.navigationBar.barTintColor = Colors.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.black]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(title: dateManager.convert(dateString: dataPosts.dateStart, convertToDateFormat: "dd MMM") + " - " + dateManager.convert(dateString: dataPosts.dateEnd, convertToDateFormat: "dd MMM"))
        presenter?.getScheduleWeek(id: String(dataPosts.id))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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

        if post.timeStart == nil && post.timeEnd == nil{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: ScheduleDayOffCell.identifire, for: indexPath) as! ScheduleDayOffCell
            cell2.backgroundColor = Colors.backgroundColor
            cell2.configure(dayOfWeek: post.dateItem, date: post.dateItem)
            return cell2
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleWeekCell.identifire, for: indexPath) as! ScheduleWeekCell
            cell.backgroundColor = Colors.backgroundColor
            cell.configure(dayOfWeek: post.dateItem, date: post.dateItem, timeStart: post.timeStart, timeEnd: post.timeEnd, sourcePoint: post.point?.name)

            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }    
}

protocol ScheduleWeekTableViewProtocol: AnyObject, MVPControllerProtocol  {
    func isHaveScheduleWeek(posts: [ScheduleByIDElement])
}

extension ScheduleWeekTableView: ScheduleWeekTableViewProtocol{
    
    func isHaveScheduleWeek(posts: [ScheduleByIDElement]) {
        if !posts.isEmpty{
            print("Кол-во постов по айди \(posts.count)")
            self.data = posts
            self.tableView.reloadData()
            self.scheduleFooterView.createFooterView(isHidden: self.dataPosts.isConfirmed)
            self.tableView.tableFooterView = self.scheduleFooterView // грузить после того как загрузятся ячейки или данные
        }
    }

}

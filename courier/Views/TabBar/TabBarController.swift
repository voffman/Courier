//
//  CustomTabBar.swift
//  courier
//
//  Created by Владимир Свиридов on 04.02.2022.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
   
   @objc func updateView() {
       presenter?.tabBarIsLoaded()
    }
    
    var presenter: TabBarPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        let presenter = TabBarPresenter(view:  self)
        self.presenter = presenter
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "themeChanged"), object: nil)

        presenter.tabBarIsLoaded()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

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

protocol TabBarProtocol: AnyObject  {
    func checkActivity(isActive: Bool)
}

extension TabBarController: TabBarProtocol {
    func checkActivity(isActive: Bool) {
        let item1 = UINavigationController(rootViewController: isActive ? OrderListTableView() : OrdersView())
        let item2 = UINavigationController(rootViewController: HistoryTableView())
        let item3 = UINavigationController(rootViewController: ScheduleTableView())
        let item4 = UINavigationController(rootViewController: SalaryView())
        let item5 = UINavigationController(rootViewController: ProfileView())
        
        let icon1 = UITabBarItem(title: "Заказы", image: UIImage(named: "TabBarItem1"), selectedImage: UIImage(named: ""))
        let icon2 = UITabBarItem(title: "История", image: UIImage(named: "TabBarItem2"), selectedImage: UIImage(named: ""))
        let icon3 = UITabBarItem(title: "Расписание", image: UIImage(named: "TabBarItem3"), selectedImage: UIImage(named: ""))
        let icon4 = UITabBarItem(title: "Мой доход", image: UIImage(named: "outline_account_balance_wallet_black"), selectedImage: UIImage(named: ""))
        let icon5 = UITabBarItem(title: "Профиль", image: UIImage(named: "TabBarItem5"), selectedImage: UIImage(named: ""))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        item5.tabBarItem = icon5
        self.tabBar.unselectedItemTintColor = Colors.gray
        self.tabBar.tintColor = Colors.orange
        self.tabBar.backgroundColor = Colors.white
        self.tabBar.barTintColor = Colors.white
        let controllers = [item1,item2,item3,item4, item5]
        self.viewControllers = controllers
    }
}

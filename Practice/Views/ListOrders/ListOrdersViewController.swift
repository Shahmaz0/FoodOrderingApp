//
//  ListOrdersViewController.swift
//  Practice
//
//  Created by $HahMa on 05/05/25.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        register()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProgressHUD.animate()
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
    private func register() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}

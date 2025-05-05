//
//  ListOrdersViewController.swift
//  Practice
//
//  Created by $HahMa on 05/05/25.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        register()
    }
    
    let orders: [Orders] = [
        .init(id: "1", name: "Shahma Ansari", dish: .init(id: "id1", name: "Garri", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "1", name: "Faizan Khan", dish: .init(id: "id1", name: "Garri", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "1", name: "Praveen Srivastava", dish: .init(id: "id1", name: "Garri", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "1", name: "Piyush Singh", dish: .init(id: "id1", name: "Garri", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 34)),
        
    ]
    
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

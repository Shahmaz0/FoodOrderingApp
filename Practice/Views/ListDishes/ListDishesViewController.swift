//
//  ListDishesViewController.swift
//  Practice
//
//  Created by $HahMa on 05/05/25.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        register()
        
        ProgressHUD.animate()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
        
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
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


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

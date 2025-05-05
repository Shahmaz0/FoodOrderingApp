//
//  DishListTableViewCell.swift
//  Practice
//
//  Created by $HahMa on 05/05/25.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DishListTableViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Orders) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        dishTitleLbl.text = order.dish?.name
        descriptionLbl.text = order.dish?.description
    }
}

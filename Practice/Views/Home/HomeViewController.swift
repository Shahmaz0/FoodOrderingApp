//
//  HomeViewController.swift
//  Practice
//
//  Created by $HahMa on 03/05/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "African Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Pizza", description: "This is the best dish that i have ever tested", image: "https://picsum.photos/100/200", calories: 100)

    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fired Chicken", description: "This is my favuorite dish of all time.", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Beans and Garrie", description: "This is the best i have ever tested", image: "https://picsum.photos/100/200", calories: 314),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()

    }
    
    private func register() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
            
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: categories[indexPath.row])
            
            return cell
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        case popularCollectionView:
            let controller = DishDetailViewController.instantiate()
            controller.dish = populars[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        case specialsCollectionView: // Assuming you have this reference
            let controller = DishDetailViewController.instantiate()
            controller.dish = specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        default:
            break
        }
    }
}

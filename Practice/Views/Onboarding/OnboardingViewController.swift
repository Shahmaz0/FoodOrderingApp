//
//  OnboardingViewController.swift
//  Practice
//
//  Created by $HahMa on 25/04/25.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [Onboarding] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if (currentPage == slides.count - 1) {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            Onboarding(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world", image: #imageLiteral(resourceName: "slide1.png")),
          Onboarding(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world", image: #imageLiteral(resourceName: "slide1.png")),
          Onboarding(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world", image: #imageLiteral(resourceName: "slide1.png")),
        ]
        
        pageControl.numberOfPages = slides.count
    }

    @IBAction func nextBtnClicked(_ sender: Any) {
        
        if (currentPage == slides.count - 1) {
            let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

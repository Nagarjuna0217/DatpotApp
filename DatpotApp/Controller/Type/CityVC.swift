//
//  CityVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 16/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class CityVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{
    let identifier = "Cell"
    
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        cityCollectionView.register(UINib(nibName: "CityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:identifier)
        cityCollectionView.backgroundColor = UIColor.black
        
        /*let width = (self.cityCollectionView.frame.size.width - 12 * 3) / 3 //some width
         let height = width * 1.5 //rat
         
         let cellSize = CGSize(width:width , height:height)
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.itemSize = cellSize
         
         cityCollectionView.setCollectionViewLayout(layout, animated: true)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath as IndexPath) as! CityCollectionViewCell
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = CGSize.init(width: 120, height: 140)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBAction func continueAtc(_ sender: Any)
    {
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "MusicVC") as! MusicVC
        self.navigationController?.pushViewController(paasword, animated: true)
    }
    
    func gotodatspotListVC()
    {
        let leftViewController = LeftViewController()
        let homeVC = TabbarVC()
        
        let slideMenuController = ExSlideMenuController(mainViewController: homeVC, leftMenuViewController: leftViewController)
        
        let transition = getAnimation()
        self.navigationController!.view.layer.add(transition, forKey: nil)
        self.navigationController!.pushViewController(slideMenuController, animated: false)
    }
    
    func getAnimation() -> CATransition
    {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
}

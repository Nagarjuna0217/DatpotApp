//
//  MusicVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 16/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class MusicVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"Cell")
        
        
        
        collectionView.backgroundColor = UIColor.black
        

        
//        let width = (self.collectionView.frame.size.width  * 3) / 3 //some width
//        let height = width * 1.5 //rat
//
//        let cellSize = CGSize(width:width , height:height)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = cellSize
//
//        collectionView.setCollectionViewLayout(layout, animated: true)
//
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = CGSize.init(width: 100, height: 100)
        return size
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        let identifier = "Cell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath as IndexPath) as! MusicCollectionViewCell
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBAction func continueAtc(_ sender: Any) {
        
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "AboutMeVC") as! AboutMeVC
        self.navigationController?.pushViewController(paasword, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

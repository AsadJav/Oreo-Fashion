//
//  HomeViewController.swift
//  Oreo Fashion
//
//  Created by AALA mac on 12/10/2023.
//

import UIKit
import SwiftIcons

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var models = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        models.append(Model(imageName: "a1"))
        models.append(Model(imageName: "b2"))
        models.append(Model(imageName: "c3"))
        models.append(Model(imageName: "d4"))
        collectionView?.register(SliderCell.nib(), forCellWithReuseIdentifier: SliderCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.title = "OREO"
        navigationItem.largeTitleDisplayMode = .always
        let AddBtn = UIBarButtonItem(title: "Filter", style: .plain, target: self,action: #selector(MenuDrawer))
        self.navigationItem.leftBarButtonItem = AddBtn
        let filterBtn = UIBarButtonItem(title: "Filter", style: .plain, target: self,action: #selector(CartDrawer))
        self.navigationItem.rightBarButtonItem = filterBtn

        //navigationItem.leftBarButtonItem = newBtn
        navigationItem.leftBarButtonItem?.setIcon(icon: .dripicon(.alignLeft), iconSize: 25.0,color: .systemGreen, cgRect: CGRect(x: 0, y: 0, width: 30, height: 30), target: self, action: #selector(MenuDrawer))
        navigationItem.rightBarButtonItem?.setIcon(icon: .dripicon(.cart), iconSize: 25.0,color: .systemGreen, cgRect: CGRect(x: 0, y: 0, width: 30, height: 30), target: self, action: #selector(CartDrawer))
        
        //let nib1 = UINib(nibName: "SliderCell", bundle: nil)
        print("......",models.count-1)
    }
    
    @objc func MenuDrawer(){
        print("MenuDrawer")
    }
    
    @objc func CartDrawer(){
        print("CartDrawer")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    //MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //return CGSize(width: CGFloat((collectionView.frame.size.width) - 8), height: CGFloat(450))
            return CGSize(width: CGFloat(500), height: CGFloat(450))
           //return CGSize(width: 450.0, height: 425.0)
        }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("....dfd..",models.count-1)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.identifier, for: indexPath) as! SliderCell
        cell.configure(with: models)
        cell.count = models.count
        return cell
    }
}

//
//  SliderCell.swift
//  Oreo Fashion
//
//  Created by AALA mac on 13/10/2023.
//

import UIKit

class SliderCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var pageCtrl: UIPageControl!
    var currentIndex = 0
    var timer:Timer?
    var models = [Model]()
    var count = 0
    var numberOfPg = 0
    static let identifier = "SliderCell"
    //MARK: - OverrideFunc

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(SliderImageCell.nib(), forCellWithReuseIdentifier: SliderImageCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        
        //print(count,".....rer.",models.count-1)
        
    }
    @objc func slideToNext(){
        collectionView.isPagingEnabled = false
        pageCtrl.numberOfPages = count
        if currentIndex < count - 1{
            currentIndex = currentIndex + 1
        }
        else{
            currentIndex = 0
        }
        pageCtrl.currentPage = currentIndex
        collectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .left, animated: true)
        collectionView.isPagingEnabled = true

    }
    
    static func nib() -> UINib{
        return UINib(nibName: "SliderCell", bundle: nil)
    }
    func configure(with model: [Model]){
        self.models = model
        collectionView.reloadData()
    }
    //MARK: - NumberOfSections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 500.0, height: 500.0)
        }
    
    //MARK: - CellforItemAt
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderImageCell.identifier, for: indexPath) as! SliderImageCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}

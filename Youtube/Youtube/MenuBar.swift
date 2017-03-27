//
//  MenuBar.swift
//  Youtube
//
//  Created by Bhuvanendra on 3/24/17.
//  Copyright © 2017 comcast. All rights reserved.
//

import UIKit

class MenuBar:UIView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    
    let cellID = "CellID"
    
    let images = ["Home","images-1","images1","Profile"]
    
    lazy var collectionView:UICollectionView = {
        var cv =  UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(collectionView)
        addConstraintWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        
        let selectedIndexPath = NSIndexPath.init(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition:.top )
        
        let mc = BaseCell()
        mc.setupViews()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named:images[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:frame.width/4,height:frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell:BaseCell {
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Home")?.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
         }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        
//        addConstraintWithFormat(format: "H:|-32.875@999-[v0(28)]-32.875@999-|", views: imageView)
//        addConstraintWithFormat(format: "V:|-11@999-[v0(28)]-11@999-|", views: imageView)
        
//        addConstraintWithFormat(format: "H:|[v0(28)]|", views: imageView)
//        addConstraintWithFormat(format: "V:|[v0(28)]|", views: imageView)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

//        // Center horizontally
//        var constraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:[v0]-(<=1)-[v1]",
//            options: NSLayoutFormatOptions.alignAllCenterX,
//            metrics: nil,
//            views: ["v0":self,"v1":imageView])
//        
//        addConstraints(constraints)
//        
//        // Center vertically
//        constraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "H:[v0]-(<=1)-[v1]",
//            options: NSLayoutFormatOptions.alignAllCenterY,
//            metrics: nil,
//            views: ["v0":self, "v1":imageView])
//        
//       addConstraints(constraints)

    }
}

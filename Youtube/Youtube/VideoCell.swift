//
//  VideoCell.swift
//  Youtube
//
//  Created by Bhuvanendra on 3/23/17.
//  Copyright © 2017 comcast. All rights reserved.
//

import UIKit
class BaseCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
   internal func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class VideoCell: BaseCell {
    
    let thumbnailImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "images_gym")
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "5-baby-face-icon-green")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Title and Subtitle"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleTextView:UITextView = {
        let textView = UITextView()
        textView.text = "We have updated the way you create titles, subtitles, and headings in your Medium post."
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let seperatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
   override func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImage)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]-16@999-|", views: userProfileImage)
        addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImage,seperatorView)
        addConstraintWithFormat(format: "H:|[v0]|", views: seperatorView)
        

        
   
        // TitleLabel top constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        // TitleLabel left constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImage, attribute: .right, multiplier: 1, constant: 8))
        
        // TitleLabel right constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //TitleLabel  height constraint
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        //SubtitleTextView top constraint
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        
        // SubtitleTextView left constraint
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImage, attribute: .right, multiplier: 1, constant: 8))
        
        //SubtitleTextView right constraint
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //SubtitleTextView height constraint
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
    
    
}

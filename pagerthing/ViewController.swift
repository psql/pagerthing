//
//  ViewController.swift
//  pagerthing
//
//  Created by Pasquale D'Silva AND Jack Flintermannnnnnnnnn on 4/17/16.
//  Copyright © 2016 Pasquale D'Silva. All rights reserved.
//

import UIKit


class HighlightView: UIView {
    let imageView = UIImageView()
    let footerView = UIView()
    var footerShown: Bool = false
    
    
    convenience init(image: UIImage?) {
        self.init(frame: CGRectZero)
        self.imageView.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(imageView)
        
        footerView.backgroundColor = UIColor.blackColor()
        self.addSubview(footerView)
        
        
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(HighlightView.tapped))
        self.addGestureRecognizer(gestureRecogniser)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        footerView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 200)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped() {
        print("sup")
        
//        little flipperoooo
        
        
        if footerShown {
            footerShown = false
        } else {
            footerShown = true
        }
        
        UIView.animateWithDuration(0.3) {
            
            if self.footerShown {
                self.footerView.frame = CGRectMake(0, self.frame.size.height - 200, self.frame.size.width, 200)
                
            } else {
                self.footerView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 200)
            }
        }

        
        
        
    }

}

class PagedView: UIView {
    
    let scrollView = UIScrollView()
    
    let imageViews: [HighlightView] = [
        HighlightView.init(image: UIImage(named: "death")),
        HighlightView(image: UIImage(named: "death")),
        HighlightView(image: UIImage(named: "beach")),
        HighlightView(image: UIImage(named: "farm")),
        HighlightView(image: UIImage(named: "feet")),
        HighlightView(image: UIImage(named: "butt")),
        HighlightView(image: UIImage(named: "waves")),
        ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.pagingEnabled = true
        
        self.addSubview(scrollView)
        
        for imageView in imageViews {
            scrollView.addSubview(imageView)
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.frame = CGRectMake(
            0,
            0,
            self.frame.size.width,
            self.frame.size.height
        )
        
        scrollView.contentSize = CGSizeMake(
            CGFloat(self.imageViews.count) * self.frame.size.width ,
            self.frame.size.height
        )
        
        
        
        for index in 0..<imageViews.count {
            let imageView = imageViews[index]
            imageView.frame = CGRectMake(
                self.frame.size.width * CGFloat(index),
                0,
                self.frame.size.width,
                self.frame.size.height
            )
            
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class ViewController: UIViewController {
    override func loadView() {
        self.view = PagedView()
    }
}


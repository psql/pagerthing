//
//  ViewController.swift
//  pagerthing
//
//  Created by Pasquale D'Silva on 4/17/16.
//  Copyright © 2016 Pasquale D'Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    
    let imageViews: [UIImageView] = [
        UIImageView(image: UIImage(named: "death")),
        UIImageView(image: UIImage(named: "beach")),
        UIImageView(image: UIImage(named: "farm")),
        UIImageView(image: UIImage(named: "feet")),
        UIImageView(image: UIImage(named: "waves")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.pagingEnabled = true
        
        self.view.addSubview(scrollView)
        
        for imageView in imageViews {
            scrollView.addSubview(imageView)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRectMake(
            0,
            0,
            self.view.frame.size.width,
            self.view.frame.size.height
        )
        
        scrollView.contentSize = CGSizeMake(
            CGFloat(self.imageViews.count) * self.view.frame.size.width ,
            self.view.frame.size.height
        )
        

        
        for index in 0..<imageViews.count {
            let imageView = imageViews[index]
            imageView.frame = CGRectMake(
                self.view.frame.size.width * CGFloat(index),
                0,
                self.view.frame.size.width,
                self.view.frame.size.height
            )
        
        }
        
    }



}


//
//  ViewController.swift
//  MakerCycleView
//
//  Created by maker on 2016/12/5.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    var cycleView : MakerCycleView = {
        return MakerCycleView.getCycleView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK:==========设置 UI==========
extension ViewController{
    func setupUI() {
        view.addSubview(cycleView)
        cycleView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 200)
        getData()
        
    }
    func getData() {
        let images = ["http://img.hb.aicdn.com/bb048eea72fa6b1d304befec7bdf37dfffde3384dc97-RzQTGC_fw658","http://img.hb.aicdn.com/4b13a5f9292d2ba17fee7711f0c73eb87bf925e3ad3d3-frBIlI_fw658","http://img.hb.aicdn.com/bc53b7a59bde555a448552b907e7d6c3995cadd2a0b3d-v7dtwS_fw658"]
        cycleView.imageUrls = images
    }
}












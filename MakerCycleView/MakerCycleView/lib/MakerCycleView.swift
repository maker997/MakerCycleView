//
//  MakerCycleView.swift
//  MakerCycleView
//
//  Created by maker on 2016/12/5.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Kingfisher

let cycleCellId = "cycleCellId"

class MakerCycleView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var timer : Timer?
    
    var imageUrls : [String]? {
        didSet{
            guard let imageUrls = imageUrls else { return }
            pageControl.numberOfPages = imageUrls.count
            collectionView.reloadData()
            
            let indexPath = IndexPath(item: (imageUrls.count * 10), section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            
            //自动滚动
            removeTimer()
            addTimer()
        }
    }
    
    //从 nib 中创建 view
    class func getCycleView() ->MakerCycleView{
      return  Bundle.main.loadNibNamed("MakerCycleView", owner: nil, options: nil)?.first as! MakerCycleView
    }
    
    override func awakeFromNib() {
        collectionView.register(UINib(nibName: "CycleCollectionCell", bundle: nil), forCellWithReuseIdentifier: cycleCellId)
    }
}

//MARK:==========代理==========
extension MakerCycleView : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageUrls?.count ?? 0) * 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCellId, for: indexPath) as! CycleCollectionCell
        
        let url = imageUrls?[(indexPath.item % (imageUrls?.count ?? 1))]
        
        let Url = URL(string: (url ?? ""))
        
        cell.icon.kf.setImage(with: Url)
        cell.titleLbl.text = "这是标题"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int((scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width)
        let currentIndex = index % (imageUrls?.count ?? 1 )
        
        pageControl.currentPage = currentIndex
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }

}

//MARK:==========定时器相关的方法==========
extension MakerCycleView {
    fileprivate func addTimer () {
        timer = Timer(timeInterval: 2, target: self, selector: #selector(MakerCycleView.autoScroll),userInfo:nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    @objc fileprivate func autoScroll() {
        let offsetX = collectionView.contentOffset.x + collectionView.bounds.size.width
        let offset = CGPoint(x: offsetX, y: 0)
        collectionView.setContentOffset(offset, animated: true)
        
    }
    
    fileprivate func removeTimer(){
        timer?.invalidate()
        timer = nil
    }
}





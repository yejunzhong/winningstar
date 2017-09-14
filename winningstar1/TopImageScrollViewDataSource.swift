//
//  TopImageScrollViewDataSource.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/27.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import Foundation

class TopImageScrollViewDataSource {
    var imageUrlArray:NSMutableArray?{
        get{
            var temArray = [String]()
            let finalArray: NSMutableArray = []
            if let topImageUrls = self.Stringcut(htmlText, start: "<div class=\"index_box_po", end: "<span class=\"prev iconfont icon-back\"></span>"){
                var temUrls = topImageUrls
            for _ in 0..<10{
                if let url = self.Stringcut(temUrls, start: "<li _src=\"url(", end: ")\" style="){
                    temArray.append(url)
                    let h = temUrls.range(of: "target=\"_blank\"")
                    temUrls = temUrls.substring(from: (h?.upperBound)!)
                }else{
                    break
                }
            }
                print("0..10")
            if temArray.count > 0{
//                let temArray2:NSMutableArray = []
//                for i in 0..<temArray.count{
//                    print(temArray[i])
//                    let urlStr = NSURL(string: temArray[i])
//                    print("string to url")
//                    //let data = NSData(contentsOf:urlStr! as URL)//效率太低
//                    print("url to data")
//                    temArray2.add(urlStr!)
//                    print("transform")
//                }
                finalArray.add(temArray[temArray.count - 1])
                for i in 0..<temArray.count {
                    finalArray.add(temArray[i])
                }
                finalArray.add(temArray[0])
            }
                print("temarray"+"\(temArray.count)")
            
            if let a = defaults.object(forKey: "topImages") as? NSMutableArray{
                if finalArray == a{
                    return a
                }else{
                    defaults.set(finalArray, forKey: "topImages")
                    return finalArray
                }
            }else{
                defaults.set(finalArray, forKey: "topImages")
                return finalArray
            }
            }else{//没有接收到htmltext的情况
                if let a = defaults.object(forKey: "topImages") as? NSMutableArray{
                    return a
            }
        }
            return []
        }
    }
    fileprivate func Stringcut(_ text:String,start:String,end:String) -> String? {
        if let startrange = text.range(of: start)?.upperBound {
            if let endstrange = text.range(of: end)?.lowerBound {
                let textrange = Range<String.Index>(startrange..<endstrange)
                let cutstring = text.substring(with: textrange)
                return cutstring
            }
        }
        return nil
    }
}

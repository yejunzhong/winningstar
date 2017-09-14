//
//  householdNewDataSource.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/6.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import Foundation

class HouseholdNewDataSource:HouseholdDataSource{
    
    var imageDataArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=new", end: "container sale_img clearfix"){
                var ht = hotHtmltext
                for _ in 0...9{
                    if let url = self.Stringcut(ht, start: "img src=\"", end: "\" border=\"0\""){
                        let urlStr = NSURL(string: url )
                        let data = NSData(contentsOf:urlStr! as URL)
                        temArray.add(data!)
                        let h = ht.range(of: "shop_s shop_sf")
                        ht = ht.substring(from: (h?.upperBound)!)
                    }else{
                        break
                    }
                }
                if let a = defaults.object(forKey: "householdNewImage") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdNewImage")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdNewImage")
                    return temArray
                }
                //从Htmltext中截取url
            }else{
                if let a = defaults.object(forKey: "householdNewImage") as? NSMutableArray{
                    return a
                }
            }
            return []
        }
    }
    
    var titleArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=new", end: "container sale_img clearfix"){
                var ht = hotHtmltext
                for _ in 0...9{
                    if let title = self.Stringcut(ht, start: "alt=\"", end: "\" /></a>"){
                        temArray.add(title)
                        let h = ht.range(of: "shop_s shop_sf")
                        ht = ht.substring(from: (h?.upperBound)!)
                    }else{
                        break
                    }
                }
                if let a = defaults.object(forKey: "householdNewTitles") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdNewTitles")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdNewTitles")
                    return temArray
                }
            }else{
                if let a = defaults.object(forKey: "householdNewTitles") as? NSMutableArray{
                    return a
                }
            }
            return []
        }
    }
    var priceArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=new", end: "container sale_img clearfix"){
                var ht = hotHtmltext
                for _ in 0...9{
                    if let title = self.Stringcut(ht, start: "\"shop_s shop_sf\">", end: "</font>"){
                        temArray.add(title)
                        let h = ht.range(of: "</font>")
                        ht = ht.substring(from: (h?.upperBound)!)
                    }else{
                        break
                    }
                }
                if let a = defaults.object(forKey: "householdNewPrice") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdNewPrice")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdNewPrice")
                    return temArray
                }
            }else{
                if let a = defaults.object(forKey: "householdNewPrice") as? NSMutableArray{
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

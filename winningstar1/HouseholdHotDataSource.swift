//
//  HouseholdDataSource.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/1.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import Foundation

class HouseholdHotDataSource:HouseholdDataSource{
    
    var imageDataArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=best", end: "cate_ico_all floor-fixed-panel"){
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
                if let a = defaults.object(forKey: "householdHotImage") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdHotImage")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdHotImage")
                    return temArray
                }
//从Htmltext中截取url
            }else{
                if let a = defaults.object(forKey: "householdHotImage") as? NSMutableArray{
                    return a
                }
            }
            return []
        }
    }
    
    var titleArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=best", end: "cate_ico_all floor-fixed-panel"){
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
                if let a = defaults.object(forKey: "householdHotTitles") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdHotTitles")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdHotTitles")
                    return temArray
                }
            }else{
                if let a = defaults.object(forKey: "householdHotTitles") as? NSMutableArray{
                    return a
                }
            }
            return []
        }
    }
    var priceArray:NSMutableArray{
        get{
            let temArray:NSMutableArray = []
            if let hotHtmltext = self.Stringcut(htmlText, start: "search.php?intro=best", end: "cate_ico_all floor-fixed-panel"){
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
                if let a = defaults.object(forKey: "householdHotPrice") as? NSMutableArray {
                    if temArray == a{
                        return a
                    }else{
                        defaults.set(temArray, forKey: "householdHotPrice")
                        return temArray
                    }
                }else{
                    defaults.set(temArray, forKey: "householdHotPrice")
                    return temArray
                }
            }else{
                if let a = defaults.object(forKey: "householdHotPrice") as? NSMutableArray{
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

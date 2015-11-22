//
//  ColorManager.swift
//  Coucou
//
//  Created by Ralf on 7/29/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class ColorManager: NSObject
{
    class func warmGreen(alpha: CGFloat) -> UIColor
    {
        return UIColor(red: 0.74117647058823533, green: 0.83921568627450982, blue: 0.66274509803921566, alpha: 1)
    }

    class func coldGreen() -> UIColor
    {
        return UIColor(red: 0.30196078431372547, green: 0.6588235294117647, blue: 0.52156862745098043, alpha: 1)
    }

    class func ivory() -> UIColor
    {
        return UIColor(red: 0.96078431372549022, green: 0.94117647058823528, blue: 0.9137254901960784, alpha: 1)
    }

    class func lightBrown() -> UIColor
    {
        return UIColor(red: 0.89803921568627454, green: 0.88627450980392153, blue: 0.67450980392156867, alpha: 1)
    }

    class func lightBlue(alpha: CGFloat) -> UIColor
    {
        return UIColor(red: 162 / 255, green: 212 / 255, blue: 231 / 255, alpha: alpha)
    }

    class func white() -> UIColor
    {
        return UIColor(red: 0.98431372549019602, green: 0.98039215686274506, blue: 0.96862745098039216, alpha: 1)
    }

    class func dark() -> UIColor
    {
        return UIColor(red: 167 / 255, green: 164 / 255, blue: 160 / 255, alpha: 1)
    }

    class func darkGreen(alpha: CGFloat) -> UIColor
    {
        return UIColor(red: 0.20392156862745098, green: 0.44313725490196076, blue: 0.33725490196078434, alpha: alpha)
    }

    class func red(alpha: CGFloat) -> UIColor
    {
        return UIColor(red: 243 / 255, green: 70 / 255, blue: 0, alpha: alpha)
    }

    class func darkYellow() -> UIColor
    {
        return UIColor(red: 229 / 255, green: 226 / 255, blue: 172 / 255, alpha: 1)
    }
}

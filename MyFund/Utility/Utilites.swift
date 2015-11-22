//
//  Utilites.swift
//  Coucou
//
//  Created by Ralf on 7/25/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import Foundation
import UIKit

func stripString(string: String?, length: Int!) -> String?
{
    var s = string

    if s != nil
    {
        s = s!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let l = (s!).characters.count
        if l <= 0
        {
            s = nil
        }
        else if length > 0 && l > length
        {
            let index = s!.startIndex.advancedBy(length - 1)
            s = s!.substringToIndex(index)
        }
    }

    return s
}

func sizeOfText(text text: String, width: CGFloat, height: CGFloat) -> CGSize
{
    let string         = text as NSString
    let paragraphStyle = NSMutableParagraphStyle()

    paragraphStyle.lineHeightMultiple = 16
    paragraphStyle.maximumLineHeight = 20
    paragraphStyle.minimumLineHeight = 20

    //        paragraphStyle.firstLineHeadIndent = 20
    paragraphStyle.alignment = .Left

    let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(14), NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName: UIColor.darkGrayColor()]

    let frame = CGSizeMake(width, height)
    let size  = string.boundingRectWithSize(frame, options: [NSStringDrawingOptions.TruncatesLastVisibleLine, NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading], attributes: attributes, context: nil)
    return size.size
}

func resizeImage(image: UIImage, size: CGSize!) -> UIImage?
{
    // Begins an image context with the specified size
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0); // Draws the input image (self) in the specified size
    image.drawInRect(CGRectMake(0, 0, size.width, size.height))
    // Gets an UIImage from the image context
    let result = UIGraphicsGetImageFromCurrentImageContext()
    // Ends the image context
    UIGraphicsEndImageContext(); // Returns the final image, or NULL on error
    return result;
}

func downloadImage(url: String!) -> UIImage?
{
    let temp = NSTemporaryDirectory()
    let u = url as NSString
    let fileName = u.lastPathComponent
    let filePath = temp + "/" + fileName
    
    if NSFileManager.defaultManager().fileExistsAtPath(filePath)
    {
        return UIImage(contentsOfFile: filePath)
    }
    else
    {
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        data?.writeToFile(filePath, atomically: true)
        return UIImage(data: data!)
    }
}


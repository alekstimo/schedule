//
//  TabBarModel.swift
//  intro_case
//
//  
//

import Foundation
import UIKit

enum TabBarModel {
    case main
    case schedule
    case profile
    
    var title: String{
        switch self {
        case .main:
            return ""
        case .schedule:
            return ""
        case .profile:
            return ""
        }
    }
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "mainTabItem")
        case .schedule:
            return UIImage(named: "scheduleTabItem")
        case .profile:
            return UIImage(named: "profileSelectedTabItem")
        }
    }
    var selectedImage: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "mainSelectedTabItem")
        case .schedule:
            return UIImage(named: "scheduleSelectedTabItem")
        case .profile:
            return UIImage(named: "profileSelectedTabItem")
        }
    }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}

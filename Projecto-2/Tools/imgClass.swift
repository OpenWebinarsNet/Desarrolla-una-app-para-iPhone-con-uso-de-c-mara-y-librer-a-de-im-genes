//
//  imgClass.swift
//  PhotoImageSavingSampleFAR
//
//  Created by fredyiMac on 2/26/22.
//

import Foundation
import UIKit


class imgClass {
    public static func saveImageInDocumentDirectory(image: UIImage, fileName: String)  {

            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
            let fileURL = documentsUrl.appendingPathComponent(fileName)
            print("filePath:",fileURL)
            if let imageData = image.pngData() {
                try? imageData.write(to: fileURL, options: .atomic)

            }

        }

    public static func loadImageFromDocumentDirectory(fileName: String) -> UIImage? {

            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
            let fileURL = documentsUrl.appendingPathComponent(fileName)
            do {
                let imageData = try Data(contentsOf: fileURL)
                return UIImage(data: imageData)
            } catch {}
            return nil
        }
    public static func resizeimage(image:UIImage,withSize:CGSize) -> UIImage {
        
        var actualHeight:CGFloat = image.size.height
        var actualWidth:CGFloat = image.size.width
        let maxHeight:CGFloat = withSize.height
        let maxWidth:CGFloat = withSize.width
        var imgRatio:CGFloat = actualWidth/actualHeight
        let maxRatio:CGFloat = maxWidth/maxHeight
        let compressionQuality = 0.5
        if (actualHeight>maxHeight||actualWidth>maxWidth) {
            if (imgRatio<maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight/actualHeight
                actualWidth = floor(imgRatio * actualWidth)
                actualHeight = maxHeight
            }else if(imgRatio>maxRatio){
                // adjust height according to maxWidth
                imgRatio = maxWidth/actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }else{
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rec:CGRect = CGRect(x:0.0,y:0.0,width:actualWidth,height:actualHeight)
        UIGraphicsBeginImageContext(rec.size)
        image.draw(in: rec)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData = image.jpegData(compressionQuality: CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        let resizedimage = UIImage(data: imageData!)
        return resizedimage!
    }

}

enum imageType{
    case logoImg
    case companyImg
}

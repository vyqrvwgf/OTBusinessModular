//
//  OTImageExtension.swift
//  OTExtension
//
//  Created by lazy on 2018/4/12.
//

import UIKit

public extension UIImage {
    public class func image(named: String, namespace: String, cache: Bool = false) -> UIImage? {
        guard let mainBundlePath = Bundle.main.resourcePath else {
            return nil
        }
        let currentBundlePath = "\(mainBundlePath)/Frameworks/\(namespace).framework/\(namespace).bundle"
        let currentBundle = Bundle(path: currentBundlePath)
        if cache {
            var path = currentBundle?.resourcePath ?? ""
            path.append("/\(named).png")
            return UIImage(contentsOfFile: path)
        } else {
            return UIImage(named: named, in: currentBundle, compatibleWith: nil)
        }
    }
}

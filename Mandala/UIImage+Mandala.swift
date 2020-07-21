//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Carolina Salamanca on 7/14/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit

enum ImageResource: String { // this enumeration is backed by a String raw value.
    case angry
    case confused
    case crying
    case goofy
    case happy
    case meh
    case sad
    case sleepy
}

extension UIImage {
    convenience init(resource: ImageResource){
        self.init(named: resource.rawValue)!
    }
}


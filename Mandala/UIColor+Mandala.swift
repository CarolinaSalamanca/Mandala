//
//  UIColor+Mandala.swift
//  Mandala
//
//  Created by Carolina Salamanca on 7/14/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit

// Notice the file name (its convention to name them like that)
extension UIColor{
    // Notice that i omit the var type bc its implicit, it can be nil ! we re force unwrapping
    static let angry = UIColor(named: "angryRed")!
    static let confused = UIColor(named: "confusedPurple")!
    static let crying = UIColor(named: "cryingLightBlue")!
    static let goofy = UIColor(named: "goofyOrange")!
    static let happy = UIColor(named: "happyTurquoise")!
    static let meh = UIColor(named: "mehGray")!
    static let sad = UIColor(named: "sadBlue")!
    static let sleepy = UIColor(named:"sleepyLightRed")!
}

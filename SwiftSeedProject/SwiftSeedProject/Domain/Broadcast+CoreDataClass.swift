//
//  Broadcast+CoreDataClass.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

@objc(Broadcast)
public class Broadcast: PersistenceObject {

    class override var EntityName: String {
        return "Broadcast"
    }
}

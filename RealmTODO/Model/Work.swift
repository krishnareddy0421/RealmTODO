//
//  Work.swift
//  RealmTODO
//
//  Created by vamsi krishna reddy kamjula on 11/26/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import Foundation
import RealmSwift

class Work: Object {
    @objc dynamic var workTitle: String? = nil
    @objc dynamic var scheduleTime: String? = nil
    
    override static func primaryKey() -> String? {
        return "workTitle"
    }
}

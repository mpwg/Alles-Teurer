//
//  SchemaV2.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 03.11.25.
//

import Foundation
import SwiftData

/// Schema Version 2: Updated schema using Decimal for prices and quantities
enum SchemaV2: VersionedSchema {
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [Product.self, Purchase.self]
    }
}

//
//  AllesTeurerMigrationPlan.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 03.11.25.
//

import Foundation
import SwiftData

/// Migration plan for Alles-Teurer database schema changes
enum AllesTeurerMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    /// Migration from V1 (Double) to V2 (Decimal)
    /// This is a lightweight migration that converts Double to Decimal
    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: SchemaV1.self,
        toVersion: SchemaV2.self
    )
}

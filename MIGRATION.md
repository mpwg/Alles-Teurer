# Alles-Teurer Database Migration Guide

## Overview

This document describes the database migration system implemented in Alles-Teurer using SwiftData's `VersionedSchema` and `SchemaMigrationPlan`.

## Why Migration Was Needed

**Version 1 → Version 2: Double to Decimal Conversion**

In Version 2, we migrated from `Double` to `Decimal` for all financial data to ensure:

- ✅ Exact decimal arithmetic (no floating-point rounding errors)
- ✅ Correct price calculations for Austrian groceries
- ✅ Financial accuracy in price comparisons

### Changed Properties

**Product Model:**

- `bestPricePerQuantity: Double` → `Decimal`
- `highestPricePerQuantity: Double` → `Decimal`

**Purchase Model:**

- `totalPrice: Double` → `Decimal`
- `quantity: Double` → `Decimal`

## Migration Architecture

### File Structure

```
Alles-Teurer/Data/
├── SchemaV1.swift                    # Original schema (Double-based)
├── SchemaV2.swift                    # Current schema (Decimal-based)
└── AllesTeurerMigrationPlan.swift   # Migration logic
```

### Schema Versioning

#### SchemaV1 (v1.0.0)

Original schema using `Double` for prices and quantities. Contains:

- `ProductV1`: Product model with Double prices
- `PurchaseV1`: Purchase model with Double prices/quantities

#### SchemaV2 (v2.0.0)

Current schema using `Decimal` for financial precision. Uses:

- `Product`: Updated model with Decimal prices
- `Purchase`: Updated model with Decimal prices/quantities

### Migration Process

The migration is **automatic** and happens when:

1. App launches with existing V1 database
2. SwiftData detects schema version mismatch
3. `AllesTeurerMigrationPlan` executes migration stages
4. Data is converted from Double to Decimal
5. Validation runs to ensure data integrity

### Migration Stages

**Stage 1: V1 → V2 (Double to Decimal)**

```swift
static let migrateV1toV2 = MigrationStage.custom(
    fromVersion: SchemaV1.self,
    toVersion: SchemaV2.self,
    willMigrate: { context in
        print("🔄 Starting migration from V1 to V2 (Double → Decimal)")
    },
    didMigrate: { context in
        // Validation and verification logic
        // Ensures all data converted successfully
    }
)
```

**What Happens During Migration:**

1. **Pre-migration**: Log start of migration
2. **Automatic conversion**: SwiftData converts Double → Decimal
3. **Post-migration validation**:
   - Fetches all products and purchases
   - Validates no zero values after conversion
   - Logs warnings for any issues
   - Saves migrated data
4. **Success confirmation**: Logs completion status

## User Experience

### First Launch After Update

When users update to a version with the migration:

1. **App starts normally** - No user action required
2. **Migration runs automatically** - Happens in background
3. **Console logs** (visible in Xcode during development):
   ```
   🔄 Starting migration from V1 to V2 (Double → Decimal)
   📊 Migrated 25 products and 243 purchases
   💾 Migration data saved successfully
   ✅ Migration from V1 to V2 completed successfully
   ✅ ModelContainer created successfully with migration support
   ```
4. **Data preserved** - All existing purchases and products remain intact

### Error Handling

If migration fails:

- App logs detailed error information
- Falls back to creating fresh database (data loss scenario)
- Critical error triggers fatalError with message

## Testing Migration

### Development Testing

**Test with existing V1 data:**

1. Install app version with V1 schema (pre-Decimal)
2. Add sample data
3. Update to V2 schema version
4. Launch app and observe console logs
5. Verify data integrity:
   - All products have correct prices
   - All purchases have correct totals
   - Price calculations work correctly

**Test with fresh install:**

1. Delete app from simulator
2. Install V2 version
3. App should create V2 schema directly (no migration)
4. Add new data and verify Decimal types work

### Debug vs Release Builds

**Database Separation:**

- Debug builds use: `AllesTeurer-debug` database
- Release builds use: `AllesTeurer` database

This prevents migration conflicts between development and production data.

## Adding Future Migrations

### Creating Version 3

1. **Create SchemaV3.swift:**

   ```swift
   enum SchemaV3: VersionedSchema {
       static var versionIdentifier = Schema.Version(3, 0, 0)
       static var models: [any PersistentModel.Type] {
           [ProductV3.self, PurchaseV3.self]
       }

       @Model
       final class ProductV3 {
           // New schema definition
       }
   }
   ```

2. **Update AllesTeurerMigrationPlan.swift:**

   ```swift
   static var schemas: [any VersionedSchema.Type] {
       [SchemaV1.self, SchemaV2.self, SchemaV3.self]
   }

   static var stages: [MigrationStage] {
       [migrateV1toV2, migrateV2toV3]
   }

   static let migrateV2toV3 = MigrationStage.custom(
       fromVersion: SchemaV2.self,
       toVersion: SchemaV3.self,
       willMigrate: { context in
           // Pre-migration logic
       },
       didMigrate: { context in
           // Post-migration validation
       }
   )
   ```

3. **Test thoroughly** with all upgrade paths:
   - V1 → V2 → V3
   - V2 → V3
   - Fresh V3 install

## Best Practices

### ✅ Do:

- Always test migrations with real data
- Add validation in `didMigrate` closure
- Log migration progress for debugging
- Keep old schema versions in codebase
- Test all upgrade paths (V1→V2, V1→V3, V2→V3)
- Use semantic versioning for schema versions

### ❌ Don't:

- Delete old schema files (breaks upgrade paths)
- Modify existing schema versions (create new version instead)
- Skip migration testing
- Remove migration stages (users may skip versions)
- Forget to update `schemas` and `stages` arrays

## CloudKit Considerations

### Family Sharing Impact

**Migration with CloudKit:**

- Migration runs **locally** on each device
- CloudKit syncs migrated data automatically
- All family members must update app to same version
- Mixed versions may cause sync conflicts

**Recommendation:**

- Coordinate family updates when releasing migration
- Test CloudKit sync after migration
- Monitor for sync conflicts in production

## Troubleshooting

### Common Issues

**Issue: Migration doesn't run**

- Check: Schema version identifiers are correct
- Check: Migration plan is registered in App initialization
- Check: Database file exists from previous version

**Issue: Data loss after migration**

- Check: Validation logs in `didMigrate`
- Check: All properties mapped correctly
- Check: Relationships preserved

**Issue: App crashes on launch**

- Check: Migration stages array is correct
- Check: Schema definitions match model classes
- Check: No circular dependencies in migrations

### Debug Logging

Enable verbose migration logging:

```swift
// In didMigrate closure
let products = try context.fetch(productDescriptor)
for product in products {
    print("Product: \(product.normalizedName)")
    print("  Best: \(product.bestPricePerQuantity)")
    print("  Worst: \(product.highestPricePerQuantity)")
}
```

## Performance Considerations

**Migration Speed:**

- V1→V2 migration is lightweight (type conversion only)
- ~250 purchases migrate in < 1 second
- Scales linearly with data size

**Impact on Launch Time:**

- First launch after update: +0.5-2 seconds
- Subsequent launches: No overhead
- Migration runs once per database

## References

- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)
- [VersionedSchema](https://developer.apple.com/documentation/swiftdata/versionedschema)
- [SchemaMigrationPlan](https://developer.apple.com/documentation/swiftdata/schemamigrationplan)
- [MigrationStage](https://developer.apple.com/documentation/swiftdata/migrationstage)

---

**Last Updated:** November 3, 2025  
**Current Schema Version:** 2.0.0  
**Migration Stages:** 1 (V1→V2)

# Anforderungen - Native iOS AllesTeurer

## Funktionale Anforderungen

### Core Features (iOS Native)

- [ ] **Receipt Scanning Interface** - AVFoundation Kamera-Integration für Kassenbons
- [ ] **Local OCR Processing** - Vision Framework für deutsche Texterkennung
- [ ] **Product Matching** - Automatische Produktzuordnung mit lokalen Algorithmen
- [ ] **Price History Tracking** - Preisentwicklung mit SwiftData
- [ ] **Local Analytics** - Inflation/Ausgaben-Trends mit Swift Charts
- [ ] **Data Export** - CSV/JSON Export für eigene Analysen

### iOS-Specific Features

- [ ] **CloudKit Sync** - Geräte-übergreifende private Synchronisation
- [ ] **iOS Share Extension** - Receipt-Sharing von anderen Apps
- [ ] **Spotlight Integration** - Produkt-Suche über iOS Spotlight
- [ ] **Widget Support** - Home Screen und Lock Screen Widgets
- [ ] **Shortcuts Integration** - Siri Shortcuts für häufige Aktionen
- [ ] **Apple Intelligence** - Intelligente Produktkategorisierung
- [ ] **Dynamic Type Support** - Vollständige Accessibility-Unterstützung
- [ ] **VoiceOver Integration** - Screen Reader Kompatibilität

## Technische Komponenten

```text
Alles Teurer/
├── Models/                 # SwiftData models
│   ├── Receipt.swift       # Receipt entity
│   ├── Product.swift       # Product entity
│   └── PriceHistory.swift  # Price tracking
├── ViewModels/            # Observable ViewModels
│   ├── ScannerViewModel.swift
│   ├── ProductsViewModel.swift
│   └── AnalyticsViewModel.swift
├── Views/                 # SwiftUI views
│   ├── Scanner/           # Receipt scanning interface
│   ├── Products/          # Product list and details
│   ├── Analytics/         # Price charts and insights
│   └── Settings/          # App configuration
├── Services/              # Business logic
│   ├── OCRService.swift   # Vision Framework integration
│   ├── DataManager.swift  # SwiftData operations
│   └── PriceAnalyzer.swift # Analytics calculations
└── Utils/                 # Extensions and helpers
```

## User Stories (iOS Native)

### 1. Receipt Scanning

**Als iOS-Nutzer** möchte ich einen Kassenbon fotografieren und automatisch alle Produkte und Preise extrahiert bekommen, damit ich meine Ausgaben einfach tracken kann.

**Akzeptanzkriterien:**

- [ ] Kamera öffnet sich direkt beim Tippen auf "Scan" mit AVFoundation
- [ ] Vision Framework erkennt deutschen Text mit hoher Präzision
- [ ] Automatische Extraktion von Produktnamen, Preisen, und Datum
- [ ] Manuelle Korrektur-Möglichkeit bei OCR-Fehlern mit SwiftUI Interface
- [ ] Receipt wird lokal in SwiftData-Datenbank gespeichert

### 2. Local Product Management

**Als iOS-Nutzer** möchte ich, dass die App automatisch ähnliche Produkte erkennt und deren Preisverlauf lokal tracked, ohne dass Daten an externe Server gesendet werden.

**Akzeptanzkriterien:**

- [ ] Fuzzy-Matching für ähnliche Produktnamen mit lokalen Swift Algorithmen
- [ ] Automatische Kategorisierung mit Natural Language Framework
- [ ] Preisverlauf-Charts mit Swift Charts
- [ ] Alle Daten bleiben auf dem iPhone (SwiftData lokal)
- [ ] Optional: CloudKit Sync zwischen eigenen Geräten

### 3. Privacy-First Analytics

**Als iOS-Nutzer** möchte ich Einblicke in meine Ausgaben und Inflation trends erhalten, ohne dass meine persönlichen Daten das Gerät verlassen.

**Akzeptanzkriterien:**

- [ ] Lokale Berechnung von Ausgaben-Trends mit Swift
- [ ] Inflation-Rate pro Kategorie mit interaktiven Swift Charts
- [ ] Monatliche/wöchentliche Übersichten in nativer iOS UI
- [ ] Export-Funktion für eigene Analysen (CSV/JSON)
- [ ] Widgets für Home Screen und Lock Screen
- [ ] Siri Shortcuts Integration

## Technische Anforderungen

### Performance Requirements

- [ ] App-Start unter 1.5 Sekunden auf iPhone 12 oder neuer
- [ ] OCR-Verarbeitung unter 3 Sekunden pro Receipt mit Vision Framework
- [ ] Smooth 60fps Animationen mit SwiftUI
- [ ] SwiftData Abfragen unter 100ms
- [ ] Responsive UI auch bei großen Datenmengen (1000+ Receipts)

### Privacy & Security Requirements

- [ ] Alle Daten bleiben lokal auf dem Gerät (SwiftData)
- [ ] Optional: CloudKit private Sync nur zwischen eigenen Geräten
- [ ] Keine Third-Party Analytics oder Tracking
- [ ] Vollständige Daten-Exportierbarkeit
- [ ] DSGVO-konforme Datenlöschung
- [ ] App Sandbox Isolation
- [ ] Keychain Services für sensible Einstellungen

### iOS Integration Requirements

- [ ] iOS 17.0+ Mindest-Version (für SwiftData und moderne SwiftUI Features)
- [ ] VoiceOver Accessibility Support (WCAG 2.2 Level AA)
- [ ] Dynamic Type Support für Textgrößen
- [ ] Dark Mode Support
- [ ] Focus/Control Center Integration
- [ ] Handoff zwischen iPhone, iPad, Mac (mit CloudKit Sync)
- [ ] Spotlight Search Integration
- [ ] iOS Share Extension
- [ ] Widget Support (Home Screen, Lock Screen, StandBy)
- [ ] Siri Shortcuts Integration

## Offline-First Funktionalität

### Was funktioniert offline (alles!)

- [ ] Receipt Scanning und OCR (Vision Framework lokal)
- [ ] Alle Analytics und Charts (Swift Charts lokal)
- [ ] Produkt-Suche und -Verwaltung (SwiftData lokal)
- [ ] Data Export und Import
- [ ] Vollständige App-Funktionalität ohne Internet
- [ ] Alle Berechnungen und Analysen auf dem Gerät

### Optional: CloudKit Sync

- [ ] iOS: CloudKit Sync zwischen iPhone/iPad/Mac (private CloudKit container)
- [ ] Konflikterkennung und -lösung mit CloudKit
- [ ] Benutzer kann Sync komplett deaktivieren
- [ ] Lokale Backups via iTunes/Finder zusätzlich zu CloudKit
- [ ] End-to-End Verschlüsselung durch CloudKit

## Future CloudKit Integration (Phase 2)

### Optional erweiterte Features mit CloudKit

- [ ] Familien-Sharing von Ausgaben-Kategorien (CloudKit Sharing)
- [ ] Automatische Backup-Wiederherstellung auf neuen Geräten
- [ ] Synchronization zwischen iPhone, iPad, und Mac
- [ ] Offline-First bleibt bestehen - CloudKit nur als Bonus

## Dependencies & Constraints

### iOS Native Dependencies

- SwiftUI (iOS 17.0+)
- SwiftData (iOS 17.0+)
- Vision Framework (OCR)
- Swift Charts (für Visualisierung)
- CloudKit (optional sync)
- Natural Language Framework (Produktkategorisierung)
- Core Image (Bildverarbeitung)

### Entwicklungs-Constraints

- Xcode 15.0+ mit Swift 5.9+
- iOS 17.0+ Deployment Target
- SwiftUI + SwiftData Architecture
- Swift Testing Framework
- Native iOS Development nur

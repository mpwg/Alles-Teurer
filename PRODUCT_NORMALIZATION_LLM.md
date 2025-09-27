# LLM-Basierte Produktnormalisierung - Implementierung

## Überblick

Die Produktnormalisierung wurde komplett auf das LLM (Large Language Model) umgestellt, um intelligentere und konsistentere Ergebnisse zu erzielen.

## Implementierte Features

### 1. LLM-Exclusiv Normalisierung

- Entfernung der manuellen Regelsammlung
- Verwendung des Apple Foundation Models für intelligente Produktnamenerkennung
- Kontextbasierte Entscheidungen statt statische Regeln

### 2. Kontext-Bewusste Normalisierung

- **Häufigste Produkttypen**: Liste der 20 meist verwendeten österreichischen/deutschen Lebensmittelbegriffe
- **Bestehende Daten**: Integration bereits normalisierter Namen aus der Datenbank für Konsistenz
- **Lokale Begriffe**: Bevorzugung österreichischer Begriffe (z.B. "Erdäpfel" statt "Kartoffeln", "Paradeiser" statt "Tomaten")

### 3. Intelligente Prompting-Strategie

- Strukturierte Instruktionen für das LLM
- Beispiele für erwartete Normalisierung
- Validierung und Fallback-Mechanismen

## Technische Details

### Klassen und Methoden

- `Rechnungserkennung.init(modelContext:)` - Konstruktor mit optionalem ModelContext
- `getExistingNormalizedNames()` - Lädt vorhandene normalisierte Namen aus der Datenbank
- `getCommonProductTypes()` - Statische Liste der häufigsten Produkttypen
- `normalizeProductNameWithLLM(_:existingNormalizedNames:)` - Hauptnormalisierungslogik

### LLM-Instruktionen

```
Regeln:
- Entferne ALLE Markennamen (Ja natürlich, Clever, SPAR, etc.)
- Entferne ALLE Mengenangaben (kg, g, ml, l, Stück, etc.)
- Entferne Packungsarten und Qualitätsangaben
- Verwende österreichische Begriffe wo üblich
- Bevorzuge bereits verwendete Begriffe für Konsistenz
```

### Beispiel-Transformationen

```
"Ja natürlich Bio Joghurt Natur 500g" → "Joghurt"
"Clever Erdäpfel mehlig 2kg" → "Erdäpfel"
"SPAR Premium Grana Padano gerieben" → "Grana Padano"
"DKIH Paprika rot 1 Stk." → "Paprika"
```

## Vorteile

1. **Intelligenz**: Das LLM kann kontextabhängige Entscheidungen treffen
2. **Konsistenz**: Verwendung bereits normalisierter Namen verhindert Duplikate
3. **Lokalisation**: Berücksichtigung österreichischer/deutscher Begriffe
4. **Skalierbarkeit**: Keine Wartung statischer Regeln erforderlich
5. **Lernfähigkeit**: Nutzt bestehende Daten zur Verbesserung

## Performance Überlegungen

- Async/await Pattern für nahtlose Integration
- Validierung und Fallback bei LLM-Fehlern
- Logging für Debugging und Monitoring
- Caching durch Wiederverwendung bereits normalisierter Namen

## Nutzung

Die Normalisierung wird automatisch beim Scannen von Rechnungen durchgeführt:

```swift
let rechnungserkennung = Rechnungserkennung(modelContext: context)
let items = try await rechnungserkennung.extractRechnungszeilen(from: image)
// items enthalten automatisch normalisierte Namen in der NormalizedName-Eigenschaft
```

## Nächste Schritte

- Performance-Monitoring in der realen Anwendung
- Benutzer-Feedback zur Qualität der Normalisierung
- Eventuelle Anpassung der LLM-Instruktionen basierend auf Ergebnissen

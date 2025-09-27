import Foundation

struct SampleData {
    static let sampleRechnungszeilen: [Rechnungszeile] = [
        Rechnungszeile(
            Name: "Milch 1L",
            Price: 1.49,
            Category: "Milchprodukte",
            Shop: "Spar",
            Datum: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
            NormalizedName: "Milch"
        ),
        Rechnungszeile(
            Name: "Milch",
            Price: 1.59,
            Category: "Milchprodukte",
            Shop: "Billa",
            Datum: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(),
            NormalizedName: "Milch",
 
        ),
        Rechnungszeile(
            Name: "Milch",
            Price: 1.39,
            Category: "Milchprodukte",
            Shop: "Hofer",
            Datum: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
            NormalizedName: "Milch",
 
        ),
        Rechnungszeile(
            Name: "Brot",
            Price: 2.99,
            Category: "Backwaren",
            Shop: "Billa",
            Datum: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(),
            NormalizedName: "Milch",
 
        ),
        Rechnungszeile(
            Name: "Äpfel",
            Price: 3.20,
            Category: "Obst",
            Shop: "Merkur",
            Datum: Date(),
            NormalizedName: "Apfel",
 
        ),
    ]

    static let groupedSampleData: [String: [Rechnungszeile]] = {
        Dictionary(grouping: sampleRechnungszeilen, by: { $0.Name })
    }()
}

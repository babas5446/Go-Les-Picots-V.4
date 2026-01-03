
//
//  BibliothequeView.swift
//  Go les Picots V.4
//
//  Module 4 : Bibliothèque des espèces
//
//  Created: 2026-01-01
//

import SwiftUI

struct BibliothequeView: View {
    
    @State private var searchText = ""
    @State private var filtreZone: Zone? = nil
    
    private let database = EspecesDatabase.shared
    
    private var especesFiltrees: [EspeceInfo] {
        var especes = database.especesTraine
        
        if let zone = filtreZone {
            especes = especes.filter { $0.zones.contains(zone) }
        }
        
        if !searchText.isEmpty {
            let recherche = searchText.lowercased()
            especes = especes.filter {
                $0.nomCommun.lowercased().contains(recherche)
            }
        }
        
        return especes.sorted { $0.nomCommun < $1.nomCommun }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(especesFiltrees) { espece in
                    NavigationLink {
                        EspeceDetailView(espece: espece)
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(espece.nomCommun)
                                .font(.headline)
                            
                            Text(espece.nomScientifique)
                                .font(.caption)
                                .italic()
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("📚 Bibliothèque")
        }
    }
}

#Preview {
    BibliothequeView()
}

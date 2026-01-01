//
//  TypeDeNageDescriptionModal.swift
//  Go Les Picots V.4
//
//  Phase 2 - Modal de description complète d'un type de nage
//  Created by LANES Sebastien on 31/12/2025.
//

import SwiftUI

struct TypeDeNageDescriptionModal: View {
    let typeDeNage: TypeDeNage
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Titre
                    Text(typeDeNage.rawValue)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    // Description principale
                    VStack(alignment: .leading, spacing: 8) {
                        Text(typeDeNage.description)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    // Catégorie
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Catégorie", systemImage: "list.bullet")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text(typeDeNage.categorie)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Conditions idéales
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Conditions idéales", systemImage: "cloud.sun")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        Text(typeDeNage.conditionsIdeales)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Technique recommandée
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Technique recommandée", systemImage: "figure.fishing")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        Text(typeDeNage.techniqueRecommandee)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding()
            }
            .navigationTitle("Type de nage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TypeDeNageDescriptionModal(typeDeNage: .wobblingLarge)
}

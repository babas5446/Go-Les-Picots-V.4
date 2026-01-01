//
//  TypeDeNageSuggestionView.swift
//  Go Les Picots V.4
//
//  Badge de suggestion intelligent pour types de nage détectés
//  Created by LANES Sebastien on 01/01/2026.
//

import SwiftUI

struct TypeDeNageSuggestionView: View {
    @Binding var selectedTypes: [TypeDeNage]
    @Binding var detectedTypes: [TypeDeNage]
    @Binding var isVisible: Bool
    
    let maxTypes: Int = 3
    
    var body: some View {
        VStack(spacing: 12) {
            // En-tête
            HStack(spacing: 12) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color(hex: "FFBC42"))
                    .font(.title3)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Types de nage détectés")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("\(detectedTypes.count) suggestion\(detectedTypes.count > 1 ? "s" : "")")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                // Bouton Ignorer
                Button {
                    withAnimation {
                        isVisible = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.title3)
                }
            }
            
            // Liste des types détectés
            VStack(spacing: 8) {
                ForEach(detectedTypes, id: \.self) { type in
                    typeRow(for: type)
                }
            }
            
            // Bouton Tout ajouter (si plusieurs suggestions et espace disponible)
            if detectedTypes.count > 1 && canAddAll {
                Button {
                    addAllTypes()
                } label: {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Tout ajouter (\(detectedTypes.count))")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color(hex: "4CAF50"))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(hex: "FFF9E6"))
        .cornerRadius(12)
        .transition(.scale.combined(with: .opacity))
    }
    
    // MARK: - Type Row
    
    private func typeRow(for type: TypeDeNage) -> some View {
        HStack(spacing: 12) {
            // Nom du type
            Text(type.rawValue)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Bouton Ajouter
            Button {
                addType(type)
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                    Text("Ajouter")
                }
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color(hex: "0277BD"))
                .cornerRadius(8)
            }
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Actions
    
    private func addType(_ type: TypeDeNage) {
        guard selectedTypes.count < maxTypes else { return }
        
        selectedTypes.append(type)
        
        // Retirer de la liste des suggestions
        if let index = detectedTypes.firstIndex(of: type) {
            detectedTypes.remove(at: index)
        }
        
        // Masquer si plus de suggestions
        if detectedTypes.isEmpty {
            withAnimation {
                isVisible = false
            }
        }
    }
    
    private func addAllTypes() {
        // Ajouter tous les types qui rentrent
        let available = maxTypes - selectedTypes.count
        let toAdd = Array(detectedTypes.prefix(available))
        
        selectedTypes.append(contentsOf: toAdd)
        
        withAnimation {
            isVisible = false
            detectedTypes = []
        }
    }
    
    // MARK: - Helpers
    
    private var canAddAll: Bool {
        (selectedTypes.count + detectedTypes.count) <= maxTypes
    }
}

// MARK: - Preview
#Preview {
    TypeDeNageSuggestionView(
        selectedTypes: .constant([.wobblingLarge]),
        detectedTypes: .constant([.darting, .slowJigging]),
        isVisible: .constant(true)
    )
    .padding()
}

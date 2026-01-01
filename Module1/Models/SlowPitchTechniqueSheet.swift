//
//  SlowPitchTechniqueSheet.swift
//  Go Les Picots V.4
//
//  Technique d'animation Slow Pitch - Astuce de pro
//  Created: 2025-12-31
//

import SwiftUI

struct SlowPitchTechniqueSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // En-tête
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "graduationcap.fill")
                                .foregroundColor(Color(hex: "FFBC42"))
                                .font(.title2)
                            Text("Astuce de Pro")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        Text("Slow Pitch")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "FFBC42"))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(hex: "FFF9E6"))
                    .cornerRadius(12)
                    
                    // Définition
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Précision chirurgicale sur poissons méfiants")
                            .font(.headline)
                            .foregroundColor(Color(hex: "FFBC42"))
                        
                        Divider()
                    }
                    
                    // Quand ?
                    sectionCard(
                        icon: "clock.fill",
                        title: "Quand l'utiliser ?",
                        content: "Courant faible (<2 nœuds), dérive contrôlée, poissons statiques/collés fond (sonar ID), touches hésitantes.",
                        color: Color(hex: "0277BD")
                    )
                    
                    // Matériel clé
                    sectionCard(
                        icon: "wrench.and.screwdriver.fill",
                        title: "Matériel clé",
                        content: "Canne parabolique, jig asymétrique/plat, animation discontinue (descente = phase productive).",
                        color: .orange
                    )
                    
                    // Astuce
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(Color(hex: "FFBC42"))
                            Text("Astuce")
                                .font(.headline)
                                .foregroundColor(Color(hex: "FFBC42"))
                        }
                        
                        Text("Patience ! Mesurez touches/descente et durée en couche.")
                            .font(.body)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "hand.raised.fill")
                                .foregroundColor(.red)
                                .font(.caption)
                            Text("Interdit : récupération rapide")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .fontWeight(.semibold)
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(Color(hex: "FFF9E6"))
                    .cornerRadius(12)
                    
                    // Objectif
                    HStack(spacing: 12) {
                        Image(systemName: "target")
                            .foregroundColor(.green)
                            .font(.title2)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Objectif")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            Text("Déclencher la touche passive, pas prospecter")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    Spacer(minLength: 20)
                }
                .padding()
            }
            .navigationTitle("Technique Slow Pitch")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
    
    // MARK: - Section Card
    
    private func sectionCard(icon: String, title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
                    .foregroundColor(color)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    SlowPitchTechniqueSheet()
}

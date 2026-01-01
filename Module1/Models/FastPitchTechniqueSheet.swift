//
//  FastPitchTechniqueSheet.swift
//  Go Les Picots V.4
//
//  Technique d'animation Fast Pitch - Astuce de pro
//  Created: 2025-12-31
//

import SwiftUI

struct FastPitchTechniqueSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // En-tête
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "graduationcap.fill")
                                .foregroundColor(Color(hex: "0277BD"))
                                .font(.title2)
                            Text("Astuce de Pro")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        Text("Fast Pitch")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "0277BD"))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(hex: "E3F2FD"))
                    .cornerRadius(12)
                    
                    // Définition
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Prospection agressive pour réaction immédiate")
                            .font(.headline)
                            .foregroundColor(Color(hex: "0277BD"))
                        
                        Divider()
                    }
                    
                    // Quand ?
                    sectionCard(
                        icon: "clock.fill",
                        title: "Quand l'utiliser ?",
                        content: "Courant fort (≥2 nœuds), vie en colonne, poissons en chasse/pélagiques (thons NC), attaques franches.",
                        color: Color(hex: "0277BD")
                    )
                    
                    // Matériel clé
                    sectionCard(
                        icon: "wrench.and.screwdriver.fill",
                        title: "Matériel clé",
                        content: "Canne raide, moulinet rapide, jig long/hydro, animation continue (coups amples, montée = phase clé).",
                        color: .orange
                    )
                    
                    // Astuce
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(Color(hex: "0277BD"))
                            Text("Astuce")
                                .font(.headline)
                                .foregroundColor(Color(hex: "0277BD"))
                        }
                        
                        Text("Comptez montées/dérive et surface couverte.")
                            .font(.body)
                    }
                    .padding()
                    .background(Color(hex: "E3F2FD"))
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
                            Text("Localiser et provoquer l'attaque violente")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Règle d'or
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(hex: "FFBC42"))
                            Text("Règle d'or - Bascule intelligente")
                                .font(.headline)
                                .foregroundColor(Color(hex: "FFBC42"))
                        }
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("1. Démarrez Fast pour détecter l'activité (sonar/vie eau)")
                                .font(.subheadline)
                            Text("2. Passez Slow si touches confirmées/zone productive")
                                .font(.subheadline)
                            Text("3. Inversez si 0 touche après 3 dérives")
                                .font(.subheadline)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "hand.raised.fill")
                                .foregroundColor(.red)
                                .font(.caption)
                            Text("Jamais les 2 en même temps !")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .fontWeight(.semibold)
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(Color(hex: "FFF9E6"))
                    .cornerRadius(12)
                    
                    // Pacifique Sud
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "globe.asia.australia.fill")
                                .foregroundColor(.blue)
                            Text("En Pacifique Sud")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        
                        Text("Adaptez aux courants NC – slow sur tombants calmes (GT fond), fast sur bancs pélagiques. Votre rendement x2 !")
                            .font(.body)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    
                    Spacer(minLength: 20)
                }
                .padding()
            }
            .navigationTitle("Technique Fast Pitch")
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
    FastPitchTechniqueSheet()
}

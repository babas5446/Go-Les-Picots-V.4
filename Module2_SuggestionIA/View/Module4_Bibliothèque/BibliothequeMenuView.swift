//
//  BibliothequeMenuView.swift
//  Go Les Picots V.4
//
//  Module 4 : Menu principal Bibliothèque
//  Point d'entrée avec 3 sections : Espèces / Techniques / Tuto de Pro
//
//  //  Created by LANES Sebastien on 02/01/2026.
//

import SwiftUI

struct BibliothequeMenuView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header avec description
                    VStack(spacing: 8) {
                        Text("Votre bibliothèque de pêche")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                    
                    // MARK: - Les 3 cartes principales
                    
                    VStack(spacing: 16) {
                        // Carte 1 : Espèces
                        NavigationLink(destination: EspecesListView()) {
                            MenuCard(
                                title: "Bibliothèque d'espèces",
                                description: "Identification, habitat et techniques de pêche",
                                accentColor: .blue
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        // Carte 2 : Techniques de pêche
                        NavigationLink(destination: TechniquesListView()) {
                            MenuCard(
                                title: "Techniques de pêche",
                                description: "Traîne, jigging, montages et stratégies",
                                accentColor: .orange
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        // Carte 3 : Tuto de Pro
                        NavigationLink(destination: TutoProListView()) {
                            MenuCard(
                                title: "Tuto de Pro",
                                description: "Vidéos CPS et conseils d'experts",
                                accentColor: .green
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 40)
                }
            }
            .navigationTitle("📚 Bibliothèque")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Composant MenuCard

/// Carte cliquable pour le menu principal
struct MenuCard: View {
    let title: String
    let description: String
    let accentColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Titre
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // Description
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            // Indicateur de navigation
            HStack {
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(accentColor)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(accentColor.opacity(0.2), lineWidth: 1)
        )
    }
}

// MARK: - Vues placeholder temporaires

/// Placeholder temporaire pour TechniquesListView
struct TechniquesListView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "fish.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange.opacity(0.5))
            
            Text("Section Techniques de pêche")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("À développer dans Sprint 3")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .navigationTitle("🎣 Techniques")
    }
}

/// Placeholder temporaire pour TutoProListView
struct TutoProListView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "play.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green.opacity(0.5))
            
            Text("Section Tuto de Pro")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("À développer dans Sprint 4")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .navigationTitle("💡 Tuto de Pro")
    }
}

// MARK: - Preview

#Preview {
    BibliothequeMenuView()
}

//
//  ParametresAppView.swift
//  Go les Picots - Module 1 Phase 2
//
//  Vue de paramètres de l'application
//  Accès aux couleurs personnalisées
//
//  Created: 2024-12-22
//

import SwiftUI

struct ParametresAppView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var couleurManager = CouleurCustomManager.shared
    
    @State private var showGestionCouleurs = false
    
    var body: some View {
        NavigationStack {
            List {
                // Section Couleurs personnalisées
                Section {
                    Button {
                        showGestionCouleurs = true
                    } label: {
                        HStack {
                            Image(systemName: "paintpalette.fill")
                                .foregroundColor(.blue)
                                .frame(width: 30)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Couleurs personnalisées")
                                    .foregroundColor(.primary)
                                
                                Text("\(couleurManager.couleursCustom.count) couleur(s) créée(s)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                } header: {
                    Text("Personnalisation")
                } footer: {
                    Text("Créez vos propres couleurs pour décrire plus précisément vos leurres")
                }
                
                // Section À propos
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("4.0")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Module")
                        Spacer()
                        Text("Phase 2 + V2 Couleurs")
                            .foregroundColor(.secondary)
                    }
                } header: {
                    Text("À propos")
                }
            }
            .navigationTitle("Réglages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $showGestionCouleurs) {
                GestionCouleursCustomView()
            }
        }
    }
}

#Preview {
    ParametresAppView()
}

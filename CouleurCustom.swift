//
//  CouleurCustom.swift
//  Go les Picots - Module 1 Phase 2
//
//  Modèle pour les couleurs personnalisées créées par l'utilisateur
//  Version V2 - Simple et robuste
//
//  Created: 2024-12-22
//

import Foundation
import SwiftUI
import Combine

// MARK: - Modèle de Couleur Personnalisée

/// Représente une couleur créée par l'utilisateur
struct CouleurCustom: Identifiable, Codable, Hashable {
    let id: UUID
    var nom: String
    var red: Double       // 0.0 à 1.0
    var green: Double     // 0.0 à 1.0
    var blue: Double      // 0.0 à 1.0
    var contraste: Contraste
    var dateCreation: Date
    
    init(nom: String, red: Double, green: Double, blue: Double, contraste: Contraste) {
        self.id = UUID()
        self.nom = nom
        self.red = red
        self.green = green
        self.blue = blue
        self.contraste = contraste
        self.dateCreation = Date()
    }
    
    /// Couleur SwiftUI pour affichage
    var swiftUIColor: Color {
        Color(red: red, green: green, blue: blue)
    }
    
    /// Initialisation depuis une Color SwiftUI
    init?(nom: String, from color: Color, contraste: Contraste) {
        guard let uiColor = UIColor(color).cgColor.components,
              uiColor.count >= 3 else {
            return nil
        }
        
        self.id = UUID()
        self.nom = nom
        self.red = Double(uiColor[0])
        self.green = Double(uiColor[1])
        self.blue = Double(uiColor[2])
        self.contraste = contraste
        self.dateCreation = Date()
    }
}

// MARK: - Manager de Couleurs Personnalisées

/// Gestionnaire singleton pour les couleurs personnalisées
class CouleurCustomManager: ObservableObject {
    
    static let shared = CouleurCustomManager()
    
    @Published var couleursCustom: [CouleurCustom] = []
    
    private let userDefaultsKey = "couleursCustomV2"
    
    private init() {
        charger()
    }
    
    // MARK: - Persistance
    
    func charger() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            print("📦 Aucune couleur personnalisée à charger")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            couleursCustom = try decoder.decode([CouleurCustom].self, from: data)
            print("✅ \(couleursCustom.count) couleur(s) personnalisée(s) chargée(s)")
        } catch {
            print("❌ Erreur chargement couleurs: \(error)")
            couleursCustom = []
        }
    }
    
    private func sauvegarder() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(couleursCustom)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
            print("💾 \(couleursCustom.count) couleur(s) sauvegardée(s)")
        } catch {
            print("❌ Erreur sauvegarde couleurs: \(error)")
        }
    }
    
    // MARK: - CRUD
    
    func ajouter(_ couleur: CouleurCustom) {
        couleursCustom.append(couleur)
        sauvegarder()
        print("➕ Couleur ajoutée: \(couleur.nom)")
    }
    
    func supprimer(_ couleur: CouleurCustom) {
        couleursCustom.removeAll { $0.id == couleur.id }
        sauvegarder()
        print("🗑️ Couleur supprimée: \(couleur.nom)")
    }
    
    func modifier(_ couleur: CouleurCustom) {
        if let index = couleursCustom.firstIndex(where: { $0.id == couleur.id }) {
            couleursCustom[index] = couleur
            sauvegarder()
            print("✏️ Couleur modifiée: \(couleur.nom)")
        }
    }
    
    // MARK: - Recherche
    
    func rechercher(texte: String) -> [CouleurCustom] {
        guard !texte.isEmpty else { return couleursCustom }
        
        let recherche = texte.lowercased()
        return couleursCustom.filter { couleur in
            couleur.nom.lowercased().contains(recherche)
        }
    }
    
    func nomExiste(_ nom: String) -> Bool {
        return couleursCustom.contains { $0.nom.lowercased() == nom.lowercased() }
    }
}

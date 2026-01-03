//
//  RisqueCiguatera.swift
//  Go les Picots V.4
//
//  Enum temporaire pour Sprint 1
//  Sera intégré à EspecesDatabase.swift au Sprint 2
//
//  Created: 2026-01-02
//

import Foundation

/// Niveaux de risque de ciguatera pour les espèces
enum RisqueCiguatera: String, Codable, CaseIterable, Hashable {
    case aucun = "Aucun risque"
    case faible = "Risque faible"
    case modere = "Risque modéré"
    case eleve = "Risque élevé"
    case treseleve = "Risque très élevé"
}

// MARK: - NOTE IMPORTANTE
// La propriété risqueCiguatera est maintenant stockée directement dans EspeceInfo
// Elle n'est plus calculée via une extension computed (Sprint 2)

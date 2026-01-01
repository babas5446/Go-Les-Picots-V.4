//
//  TypeDeNagePickerSheet.swift
//  Go Les Picots V.4
//
//  Phase 2 - Multi-sélection des types de nage (max 3)
//  Created: 2025-12-31
//

import SwiftUI

struct TypeDeNagePickerSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTypes: [TypeDeNage]
    let onWobblingTapped: () -> Void
    let onJiggingTapped: () -> Void
    
    // État local pour gérer les sélections temporaires
    @State private var tempSelectedTypes: [TypeDeNage] = []
    
    // Limite maximale de sélection
    private let maxSelection = 3
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    // Option "Aucun"
                    Button {
                        tempSelectedTypes.removeAll()
                    } label: {
                        HStack {
                            Text("Aucun")
                                .foregroundColor(.primary)
                            Spacer()
                            if tempSelectedTypes.isEmpty {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color(hex: "0277BD"))
                            }
                        }
                    }
                    
                    // ⭐ WOBBLING EN HAUT (après Aucun)
                    Button {
                        onWobblingTapped()
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Wobbling")
                                    .foregroundColor(.primary)
                                Text("Large ou serré")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(hex: "0277BD"))
                                .font(.caption)
                        }
                    }
                    
                    // ⭐ JIGGING EN HAUT (après Wobbling)
                    Button {
                        onJiggingTapped()
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Jigging")
                                    .foregroundColor(.primary)
                                Text("Slow ou fast")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(hex: "FFBC42"))
                                .font(.caption)
                        }
                    }
                    
                    // Types standards avec checkboxes
                    ForEach(TypeDeNage.allCases.filter { type in
                        // Exclure les déclencheurs et leurs variantes
                        type != .wobbling &&
                        type != .wobblingLarge &&
                        type != .wobblingSerré &&
                        type != .jigging &&
                        type != .slowJigging &&
                        type != .fastJigging
                    }, id: \.self) { type in
                        typeRow(for: type)
                    }
                } header: {
                    HStack {
                        Text("Sélectionnez les types de nage")
                        Spacer()
                        Text("\(tempSelectedTypes.count)/\(maxSelection)")
                            .foregroundColor(tempSelectedTypes.count >= maxSelection ? .red : .secondary)
                    }
                } footer: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Les types avec flèche proposent des variantes adaptées aux conditions")
                        if tempSelectedTypes.count >= maxSelection {
                            Text("⚠️ Limite de \(maxSelection) types atteinte")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Types de nage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Valider") {
                        selectedTypes = tempSelectedTypes
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
        .onAppear {
            // Initialiser les sélections temporaires
            tempSelectedTypes = selectedTypes
        }
    }
    
    // MARK: - Type Row avec Checkbox
    
    private func typeRow(for type: TypeDeNage) -> some View {
        let isSelected = tempSelectedTypes.contains(type)
        let isDisabled = !isSelected && tempSelectedTypes.count >= maxSelection
        
        return Button {
            toggleSelection(for: type)
        } label: {
            HStack {
                // Checkbox
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? Color(hex: "0277BD") : (isDisabled ? .gray : .secondary))
                    .font(.title3)
                
                // Nom du type
                Text(type.rawValue)
                    .foregroundColor(isDisabled ? .secondary : .primary)
                
                Spacer()
            }
        }
        .disabled(isDisabled)
    }
    
    // MARK: - Toggle Selection
    
    private func toggleSelection(for type: TypeDeNage) {
        if let index = tempSelectedTypes.firstIndex(of: type) {
            // Désélectionner
            tempSelectedTypes.remove(at: index)
        } else {
            // Sélectionner (si sous la limite)
            if tempSelectedTypes.count < maxSelection {
                tempSelectedTypes.append(type)
            }
        }
    }
}

// MARK: - Preview
struct TypeDeNagePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        TypeDeNagePickerSheet(
            selectedTypes: .constant([.wobblingLarge, .darting]),
            onWobblingTapped: {},
            onJiggingTapped: {}
        )
    }
}

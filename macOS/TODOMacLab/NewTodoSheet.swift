import SwiftUI

// Formulario preparado: puedes leerlo, pero no necesitas editarlo.
struct NewTodoSheet: View {
    let onSave: (String) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var draftTitle = ""
    @FocusState private var titleIsFocused: Bool

    private var cleanTitle: String {
        draftTitle.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Nueva tarea").font(.title2.bold())
            TextField("¿Qué quieres hacer?", text: $draftTitle)
                .textFieldStyle(.roundedBorder)
                .focused($titleIsFocused)
                .accessibilityIdentifier("newTodoField")
            HStack {
                Spacer()
                Button("Cancelar") { dismiss() }
                    .keyboardShortcut(.cancelAction)
                Button("Guardar") { save() }
                    .keyboardShortcut(.defaultAction)
                    .disabled(cleanTitle.isEmpty)
                    .accessibilityIdentifier("saveTodoButton")
            }
        }
        .padding(24)
        .frame(width: 380)
        .onAppear { titleIsFocused = true }
    }

    private func save() {
        guard !cleanTitle.isEmpty else { return }
        onSave(cleanTitle)
        dismiss()
    }
}

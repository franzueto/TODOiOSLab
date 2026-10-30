import SwiftUI

@main
struct TODOMacLabApp: App {
    // Un mismo estado conecta el menú de macOS y el formulario de la ventana.
    @State private var isPresentingNewTodo = false

    var body: some Scene {
        Window("Mis tareas · \(LabSettings.ownerName)", id: "tasks") {
            TodoScreen(isPresentingNewTodo: $isPresentingNewTodo)
                .tint(LabSettings.accentColor)
        }
        // MAC 1: prueba width: 820, height: 560; son puntos, no píxeles.
        .defaultSize(width: 820, height: 560)
        .commands {
            // Sustituye el grupo de creación para no competir con Nueva ventana.
            CommandGroup(replacing: .newItem) {
                Button("Nueva tarea") {
                    // MAC 2: cambia isPresentingNewTodo a true (una línea).
                }
                // MAC 3: agrega el atajo Command + N (un modificador).
                .disabled(isPresentingNewTodo)
            }
        }
    }
}

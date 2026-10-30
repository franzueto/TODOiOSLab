import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isDone = false

    static let examples = [
        Todo(title: "Ejecutar mi app de macOS"),
        Todo(title: "Probar el menú Nueva tarea"),
        Todo(title: "Crear una tarea con ⌘N")
    ]
}

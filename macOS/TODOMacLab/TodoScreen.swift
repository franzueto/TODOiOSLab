import SwiftUI

struct TodoScreen: View {
    @Binding var isPresentingNewTodo: Bool
    @State private var todos = Todo.examples

    private var remainingCount: Int { todos.filter { !$0.isDone }.count }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Label("MI PRIMERA APP DE MAC", systemImage: LabSettings.symbolName)
                    .font(.caption.bold())
                    .foregroundStyle(LabSettings.accentColor)
                Text("Hecha por \(LabSettings.ownerName)")
                    .font(.largeTitle.bold())
                    .accessibilityIdentifier("ownerLabel")
                Text("\(remainingCount) de \(todos.count) pendientes")
                    .font(.headline)
                    .accessibilityIdentifier("remainingLabel")
            }
            .padding(24)
            Divider()
            List {
                if todos.isEmpty {
                    ContentUnavailableView("Tu lista está lista", systemImage: "checkmark.circle",
                                           description: Text("Usa + o Archivo → Nueva tarea."))
                }
                ForEach(todos) { todo in
                    HStack(spacing: 12) {
                        Button {
                            guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
                            todos[index].isDone.toggle()
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                .font(.title2)
                        }
                        .buttonStyle(.borderless)
                        .accessibilityLabel(todo.isDone ? "Marcar pendiente: \(todo.title)" : "Completar: \(todo.title)")
                        Text(todo.title)
                            .strikethrough(todo.isDone)
                            .foregroundStyle(todo.isDone ? .secondary : .primary)
                        Spacer()
                        Button(role: .destructive) {
                            todos.removeAll { $0.id == todo.id }
                        } label: { Image(systemName: "trash") }
                        .buttonStyle(.borderless)
                        .accessibilityLabel("Eliminar: \(todo.title)")
                    }
                    .padding(.vertical, 8)
                }
            }
            Divider()
            Text("En memoria · al salir de la app vuelven los ejemplos")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(16)
        }
        .frame(minWidth: 560, minHeight: 400)
        .toolbar {
            Button {
                isPresentingNewTodo = true
            } label: { Label("Nueva tarea", systemImage: "plus") }
            .help("Crear una tarea")
            .disabled(isPresentingNewTodo)
        }
        .sheet(isPresented: $isPresentingNewTodo) {
            NewTodoSheet { title in todos.append(Todo(title: title)) }
        }
    }
}

#Preview {
    TodoScreen(isPresentingNewTodo: .constant(false))
}

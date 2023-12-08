import SwiftUI

struct RegistrationView: View {
    @State private var name = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var agreedToTerms = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações Pessoais")) {
                    TextField("Nome", text: $name)
                    TextField("Nome de usuário", text: $username)
                    SecureField("Senha", text: $password)
                    SecureField("Confirme a senha", text: $confirmPassword)
                    TextField("Email", text: $email)
                }

                Section {
                    Toggle(isOn: $agreedToTerms) {
                        Text("Li e concordo com os termos de uso")
                    }
                }

                Section {
                    Button(action: {
                        // Implemente aqui a lógica para processar o formulário
                        self.registerUser()
                    }) {
                        Text("Cadastrar")
                    }
                    .disabled(!isValidForm())
                }
            }
            .navigationBarTitle("Cadastro")
        }
    }

    func isValidForm() -> Bool {
        return !name.isEmpty && !username.isEmpty && !password.isEmpty && password == confirmPassword && !email.isEmpty && agreedToTerms
    }

    func registerUser() {
        // Implemente aqui a lógica para registrar o usuário
        // Você pode acessar os valores dos campos usando as propriedades @State (name, username, password, etc.)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RegistrationView()
        }
    }
}

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @Binding var isLoggedIn: Bool
    
    init(isLoggedIn: Binding<Bool>) {
        _isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        VStack {
            Text("SNCKTIME")
                .font(.largeTitle)
                .padding()
            
            TextField("Nome de usuário", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Implemente a lógica de autenticação aqui
                if self.username == "usuario" && self.password == "senha" {
                    // Autenticação bem-sucedida
                    // Você pode navegar para a próxima tela ou realizar outra ação aqui
                } else {
                    // Exibir uma mensagem de erro ou feedback ao usuário
                }
            }) {
                Text("Login")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var isLoggedIn = false // Variável de estado temporária

    static var previews: some View {
        LoginView(isLoggedIn: $isLoggedIn)
    }
}

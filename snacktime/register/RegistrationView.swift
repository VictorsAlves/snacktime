import SwiftUI
struct RegistrationView: View, IRegistrationViewProtocol {
    
    func updateView(_ n: String) {
        print(n)
    }
    
    @State private var name = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var agreedToTerms = false
    
    private var ipresenter: IRegistrationPresenterProtocol? // Removi a inicialização aqui

    init() {
        self.ipresenter = RegistrationPresenter(self)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações Pessoais")) {
                    TextField("Nome", text: $name)
                    TextField("Nome de usuário", text: $username)
                    SecureField("Senha", text: $password)
                    SecureField("Confirmação de senha", text: $confirmPassword)
                    TextField("Email", text: $email)
                }

                Section {
                    Toggle(isOn: $agreedToTerms) {
                        Text("Li e concordo com os termos de uso")
                    }
                }

                Section {
                    Button(
                        action: {
    //acao
                    }) {
                        Text("Cadastrar")
                    }
                   
                }
            }
            .navigationBarTitle("Cadastro")
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

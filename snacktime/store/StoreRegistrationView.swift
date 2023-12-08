import SwiftUI
struct StoreRegisterView: View, IStoreRegistrationViewProtocol, IRegistrationViewProtocol {
    
    func updateView(_ n: String) {
        print(n)
    }
    
    @State private var name = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var agreedToTerms = false
    
    private var ipresenter: IStoreRegistrationViewProtocol?

    init() {
        self.ipresenter = StoreRegistrationPresenter(self) as? any IStoreRegistrationViewProtocol
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Endereco")) {
                    TextField("Nome", text: $name)
                    Button(
                        action: {
          //acao
                    }) {
                        Text("obter endereco")
                    }
                    TextField("Cep", text: $username)
                    TextField("Estado", text: $password)
                    TextField("Bairro", text: $confirmPassword)
                    TextField("Rua", text: $email)
                    TextField("Numero", text: $email)
             
                }
                
                Section(header: Text("Juridico")) {
                    TextField("Cnpj", text: $name)
                }
     

                Section {
                    Button(
                        action: {
//acao
                    }) {
                        Text("Salvar")
                    }
                   
                }
            }
            .navigationBarTitle("Registro da Loja")
        }
    }
}

struct StoreRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        StoreRegisterView()
    }
}

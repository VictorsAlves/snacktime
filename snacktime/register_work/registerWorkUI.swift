import SwiftUI

struct RegistroView: View {
    @State private var idString: String = ""
    @State private var cargo: String = ""
    @State private var salario: String = ""
    @State private var imposto: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Registro")) {

                    TextField("Cargo", text: $cargo)

                    TextField("Salário", text: $salario)
                        .keyboardType(.decimalPad)

                    TextField("Imposto", text: $imposto)
                        .keyboardType(.decimalPad)
                }

                Button(action: {
                    if let id = Int(idString) {
                        // Aqui você pode tratar o registro dos dados.
                        // Você pode criar um objeto a partir dos valores e enviá-lo para um servidor ou banco de dados.
                        let registro = Registro(id: id, cargo: cargo, salario: Double(salario) ?? 0.0, imposto: Double(imposto) ?? 0.0)
                        print("Registro realizado: \(registro)")
                    } else {
                        // Trate o caso em que a conversão de ID para Int falhou.
                        print("Erro: O ID não é um número válido")
                    }
                }) {
                    Text("Registrar")
                }
            }
            .navigationTitle("Registro de Dados")
        }
    }
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}

struct Registro {
    var id: Int
    var cargo: String
    var salario: Double
    var imposto: Double
}

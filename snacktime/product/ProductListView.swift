import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let description: String
    let imageName: String
}

struct ProductListView: View {
    let products = [
        Product(name: "Produto 1", price: "$19.99", description: "Descrição do Produto 1", imageName: "product1"),
        Product(name: "Produto 2", price: "$29.99", description: "Descrição do Produto 2", imageName: "product2"),
        Product(name: "Produto 3", price: "$39.99", description: "Descrição do Produto 3", imageName: "product3"),
        Product(name: "Produto 4", price: "$49.99", description: "Descrição do Produto 4", imageName: "product4"),
        Product(name: "Produto 5", price: "$59.99", description: "Descrição do Produto 5", imageName: "product5")
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(products) { product in
                        VStack {
                            NavigationLink(destination: ProductDetail(product: product)) {
                                ProductCardView(product: product)
                            }
                            Spacer().frame(height: 24) // Adicionar espaço entre os cards
                        }
                    }
                }
                .navigationBarTitle("Lista de Produtos")
                
                Button(action: {
                    // Ação a ser executada quando o botão é pressionado
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
        }
    }
}

struct ProductCardView: View {
    let product: Product
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text(product.price)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                Text(product.description)
                    .font(.body)
            }
            .padding()
        }
        .background(Color.red)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(10)
    }
}

struct ProductDetail: View {
    let product: Product
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(product.name)
                .font(.title)
            
            Text(product.price)
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Text(product.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(product.name)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}


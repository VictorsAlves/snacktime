//
//  ProductRegistrationView.swift
//  snacktime
//
//  Created by victor.de.s.alves on 27/10/23.
//

import SwiftUI





import SwiftUI

struct ProductRegistrationView: View {
    @State private var image: Image?
    @State private var showImagePicker = false
    @State private var showCamera = false
    @State private var name = ""
    @State private var description = ""
    @State private var price = ""
    @State private var weight = ""

    var body: some View {
       
        VStack {
             ZStack {
                 Rectangle()
                     .fill(Color.gray)
                     .frame(width: 200, height: 200)
                     .cornerRadius(10)
             }
             
             HStack {
                 Spacer()
                 Button(action: {
                     self.showCamera.toggle()
                 }) {
                     Image(systemName: "camera")
                         .resizable()
                         .frame(width: 35, height: 35)
                 }
                 .foregroundColor(.black)
                 .sheet(isPresented: $showCamera) {
                     ImagePicker(sourceType: .camera, image: self.$image)
                 }
                 
                 Spacer()
                 
                 Button(action: {
                     self.showImagePicker.toggle()
                 }) {
                     Image(systemName: "photo.on.rectangle")
                         .resizable()
                         .frame(width: 35, height: 35)
                 }
                 .foregroundColor(.black)
                 .sheet(isPresented: $showImagePicker) {
                     ImagePicker(sourceType: .photoLibrary, image: self.$image)
                 }
                 Spacer()
             }
             .padding()
             
             TextField("Nome", text: $name)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()

             TextField("Descrição", text: $description)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()

             TextField("Preço", text: $price)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .keyboardType(.decimalPad)
                 .padding()

             TextField("Peso", text: $weight)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .keyboardType(.decimalPad)
                 .padding()

             Spacer()
            Button(action: {
                            // Ação a ser executada quando o botão é pressionado
                        }) {
                            HStack {
                                Text("Continuar")
                                Image(systemName: "arrow.right.circle")
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }

         }
         .padding()
     }
 
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var image: Image?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }

            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    ProductRegistrationView()
}

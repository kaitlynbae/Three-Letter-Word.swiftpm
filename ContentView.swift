import SwiftUI

struct ContentView: View {
    let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
                   "R","S","T","U","V","W","X","Y","Z"]
    
    @State var word = ["0","1","2"]
    @State var letterPosition = 0
    @State var showAlert = false 
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<word.count, id:\.self){ value in 
                Text(word[value])
                    .frame(width:100, height: 75, alignment: .center)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
        }
        Divider()
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(letters, id:\.self){ item in
                Text(item)
                    .onTapGesture{
                        word[letterPosition] = item 
                        letterPosition += 1 
                        if letterPosition == word.count{
                            showAlert = true 
                        }
                    }
            }
        }
        Button("Reset"){
            showAlert.toggle()
        }
        .alert("Reseting", isPresented: $showAlert) { 
            Button("OK"){
                letterPosition = 0 
                for value in 0..<word.count{
                    word[value] = "?"
                }
            }
        }
        .frame(width: 300, height: 75, alignment: .center)
        .background(.blue)
        .foregroundColor(.white)
        .font(.largeTitle)
    }
}

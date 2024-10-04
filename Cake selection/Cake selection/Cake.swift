import SwiftUI

struct Cake: Identifiable{
    var id = UUID()
    var flavor: Color
    var size: Double
    var cherry: Bool
    var sweet: Double
}
struct ContentView1: View {
    @State var flavor = Color.gray
    @State var size = 1.00
    @State var cherry : Bool = false
    @State var sweet : Double = 50.0
    @State var menu: [Cake] = []
    var body: some View {
        NavigationView{
            VStack {
                Text("🍰 My Bakery 🎂")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
                
                ZStack{
                    Image(systemName: "birthday.cake.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundStyle(flavor)
                        .scaleEffect(size)
                        .padding(.top,20)
                        .padding(.bottom,30)
                        .opacity(sweet / 100)
                        .animation(.bouncy, value:size)
                        .animation(.smooth, value: flavor)
                        .animation(.easeIn, value: sweet)
                    if cherry{
                        Text("🍒")
                            .font(.system(size: 65))
                            .animation(.smooth, value: cherry)
                    }
                }
                HStack{
                    
                    Text("Flavor")
                        .padding(.top,30)
                        .padding(.leading,10)
                    Spacer()
                    Picker("",selection:$flavor){
                        Text("non").tag(Color.gray)
                        Text("Vanilla").tag(Color.orange)
                        Text("Cocoa").tag(Color.brown)
                        Text("Berry").tag(Color.pink)
                            .padding(10)
                    } .tint(.green)
                    
                    
                    
                }
                
                
                HStack{ Text("Size")
                        .padding(10)
                    Spacer()
                    Picker("",selection:$size){
                        Text("Normal").tag(1.0)
                        Text("large").tag(1.3)
                    }
                    .tint(.green)
                    
                }
                Toggle("Add cherry", isOn: $cherry)
                    .tint(.green)
                    .padding(10)
                Text(String(format: "Sweetness : %.0f",sweet))
                Slider(value: $sweet, in: 20...100)
                    .animation(.easeIn, value: sweet)
                    .padding([.leading, .trailing])
                HStack{
                    Button("Random", systemImage: "shuffle"){
                        flavor = [Color.orange, Color.brown, Color.pink].randomElement()!
                        size = [1.0, 1.3].randomElement()!
                        cherry = Bool.random()
                        sweet = Double.random(in: 20...100)
                    }
                    .padding(10)
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    Button("Create",
                           systemImage: "bookmark.square.fill") {
                        let cake = Cake(flavor: flavor, size:size, cherry: cherry, sweet:sweet)
                        menu.append(cake)
                        
                    }.padding(10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                    
                    
                }
                Spacer()
                
                NavigationLink{
                    Menuview(menu: menu)
                } label: {
                    Text("Next page")
                }
            }
            
//            .padding()
//            Spacer()
        }.navigationTitle("My BAkery")

            
        
        
        }
    }
struct Menuview: View {
    var menu: [Cake]
    var body: some View {
        List(menu){ item in
            HStack{
                ZStack{
                    Image(systemName: "birthday.cake.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(item.flavor)
                        .scaleEffect(item.size)
                        .padding(.top,20)
                        .padding(.bottom,30)
                        .opacity(item.sweet / 100)

                    if item.cherry{
                        Text("🍒")
                            .font(.system(size: 65))
                            .animation(.smooth, value: item.cherry)
                    }
                }
                VStack{
                    Text("Flavor : \(item.size)")
                    Text("Sweetness : \(item.sweet)")}
            }
            
            
        }
        
    }
}

#Preview {
    ContentView1()
}

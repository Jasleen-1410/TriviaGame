
import SwiftUI

struct CategoryView: View {
    
    var category: [Category] = CategoryArray.arr

//    @EnvironmentObject var categoryManager: CategoryManager
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
    
        NavigationView {
            VStack(){
                Text("Trivia Game")
                    .orangeTitle()
                    .padding()
            
                SubTitleView(text: "Category")
                HStack{
                    Text("Choose any One")
                        .font(.caption)
                    Spacer()
                }.padding(0)
                
                // cards
                ScrollView(.vertical, showsIndicators: true){
                    ForEach(category, id: \.id){ cat in
                        
                        CategoryRow(category: Category(text: cat.text,
                                                       value: cat.value))
                            .environmentObject(TriviaManager())
                    }
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width - 30,
                   maxHeight: .infinity,
                   alignment: .leading)
            .ignoresSafeArea(edges: [.bottom])
            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(TriviaManager())
    }
}

//
//  ContentView.swift
//  TestProjectSwiftUI
//
//  Created by Madina Olzhabek on 02.07.2024.
//

import SwiftUI
import SwiftyJSON

struct ContentView: View {
    @StateObject var personList = GetPerson()
    @State private var showingSheet = false
    
    var body: some View {
           NavigationStack {
               
                ScrollView {
                  LazyVStack {
                    ForEach(personList.personArray) { person in
                      NavigationLink {
                        SecondView(person: person)
                             
                      } label: {
                        NewsRow(person: person)
                          .padding(.vertical, 10)
                        }
                    }
                    
                  }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(ImageResource.avatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(.circle)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            Image(systemName: "camera")
                            Image(systemName: "bell")
                                .padding()
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
         }
       }

#Preview {
    ContentView()
}


struct NewsRow: View {
    var person: Person
    var body: some View {
        
        
        VStack {
            
            HStack {
                AsyncImage(url: URL(string: person.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
               .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text(person.name)
                        .bold()
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    Text(person.country)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(person.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 8)
                .foregroundColor(.gray)
            AsyncImage(url: URL(string: person.postPhoto1)) { image in
                image.resizable()
                    .frame(width: 340, height: 400)
                    .cornerRadius(25)
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }

            
            HStack{
                Image(systemName: "heart")
                    .foregroundColor(.black)
                Text(person.likes)
                    .padding(.trailing, 40)
                    .foregroundStyle(.black)
                
                Image(systemName: "message")
                    .foregroundColor(.black)
                Text(person.comments)
                    .foregroundStyle(.black)

                
                HStack{
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                    Text(person.share)
                        .foregroundStyle(.black)
                    
                }.frame(maxWidth: .infinity ,alignment: .trailing)
                    .padding(.trailing, 15)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading , 15)
                .padding(.top , 8)
            
        }.frame(alignment: .leading)
            .padding(20)
            
    }
}

class GetPerson: ObservableObject {
    @Published var personArray = [Person]()
    
    init() {
        updateData()
    }
    
    func updateData() {
        let urlString = "https://demo4031576.mockable.io/newsrowswiftui"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url!) { data, _, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            let json = JSON(data!)
            
            if let resultArray = json.array{
                self.personArray.removeAll()
                for item in resultArray{
                    let personItem = Person(json: item)
                    print("hello")
                    DispatchQueue.main.async {
                        self.personArray.append(personItem)
                        print("dispatch")
                    }
                }
            }
        }.resume()
    }
}

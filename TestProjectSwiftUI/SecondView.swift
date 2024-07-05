//
//  SecondView.swift
//  TestProjectSwiftUI
//
//  Created by Madina Olzhabek on 02.07.2024.
//

import SwiftUI

struct SecondView: View {
    var person: Person
    @State private var photoTapped = true
    @State private var videoTapped = false
    @State private var likesTapped = false
    @State private var aboutTapped = false
    
    var body: some View {
     
        ScrollView{
            VStack{
                
                ZStack(alignment: .bottom){
                    
                    AsyncImage(url: URL(string: person.postPhoto1)) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width:  UIScreen.main.bounds.width ,height: 400)
//                     не знаю почему по ширине что-то не так там слева белая полоса. отступ не понятный
                    .aspectRatio(contentMode: .fill)

                    
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.9),
                            Color.clear,
                            Color.white.opacity(0.4)
                        ],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .aspectRatio(contentMode: .fill)
                    
                    
                    VStack{
                        AsyncImage(url: URL(string: person.image)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)
                        
                        Text(person.name)
                            .foregroundStyle(.black)
                            .bold()
                            .font(.system(size: 20))
                        Text(person.profession)
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                    }
                    
                }
                
                
                HStack{
                    VStack{
                        Text(person.following)
                            .bold()
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                        Text("Following")
                            .foregroundStyle(.gray)
                            .font(.system(size: 10))
                    }  .padding(30)
                    VStack{
                        Text(person.followers)
                            .bold()
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                        Text("Followers")
                            .foregroundStyle(.gray)
                            .font(.system(size: 10))
                    } .padding(30)
                    
                    VStack{
                        Text(person.commonLikes)
                            .bold()
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                        Text("Likes")
                            .foregroundStyle(.gray)
                            .font(.system(size: 10))
                    }.padding(30)
                }
                
                HStack{
                    Button("Follow") {
                        print("follow tapped")
                    }
                    .frame(width: 120, height: 48)
                        .background(.black)
                        .cornerRadius(24)
                        .foregroundStyle(.white)
                        .padding(25)
                    
                    Button("Message") {
                        print("message tapped")
                    }
                        .frame(width: 120, height: 48)
                        .border(.black, width: 1)
                        .cornerRadius(24)
                        .foregroundStyle(.black)
                        .padding(25)
//                    хз че с кнопкой поечму бордер норм не окрашивается
                }
                HStack{
                    Button("Photo") {
                        print("photo")
                        if !photoTapped {
                            photoTapped.toggle()
                            videoTapped = false
                            likesTapped = false
                            aboutTapped = false
                        }
                        
                    }.padding()
                        .foregroundColor(photoTapped ? .black : .gray)
                        .bold()
                    Button("Video") {
                        print("Video")
                        if !videoTapped {
                            videoTapped.toggle()
                            photoTapped = false
                            likesTapped = false
                            aboutTapped = false
                        }
                    }.padding()
                        .foregroundColor(videoTapped ? .black : .gray)
                        .bold()
                    
                    Button("Likes") {
                        print("Likes")
                        if !likesTapped {
                            likesTapped.toggle()
                            photoTapped = false
                            videoTapped = false
                            aboutTapped = false
                        }
                    }.padding()
                        .foregroundColor(likesTapped ? .black : .gray)
                        .bold()
                    
                    Button("About") {
                        print("About")
                        if !aboutTapped {
                            aboutTapped.toggle()
                            photoTapped = false
                            likesTapped = false
                            videoTapped = false
                        }
                    }.padding()
                        .foregroundColor(aboutTapped ? .black : .gray)
                        .bold()
                }
                .padding()
                
                LazyVGrid(columns: [GridItem(.fixed(180)), GridItem(.fixed(180))], content: {
                   
                    ForEach(1...7, id: \.self) { number in
                        AsyncImage(url: URL(string: person.postPhoto1), content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                
                        }, placeholder: {
                            ProgressView()
                        })
                          
                            .frame(width: 180, height: 150)
                            .clipped()
//                            .presentationCornerRadius(40)
                    }
                   
                })
                
               
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    SecondView(person: Person())
}



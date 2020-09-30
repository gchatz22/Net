//
//  Feed.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/10/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct Feed: View {
    
    var secBkg: Color = Color("secBkg")
    var mainBkg: Color = Color("mainBkg")
    
    var body: some View {
        
            
                
        ScrollView(.vertical){
            
            
            TopBar()
            
            VStack{
                PostView()
                PostView()
                PostView()
                PostView()
                PostView()
                PostView()
                PostView()
            }.background(secBkg)
        }
        .offset(y: 0.1)
        .background(mainBkg)
            
    }
}


struct PostView: View{
    
    var mainBkg: Color = Color("mainBkg")
    
    var body: some View {
        VStack{
            HStack{
                Image("person1")
                    .resizable()
                    .frame(width: 60, height: 44)
                    .clipShape(Circle())
                
                VStack{
                    HStack{
                        Text("Name")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        Spacer()
                        Text("Location")
                            .font(.subheadline)
                    }
                    
                    HStack{
                        Text("2h")
                            .font(.footnote)
                        Spacer()
                    }
                    
                }
            }.padding()
            
            HStack{
                Text("Vivamus sit amet mi varius, dignissim massa at, auctor metus. Nunc id metus sed lectus interdum venenatis sit amet a felis. Ut non lorem vitae tellus laoreet maximus ullamcorper vel ex.")
                    .font(.system(size: 22))
                    
                Spacer()
            }
            .padding([.leading, .bottom])
            
        }
        .background(mainBkg)
    }
    
}

struct TopBar: View{
    
    @State var eventFormPresented: Bool = true
    var mainBkg: Color = Color("mainBkg")
 
    var body: some View{
    
        VStack{
        
            HStack{
                Text("Net")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button(action: {
                    self.eventFormPresented.toggle()
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .padding(4)
                        .frame(width: 28, height: 28)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $eventFormPresented, content: {
                    EventForm(eventFormPresented: self.$eventFormPresented)
                })
                
                
            }.padding([.top, .horizontal])
            
            Divider().padding(.horizontal)
    
        }.background(mainBkg)
    }
    
}


struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}

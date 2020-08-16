//
//  Feed.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/10/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct Feed: View {
    
    var grayColor: Color = Color(red: 230/255, green: 230/255, blue: 230/255)
    
    var body: some View {
        
            
                
        ScrollView(.vertical){
            
            
            TopBar()
            
            VStack{
                Post()
                Post()
                Post()
                Post()
                Post()
                Post()
                Post()
            }.background(grayColor)
        }
        .offset(y: 0.1)
        .background(Color.white)
            
    }
}


struct Post: View{
    
    
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
        .background(Color.white)
    }
    
}

struct TopBar: View{
 
    var body: some View{
    
        VStack{
        
            HStack{
                Text("Net")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button(action: {
                    print("hey")
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .padding(3)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }.padding([.top, .horizontal])
            
            Divider().padding(.horizontal)
    
        }.background(Color.white)
    }
    
}


struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}

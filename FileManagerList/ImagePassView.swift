//
//  ImagePassView.swift
//  FileManagerList
//
//  Created by Guru Mahan on 10/01/23.
//

import SwiftUI

struct ImagePassView: View {
    var image: UIImage?
    let title1:String?
    let subTitle1:String?
    var body: some View {
        ZStack{
            VStack{
                if let img = image{
                    Image(uiImage: img)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: 250,height: 250)
                        .cornerRadius(125)
                      
                }
                VStack(alignment: .leading,spacing: 10){
                    let str = title1?.components(separatedBy:".").first
                    HStack{
                        Text("Title:")
                            .font(.headline)
                            .font(Font.system(size: 20))
                        Text(str ?? "")
                            .foregroundColor(Color.red.opacity(0.8))
                    }
                    HStack{
                        Text("Type:")
                            .font(.headline)
                            .font(Font.system(size: 20))
                        Text(subTitle1 ?? "")
                            .foregroundColor(Color.red.opacity(0.8))
                    }
                    
                  
                }
              
            }
            
        }
     
    }
}

struct ImagePassView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePassView(title1: nil, subTitle1: nil)
    }
}

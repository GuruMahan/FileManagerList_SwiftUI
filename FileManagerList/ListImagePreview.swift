//
//  ListImagePreview.swift
//  FileManagerList
//
//  Created by Guru Mahan on 10/01/23.
//

import SwiftUI
import QuickLook
struct ListImagePreview: View {
//    var callForword: ((_ infoToReturn: UIImage?) -> ())?
//    var callBack:(UIImage?) ->() = {_ in }
    let listImg: UIImage?
    let title:String?
    let subTitle:String?
    
    @State var showingPreview = false
    var body: some View {
        NavigationStack{
            ZStack {
                if let img = listImg{
                    Image(uiImage: img)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .onTapGesture {
                            showingPreview = true
                        }
                        .sheet(isPresented: $showingPreview) {
                            ImagePassView(image: listImg,title1: title, subTitle1: subTitle )
                        }
                } else {
                    VStack{
                        Text("Hello")
                    }
                }
            }
        }

    }
}

struct ListImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ListImagePreview(listImg: nil,title: nil,subTitle: nil)
    }
}

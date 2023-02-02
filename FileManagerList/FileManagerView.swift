//
//  ContentView.swift
//  FileManagerList
//
//  Created by Guru Mahan on 06/01/23.
//
//"https://jsonplaceholder.typicode.com/photos"
import SwiftUI

struct FileManagerView: View {
@ObservedObject var viewModel = FilemanagerViewModel()
   
    var fileModel : FilemanagerModel?
    @State var fileSelected = false
    @State var selectImage = false
    //@State var ListimageView = ListImagePreview()

    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    Button {
                     fileSelected = true
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                           .frame(width: 40,height: 40)
                            .foregroundColor(.black)
                    }
                    
                }.padding(10)
                
                List{
                    
                    ForEach(0..<(viewModel.fileModel.count),id: \.self){ index in
                       let model = viewModel.fileModel[index]
                        if model.title.isEmpty{
                            EmptyView()
                        
                        }else{
                            listView(list:model, index: index )
                                .onTapGesture {
                                    viewModel.selectedIndex = index
                                    selectImage = true
                                    }
                        }
                    }.onDelete { indexSet in
                        viewModel.fileModel.remove(atOffsets: indexSet)
                    }
                }
                
                
        }
            .navigationTitle("Downloading Images!")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .sheet(isPresented: $selectImage, content: {
            
            ListImagePreview(listImg: viewModel.fileModel[viewModel.selectedIndex].image,title: viewModel.fileModel[viewModel.selectedIndex].title,subTitle: viewModel.fileModel[viewModel.selectedIndex].subTitle)
        })
        .fileImporter(isPresented: $fileSelected, allowedContentTypes: [.image,.data,.url]) { result in
            do{
                
                let fUrl = try result.get()
                
             //   viewModel.fileModel[0].title = fUrl.
//                viewModel.fileModel[0].subTitle = fUrl.pathExtension
                
                if fUrl.startAccessingSecurityScopedResource(){
                    let data = try Data(contentsOf: fUrl)
                    if let img = UIImage(data: data) {
                        print(fUrl)
                        let fileM = FilemanagerModel(title: fUrl.lastPathComponent, subTitle: fUrl.pathExtension,image: img )
                        viewModel.fileModel.append(fileM)
        
                       // viewModel.fileModel[0].image = img
                  
                    }
                    fUrl.stopAccessingSecurityScopedResource()
                }
            } catch{
                
            }
        }
    }
    
    @ViewBuilder func listView(list: FilemanagerModel,index: Int) -> some View{
      
        HStack{
            if let img = list.image{
                Image(uiImage: img )
                    .resizable()
                    .frame(width: 60,height: 60)
                   // .frame(maxHeight: .infinity)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                  
            }else{
                Image(systemName: "" )
                    .resizable()
                    .frame(width: 60)
                    .frame(maxHeight: .infinity)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
           
            VStack(alignment: .leading) {
             //   subStr =  list.title
                let str = list.title.components(separatedBy:".").first
                Text( "Title: \(str ?? "")")
                   // .font(.headline)
                Text("Type: \(list.subTitle)")
                    .font(.headline)
                    .foregroundColor(.black)
                 //   .italic()
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        
       
    }
  
    @ViewBuilder func EmptyView() -> some View{
        HStack{
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}

//
//  FileManagerViewModel.swift
//  FileManagerList
//
//  Created by Guru Mahan on 06/01/23.
//

import Foundation
import Combine


class FilemanagerViewModel : ObservableObject {
    @Published var selectedIndex = 0
    @Published var fileModel = [FilemanagerModel]()
}






























//MARK: -> decodeApiClass
//class PhotoModelDataService {
//    @Published var photoModels: [PhotoModel] = []
//    var cancllables = Set<AnyCancellable>()
//    static let instance = PhotoModelDataService()
//
//
//    private init() {
//        downloadData()
//    }
//
//
//    func downloadData() {
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
//        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
//            .receive(on: DispatchQueue.main)
//            .tryMap(handleOutput)
//            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
//            .sink { (completion) in
//                switch completion{
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error downloading data. \(error)")
//                }
//            } receiveValue: { [weak self ] (returnedPhotoModels) in
//                    self?.photoModels = returnedPhotoModels
//            }
//            .store(in: &cancllables)
//
//    }
//
//   private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
//        guard let response = output.response as? HTTPURLResponse,
//              response.statusCode >= 200 && response.statusCode < 300 else {
//            throw URLError(.badServerResponse)
//        }
//        return output.data
//    }
//
//}

//MARK: -> viewModelClass
//class FileManagerViewModel: ObservableObject {
//    var cancllables = Set<AnyCancellable>()
//    @Published var dataArray: [PhotoModel] = []
  //  let dataService = PhotoModelDataService.instance
//    init(){
//        addSubscribers()
//    }
    
//    func addSubscribers() {
//        dataService.$photoModels
//            .sink {[weak self] (returnedPhotoModels) in
//                self?.dataArray = returnedPhotoModels
//
//            }
//            .store(in: &cancllables)
//    }
//
//}

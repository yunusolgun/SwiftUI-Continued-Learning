//
//  FilemanagerBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 28.03.2025.
//

import Foundation
import SwiftUI



class LocalFileManager {
    
    static let instance = LocalFileManager()
    let folderName = "MyApp_images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
                .first?.appendingPathComponent(folderName).path
                else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("Success creating folder")
            } catch let error {
                print("Error creating folder: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
                .first?.appendingPathComponent(folderName).path
        else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder: \(error.localizedDescription)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        
        guard
            let data = image.jpegData(compressionQuality: 1),
            let path = getPathForImage(name: name)
        else {
            return "Error getting data"
        }
        
     
        do {
            try data.write(to: path)
            print(path)
            return "Image saved successfully!"
        } catch {
            return "Error saving image: \(error.localizedDescription)"
        }
        
    }
    
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path(),
            FileManager.default.fileExists(atPath: path)
        else {
            print("Error getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)

    }
    
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
            print("Error creating path")
            return nil
        }
        return path
    }
    
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            return "Error getting path"
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return("Succesfully deleted")
        } catch let error {
            return("Error deleting image. \(error)")
        }
        
        
    }
    
}


class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "steve"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
        //getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {
            return
        }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
    
}

struct FilemanagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width:200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack {
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
 
                
                Spacer()
                
            
            }
            .navigationTitle("Filemanager")
            
        }
    }
}

#Preview {
    FilemanagerBootcamp()
}


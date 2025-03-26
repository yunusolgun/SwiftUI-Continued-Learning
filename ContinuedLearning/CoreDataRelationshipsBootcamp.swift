//
//  CoreDataRelationshipsBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 26.03.2025.
//

import SwiftUI
import CoreData

/*
 BusinessEntity
 DepartmantEnitity
 EmployeeEnititiy
 */

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfully")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
    
}

class CoreDataRelationshipsViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var departmens: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            try businesses = manager.context.fetch(request)
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
        
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            try departmens = manager.context.fetch(request)
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
        
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            try employees = manager.context.fetch(request)
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
        
    }
        
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
        
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Engineering"
        //newDepartment.busineses = [businesses[0]]
        
        //newDepartment.employees = [employees[1]]
        newDepartment.addToEmployees(employees[1])
        save()
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.age = 99
        newEmployee.dateJoined = Date()
        newEmployee.name = "Emily"
        //newEmployee.department = departmens[0]
        //newEmployee.business = businesses[0]
        save()
    }
    
    func save() {
        businesses.removeAll()
        departmens.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
        
        
    }
    
    
}

struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Button {
//                        vm.addBusiness()
                        vm.addDepartment()
//                        vm.addEmployee()
                    } label: {
                        Text("Perform Action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        ForEach(vm.businesses) { business in
                            BusinessView(entity: business)
                        }
                    })
                    
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        ForEach(vm.departmens) { department in
                            DepartmentView(entity: department)
                        }
                    })
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        ForEach(vm.employees) { employee in
                            EmployeeView(entity: employee)
                        }
                    })
                    

                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}


struct BusinessView: View {
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:").bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:").bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
                
                
        }
        .padding()
        .frame(maxWidth:300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            
            
            if let businesses = entity.busineses?.allObjects as? [BusinessEntity] {
                Text("Businesses:").bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:").bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
                
                
        }
        .padding()
        .frame(maxWidth:300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")").bold()
            Text("Age: \(entity.age)").bold()
            Text("Date joined: \(entity.dateJoined ?? Date())").bold()
            Text("Business: \(entity.business?.name ?? "")").bold()
            Text("Department: \(entity.department?.name ?? "")").bold()

                
        }
        .padding()
        .frame(maxWidth:300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

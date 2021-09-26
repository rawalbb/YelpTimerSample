//
//  BusinessViewModel.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import Foundation

protocol BusinessListDelegate{
    
    func listUpdated(_ businessList: [BusinessTime])
}

class BusinessViewModel{
    
    var delegate: BusinessListDelegate?
    var businessList : [BusinessTime] = []
    
    init(){
        loadBusinesses()
    }
    
    func loadBusinesses(){
        print("Loading")
        NetworkService.request(.getBusinessSearch) { (result: Result<Businesses, Error>) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let businesses):
                for entry in businesses.business{
                    self.businessList.append(BusinessTime(name: entry.name))
                }
                self.delegate?.listUpdated(self.businessList)
            }
        }
    }
}


struct BusinessTime{
    let name: String
    var time = Int.random(in: 5...60)
}

//
//  ServerContactFull.swift
//  BoomTalkStore
//
//  Created by Jon Capuano on 8/15/15.
//  Copyright (c) 2015 BoomTown. All rights reserved.
//

import Foundation
import Argo

public struct ServerContactFull:Decodable {
    public let contactId:Int64
    public let firstName:String
    public let lastName:String
    public let isBuyerLead:Bool?
    public let isSellerLead:Bool?
    public let callCount:Int?
    public let lastCallDate:NSDate?
    public let emailCount:Int?
    public let lastEmail:NSDate?
    public let textCount:Int?
    public let lastDateText:NSDate?
    public let registerDate:NSDate?
    public let bestPhone:String?
    public let autoEAlertEnabled:Bool?
    public let searchTotal:Int64?
    public let city:String?
    public let state:String?
    public let zipCode:String?
    public let showStreet:Bool?
    public let description:String?
    public let roleId:Int64?
    public let tenantId:Int?
    public let photoLink:String?
    
    static func create(contactId:Int64)
        (firstName:String)
        (lastName:String)
        (isBuyerLead:Bool?)
        (isSellerLead:Bool?)
        (callCount:Int?)
        (lastCallDate:NSDate?)
        (emailCount:Int?)
        (lastEmail:NSDate?)
        (textCount:Int?)
        (lastDateText:NSDate?)
        (registerDate:NSDate?)
        (bestPhone:String?)
        (autoEAlertEnabled:Bool?)
        (searchTotal:Int64?)
        (city:String?)
        (state:String?)
        (zipCode:String?)
        (showStreet:Bool?)
        (description:String?)
        (roleId:Int64?)
        (tenantId:Int?)
        (photoLink:String?)
        -> ServerContactFull {
            return ServerContactFull(contactId: contactId, firstName: firstName, lastName: lastName, isBuyerLead: isBuyerLead, isSellerLead: isSellerLead, callCount: callCount, lastCallDate: lastCallDate, emailCount: emailCount, lastEmail: lastEmail, textCount: textCount, lastDateText: lastDateText, registerDate: registerDate, bestPhone: bestPhone, autoEAlertEnabled: autoEAlertEnabled, searchTotal: searchTotal, city: city, state: state, zipCode: zipCode, showStreet: showStreet, description: description, roleId: roleId, tenantId: tenantId, photoLink: photoLink)
    }
    
    //This looks bizarre but the swift compiler can't handle the type checking
    //complexity of this statement as one giant curried chain. 
    //Breaking it into chunks not only fixes the issue, 
    //but improves the compile time significantly
    public static func decode(j: JSON) -> Decoded<ServerContactFull> {
        let firstPart =  ServerContactFull.create
            <^> j <| "contactId"
            <*> j <| "firstName"
            <*> j <| "lastName"
            <*> j <|? "isBuyerLead"
            <*> j <|? "isSellerLead"
        
        let secondPart = firstPart
            <*> j <|? "callCount"
            <*> j <|? "lastCallDate"
            <*> j <|? "emailCount"
            <*> j <|? "lastEmail"
            <*> j <|? "textCount"
        
        let thirdPart = firstPart
            <*> j <|? "lastTextDate"
            <*> j <|? "registerDate"
            <*> j <|? "bestPhone"
            <*> j <|? "autoEAlertEnabled"
            <*> j <|? "searchTotal"
            
        let fourthPart = thirdPart
            <*> j <|? "city"
            <*> j <|? "state"
            <*> j <|? "zipCode"
            <*> j <|? "showStreet"
            <*> j <|? "description"
            
        return fourthPart
            <*> j <|? "roleId"
            <*> j <|? "tenantId"
            <*> j <|? "photoLink"
    }
    
}

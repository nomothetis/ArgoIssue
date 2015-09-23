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
    public let emails:[ServerContactEmailFull]
    public let phones:[ServerContactPhoneFull]
    public let contactUsers:[ServerContactUser]
    public let webDetail:ServerContactWebDetail?
    
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
        (emails:[ServerContactEmailFull])
        (phones:[ServerContactPhoneFull])
        (contactUsers:[ServerContactUser])
        (webDetail:ServerContactWebDetail?)
        -> ServerContactFull {
            return ServerContactFull(contactId: contactId, firstName: firstName, lastName: lastName, isBuyerLead: isBuyerLead, isSellerLead: isSellerLead, callCount: callCount, lastCallDate: lastCallDate, emailCount: emailCount, lastEmail: lastEmail, textCount: textCount, lastDateText: lastDateText, registerDate: registerDate, bestPhone: bestPhone, autoEAlertEnabled: autoEAlertEnabled, searchTotal: searchTotal, city: city, state: state, zipCode: zipCode, showStreet: showStreet, description: description, roleId: roleId, tenantId: tenantId, photoLink: photoLink, emails: emails, phones: phones, contactUsers: contactUsers, webDetail: webDetail)
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
            <*> j <|| "emails"
            <*> j <|| "phones"
            <*> j <|| "contactUsers"
            <*> j <|? "webDetail"
    }
    
}

public struct ServerContactWebDetail:Decodable {
    public let originalSource:String
    public let originalCampaign:String?
    public let originalUrl:String?
    public let originalUrlReferrer:String?
    public let originalKeyword:String?
    public let firstVisitDate:NSDate?
    public let previousVisitDate:NSDate?
    public let lastVisitDate:NSDate?
    public let formVersion:String?
    public let avgListingPrice:Int64?
    public let favoriteCount:Int64?
    public let listingViewCount:Int64?
    public let searchCount:Int64?
    public let visitTotal:Int64?
    public let medianVisitTimeInSeconds:Int64?
    public let leadPriorityQualityScore:Int64?
    public let leadPriorityUrgencyScore:Int64?
    public let dateLPScoresUpdated:NSDate?
    public let oppWallPauseDate:NSDate?
    
    static func create
        (originalSource:String)
        (originalCampaign:String?)
        (originalUrl:String?)
        (originalUrlReferrer:String?)
        (originalKeyword:String?)
        (firstVisitDate:NSDate?)
        (previousVisitDate:NSDate?)
        (lastVisitDate:NSDate?)
        (formVersion:String?)
        (avgListingPrice:Int64?)
        (favoriteCount:Int64?)
        (listingViewCount:Int64?)
        (searchCount:Int64?)
        (visitTotal:Int64?)
        (medianVisitTimeInSeconds:Int64?)
        (leadPriorityQualityScore:Int64?)
        (leadPriorityUrgencyScore:Int64?)
        (dateLPScoresUpdated:NSDate?)
        (oppWallPauseDate:NSDate?)
        -> ServerContactWebDetail {
        return ServerContactWebDetail(originalSource: originalSource,
                originalCampaign: originalCampaign,
                originalUrl: originalUrl,
                originalUrlReferrer: originalUrlReferrer,
                originalKeyword: originalKeyword,
                firstVisitDate: firstVisitDate,
                previousVisitDate: previousVisitDate,
                lastVisitDate: lastVisitDate,
                formVersion: formVersion,
                avgListingPrice: avgListingPrice,
                favoriteCount: favoriteCount,
                listingViewCount: listingViewCount,
                searchCount: searchCount,
                visitTotal: visitTotal,
                medianVisitTimeInSeconds: medianVisitTimeInSeconds,
                leadPriorityQualityScore: leadPriorityQualityScore,
                leadPriorityUrgencyScore: leadPriorityUrgencyScore,
                dateLPScoresUpdated: dateLPScoresUpdated,
                oppWallPauseDate: oppWallPauseDate)
    }
    
    //This looks bizarre but the swift compiler can't handle the type checking
    //complexity of this statement as one giant curried chain.
    //Breaking it into chunks not only fixes the issue,
    //but improves the compile time significantly
    public static func decode(j: JSON) -> Decoded<ServerContactWebDetail> {
        let firstPart = ServerContactWebDetail.create
            <^> j <| "originalSource"
            <*> j <|? "originalCampaign"
            <*> j <|? "originalUrl"
            <*> j <|? "originalUrlReferrer"
            <*> j <|? "originalKeyword"
            <*> j <|? "firstVisitDate"
        
        let secondPart = firstPart
            <*> j <|? "previousVisitDate"
            <*> j <|? "lastVisitDate"
            <*> j <|? "formVersion"
            <*> j <|? "avgListingPrice"
            <*> j <|? "favoriteCount"
            <*> j <|? "listingViewCount"
            <*> j <|? "searchCount"
            <*> j <|? "visitTotal"
        
        return secondPart
            <*> j <|? "medianVisitTimeInSeconds"
            <*> j <|? "leadPriorityQualityScore"
            <*> j <|? "leadPriorityUrgencyScore"
            <*> j <|? "dateLPScoresUpdated"
            <*> j <|? "oppWallPauseDate"
    }
}

public struct ServerContactEmailFull:Decodable {
    public let contactEmailId:Int64
    public let emailAddress:String
    public let isLogin:Bool
    public let softBounceCount:Int64
    public let hardBounceCount:Int64
    public let feedbackLoopHits:Int64?
    public let isPrimary:Bool
    public let description:String?
    public let contactEmailStatusId:EmailStatus
    public let hasBeenReset:Bool
    
    static func create(contactEmailId:Int64)
        (emailAddress:String)
        (isLogin:Bool)
        (softBounceCount:Int64)
        (hardBounceCount:Int64)
        (feedbackLoopHits:Int64?)
        (isPrimary:Bool)
        (description:String?)
        (contactEmailStatusId:EmailStatus)
        (hasBeenReset:Bool)
        -> ServerContactEmailFull {
            return ServerContactEmailFull(contactEmailId: contactEmailId, emailAddress: emailAddress, isLogin: isLogin, softBounceCount: softBounceCount, hardBounceCount: hardBounceCount, feedbackLoopHits: feedbackLoopHits, isPrimary: isPrimary, description: description, contactEmailStatusId: contactEmailStatusId, hasBeenReset: hasBeenReset)
    }
    
    public static func decode(j: JSON) -> Decoded<ServerContactEmailFull> {
        return ServerContactEmailFull.create
        <^> j <| "contactEmailId"
        <*> j <| "emailAddress"
        <*> j <| "isLogin"
        <*> j <| "softBounceCount"
        <*> j <| "hardBounceCount"
        <*> j <|? "feedbackLoopHits"
        <*> j <| "isPrimary"
        <*> j <|? "description"
        <*> j <| "contactEmailStatusId"
        <*> j <| "hasBeenReset"
    }
}

public struct ServerContactPhoneFull:Decodable {
    public let contactPhoneId:Int64
    public let label:String?
    public let phone:String
    public let phoneStatusId:PhoneStatus
    
    static func create(contactPhoneId:Int64)
        (label:String?)
        (phone:String)
        (phoneStatusId:PhoneStatus)
        -> ServerContactPhoneFull {
            return ServerContactPhoneFull(contactPhoneId: contactPhoneId, label: label, phone: phone, phoneStatusId: phoneStatusId)
    }
    
    public static func decode(j: JSON) -> Decoded<ServerContactPhoneFull> {
        return ServerContactPhoneFull.create
        <^> j <| "contactPhoneId"
        <*> j <|? "label"
        <*> j <| "phone"
        <*> j <| "phoneStatusId"
    }
}

public struct ServerContactUser:Decodable {
    public let contactUserId:Int64
    public let contactId:Int64
    public let userId:Int64
    public let categoryId:Int16
    public let categoryDate:NSDate?
    public let assignedDate:NSDate?
    public let communicationStatusId:Int16?
    public let contactUserTypeId:Int16
    
    static func create(contactUserId:Int64)
        (contactId:Int64)
        (userId:Int64)
        (categoryId:Int16)
        (categoryDate:NSDate?)
        (assignedDate:NSDate?)
        (communicationStatusId:Int16?)
        (contactUserTypeId:Int16)
        -> ServerContactUser {
            return ServerContactUser(contactUserId: contactUserId, contactId: contactId, userId: userId, categoryId: categoryId, categoryDate: categoryDate, assignedDate: assignedDate, communicationStatusId: communicationStatusId, contactUserTypeId: contactUserTypeId)
    }
    
    public static func decode(j: JSON) -> Decoded<ServerContactUser> {
        return ServerContactUser.create
        <^> j <| "contactUserId"
        <*> j <| "contactId"
        <*> j <| "userId"
        <*> j <| "categoryId"
        <*> j <|? "categoryDate"
        <*> j <|? "assignedDate"
        <*> j <|? "communicationStatusId"
        <*> j <| "contactUserTypeId"
    }
}

//
//  VConstants.swift
//  velivery
//
//  Created by Matheus Frozzi Alberton on 17/06/16.
//  Copyright © 2016 720. All rights reserved.
//

import UIKit

let URLApi = "http://www.velivery.com.br/api_velivery_v2/v2/"

enum FlockrSegues: String {
    case BaseToLogin = "base_to_login"
    case ExploreToLogin = "explore_to_login"
    case ListToDetail = "list_to_detail"
    case ListToInbox = "list_to_inbox"
    case LoginToList = "login_to_list"
    case InboxToChat = "inbox_to_chat"
    case ChatToProposal = "chat_to_proposal"
    case DetailToMap = "detail_to_map"
    case DetailToInbox = "detail_to_inbox"
    case DetailToLogin = "detail_to_login"
    case DetailToRate = "detail_to_rate"
    case DetailToRatings = "detail_to_ratings"
    case LoginToBase = "login_to_base"
    case ChatToReviewOwner = "chat_to_review_owner"
    case ChatToReviewHost = "chat_to_review_host"
    case BaseToProfile = "base_to_profile"
    case ProfileToBase = "profile_to_base"
    case AddInfoToAddPhoto = "add_info_to_add_photo"
    case AddPhotoToAddLocation = "add_photo_to_add_location"
    case AddInfoToThings = "show_things"
    case ProfileToAddPlace = "profile_to_add_place"
    case AdditionToProfile = "addition_to_profile"
    case ChatToDetails = "chat_to_details"
    case ReviewToMap = "review_to_map"
    case ProfileToHistory = "profile_to_history"
    case TransactionToInvoice = "transaction_to_invoice"
    case FavoriteToDetail = "favorite_to_detail"
    case ShowWebView = "profile_to_wview"
}

enum FlockrCells: String {
    case feedPhotoCell = "feedPhotoCell"
    case feedCaptionCell = "feedCaptionCell"
    case feedStatusCell = "feedStatusCell"
    case headerFeedCell = "headerFeedCell"
}

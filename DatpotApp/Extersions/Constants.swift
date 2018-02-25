//
//  Constants.swift
//  eTheraphyPro
//
//  Created by Batth on 09/09/17.
//  Copyright © 2017 Batth. All rights reserved.
//

import Foundation

struct Constants {
    
    static let baseUrl = "https://etherapypro.com/app/"
    
    static let signIn = "signin.php"
     static let Stripe = "create_stripe_account.php"
    static let signUpQuestions = "signup_questions.php"
    static let signUP = "signup.php"
    static let signUpLastQuestions = "signup_question_after_signup.php"
    
    static let stripePayment = "create_stripe_account.php"
    static let stripePaymentCancel = "cancel_stripe_subscription.php"
    static let stripePaymentChange = "change_stripe_plan.php"

    static let paymentDetails = "account-detail.php"
    static let payment = "payment_detail.php"
    static let cancelPayment = "cancel-membership.php"
    static let changePlan = "change-membership.php"
    
    static let changePassword = "change-password.php"
    
    static let messages = "messages.php"
    static let messageDetails = "message-detail.php"
    static let sendMessage = "send-thread-reply.php"
    static let composeMessage = "sendmessage.php"
    static let readUnreadMessage = "read-unread.php"
    
    static let deleteThread = "delete-message-thread.php"
    
    static let sendOtp = "sendtoken.php"
    static let forgotPassword = "forget-password.php"
    
    static let logout = "logout.php"
    
    static let update_fcm_token = "fcm_update.php"
}

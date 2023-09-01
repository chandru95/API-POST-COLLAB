//
//  ViewController.swift
//  razorpay
//
//  Created by Admin on 30/08/23.
//

import UIKit
import Razorpay


class ViewController: UIViewController {

    var razorpay: RazorpayCheckout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = RazorpayCheckout.initWithKey("rzp_test_NKRXHDvibEmlYj" , andDelegate: self)
        
        
    }
    
    @IBAction func PAY(_ sender: Any) {
        self.showPaymentForm()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        }
    
    
    internal func showPaymentForm(){
        let options: [String:Any] = [
                    "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": "purchase description",
                    "order_id": "order_DBJOWzybf0sJbb",
                    "image": UIImage(named: "watercan"),
                    "name": "Chotu Delivery",
                    "prefill": [
                        "contact": "9797979797",
                        "email": "foo@bar.com"
                    ],
                    "theme": [
                        "color": "#800080"
                    ],
                    "method":[
                    "wallet": "0",
                    "netbanking": "0",
                    "paylater": "0",
                    ]
                ]
        razorpay.open(options)
    }

}
extension ViewController : RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        print("error: ", code, str)
        //self.presentAlert(withTitle: "Alert", message: str)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("success: ", payment_id)
        //self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
    }
    
    
}
extension ViewController : RazorpayPaymentCompletionProtocolWithData {
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        print("error: ", code)
    }
    
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        print("success: ", payment_id)
    }
    



}


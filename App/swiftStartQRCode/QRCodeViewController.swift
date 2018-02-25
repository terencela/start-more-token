import UIKit
import Foundation
//initial
var balanceValue = 0

class QRCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //calling the function that will fetch the json
       // getJsonFromUrl();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Print the key values for the spen and get
    @IBAction func Get(_ sender: Any) {
        print("Get touched")
    }
    
    @IBAction func Send(_ sender: Any) {
        print("Spend touched")
    }
    
    //read the data from the "blockchain"
    
    //the json file url
    var URL_OUR = "http://130.82.239.43:8888/balance";
    
    //this function is fetching the json from URL
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: URL_OUR)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "balance")!)
                balanceValue = jsonObj!.value(forKey: "balance")! as! Int
                print("all the code")
                print(jsonObj!)
            }
        }).resume()
    }
    
    //update balance

    @IBOutlet weak var labelTest: UITextField!


    
    @IBAction func updateBalance(_ sender: Any) {
        getJsonFromUrl()
        print("pressed button")
        print("current QR: " + currentQRMessage)
        
        if currentQRMessage != "empty" {
            var fullString: String = String(currentQRMessage)
            let fullStringArr = fullString.components(separatedBy: ",")
            
            var perk = fullStringArr[0]
            var amount = fullStringArr[1]
        
            print("perk: "+perk+"amount: "+amount)
            
            //sends a request
           // let url2 = NSURL(string: URL_OURTOWRITE)

           // URLSession.shared.dataTask(with: (url2 as URL?)!, completionHandler: {(data, response, error) -> Void in}).resume()
            labelTest.text = String(Int(amount)!*3)
            
        } else {
            labelTest.text = String(balanceValue)
        }
    }

}

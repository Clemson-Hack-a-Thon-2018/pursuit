//
//  Data.swift
//  AirTime
//
//  Created by Audra Lynn on 11/1/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation

let dict : [String:Any] = ["question": "",
                           "answer1": "",
                           "answer2": "",
                           "answer3": "",
                           "answer4": "",
                           "question1": [
                                "questionText": "Jimmy Byrnes served as all of these positions except:",
                                "answer1": "Associate Supreme Justice",
                                "answer2": "Governor of SC",
                                "answer3": "Clemson Student Body President",
                                "answer4": "UN Ambassador",
                                "right": "Clemson Student Body President"                            ],
                           "question2": [
                                "questionText": "One of Thomas Green Clemson’s favorite worldly possessions was a  Windsor chair formerly owned by which US president?",
                                "answer1": "George Washington",
                                "answer2": "Abe Lincoln",
                                "answer3": "Thomas Jefferson",
                                "answer4": "Benjamin Franklin",
                                "right": "George Washington",
                            ],
                           "question3": [
                                "questionText": "In 1977 this ACC team refused to play the Clemson Football team. In response, Clemson students stamped tiger paws onto 2 dollar bills as a way to encourage continuing the competition. Which team refused to play Clemson?",
                                "answer1": "Virginia",
                                "answer2": "North Carolina",
                                "answer3": "Georgia Tech",
                                "answer4": "NC State",
                                "right": "Georgia Tech",
                            ],
                           
]


/*

PPManager.sharedInstance.PPdatasvc.writeBucket( bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key:"Question1", value:dict["question1"] ) { succeeded, response, responseObject in
    if(!succeeded) {
        print("write JSON error:")
    } else {
        PPManager.sharedInstance.PPdatasvc.readBucket(bucketName: PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key: "Question1", completion: { (succeeded, response, responseObject) in
            if(succeeded) {
                //                            print("response read:" \(responseObject) as Any )
            }
        })
        
    }
}

}))

self.present(alert, animated: true, completion: nil)
}


PPManager.sharedInstance.PPdatasvc.writeBucket( bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key:"Question2", value:dict["question2"] ) { succeeded, response, responseObject in
    if(!succeeded) {
        print("write JSON error:")
    } else {
        PPManager.sharedInstance.PPdatasvc.readBucket(bucketName: PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key: "Question2", completion: { (succeeded, response, responseObject) in
            if(succeeded) {
                //                            print("response read:" \(responseObject) as Any )
            }
        })
        
    }
}

}))

self.present(alert, animated: true, completion: nil)
}



PPManager.sharedInstance.PPdatasvc.writeBucket( bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key:"Question3", value:dict["question3"] ) { succeeded, response, responseObject in
    if(!succeeded) {
        print("write JSON error:")
    } else {
        PPManager.sharedInstance.PPdatasvc.readBucket(bucketName: PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key: "Question3", completion: { (succeeded, response, responseObject) in
            if(succeeded) {
                //                            print("response read:" \(responseObject) as Any )
            }
        })
        
    }
}

}))

self.present(alert, animated: true, completion: nil)
}

*/

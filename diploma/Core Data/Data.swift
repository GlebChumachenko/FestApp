

import Foundation
import UIKit


struct DataStruct{
    
    var festImage: UIImage {
        get {
            switch UserDefaults.standard.string(forKey: "title") {
            case "Octoberfest": return UIImage(named: "octoberfest")!
            case "Comic-Con": return UIImage(named: "comiccon")!
            case "Coachella": return UIImage(named: "coachella")!
            case "Rio de Janeiro\nFestival": return UIImage(named: "rio")!
            case "Halloween \nin Scream Park": return UIImage(named: "halloween")!
            default: return UIImage(named: "halloween")!
            }
        }
    }
}

final class Singleton {
    static let shared = Singleton()
    var festImage: UIImage?
}










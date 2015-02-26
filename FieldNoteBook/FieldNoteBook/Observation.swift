import Foundation

class Observation : NSObject, NSCoding {
  
  var dateCreated: NSDate = NSDate()
  var data: Dictionary<String, String> = Dictionary<String, String>()
  var notes: String = ""
  
  override init() {
    dateCreated = NSDate()
  }

  func addData(key: String, value: String) {
    data[key] = value
  }
  
  required init(coder decoder: NSCoder) {
    self.dateCreated  = decoder.decodeObjectForKey("dateCreated") as NSDate
    self.data         = decoder.decodeObjectForKey("data") as Dictionary
    self.notes        = decoder.decodeObjectForKey("notes") as String
  }
  
  func encodeWithCoder(coder: NSCoder) {
    coder.encodeObject(self.dateCreated,  forKey: "dateCreated")
    coder.encodeObject(self.data,         forKey: "data")
    coder.encodeObject(self.notes,        forKey: "notes")
  }
  
}

import Foundation

let experimentsKeyConstant = "experiments"

class Experiment : NSObject, NSCoding {
  
  var uuid: String
  var name: String
  var hypothesis: String
  var dateCreated: NSDate = NSDate()
  var dateFinished: NSDate?
  var fields: Array<Field> = Array<Field>()
  var observations: Array<Observation> = Array<Observation>()
  var conclusion: String?
 
  init(name: String, hypothesis: String) {
    self.name = name
    self.hypothesis = hypothesis
    self.uuid = NSUUID().UUIDString
  }
  
  required init(coder decoder: NSCoder) {
    self.name         = decoder.decodeObjectForKey("name") as String
    self.hypothesis   = decoder.decodeObjectForKey("hypothesis") as String
    self.uuid         = decoder.decodeObjectForKey("uuid") as String
    self.dateCreated  = decoder.decodeObjectForKey("dateCreated") as NSDate

    // TODO add optional fields too....
  }
  
  func encodeWithCoder(coder: NSCoder) {
    coder.encodeObject(self.name,         forKey: "name")
    coder.encodeObject(self.hypothesis,   forKey: "hypothesis")
    coder.encodeObject(self.uuid,         forKey: "uuid")
    coder.encodeObject(self.dateCreated,  forKey: "dateCreated")

    // TODO add optional fields too....
  }
  
  func save() {
    let defaults = NSUserDefaults.standardUserDefaults()
    var experimentDictionary = defaults.dictionaryForKey(experimentsKeyConstant) as Dictionary<String, AnyObject>
    experimentDictionary.updateValue(NSKeyedArchiver.archivedDataWithRootObject(self), forKey: self.uuid)
    defaults.setObject(experimentDictionary, forKey: experimentsKeyConstant)
  }
  
  // class functions
  class func all() -> Array<Experiment> {
    let defaults = NSUserDefaults.standardUserDefaults()
    let experimentDictionary = defaults.dictionaryForKey(experimentsKeyConstant) as Dictionary<String, AnyObject>
    var experiments = Array<Experiment>()
    for (uid, obj) in experimentDictionary {
      let unarc = NSKeyedUnarchiver(forReadingWithData: obj as NSData)
      experiments.append(unarc.decodeObjectForKey("root") as Experiment)
    }
    return experiments
  }
  
}

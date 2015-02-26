import Foundation

class Experiment {
  
  var name: String = ""
  var hypothesis: String = ""
  var dateCreated: NSDate = NSDate()
  var fields: Array<Field> = Array<Field>()
  var observations: Array<Observation> = Array<Observation>()
  
}

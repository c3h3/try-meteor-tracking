@uuidCookieName = "meteor-track-uuid"

Template.trackingInfo.helpers
  uuid: ->
    Session.get uuidCookieName
  
Meteor.startup ->
  uuid = Cookies.get uuidCookieName
  if not uuid
    chance = new Chance
    uuid = chance.guid()
    Cookies.set uuidCookieName, uuid
    console.log "create new uuid"  

  console.log "uuid = "
  console.log uuid

  Session.set uuidCookieName, uuid





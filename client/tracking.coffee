@uuidCookieName = "meteor-track-uuid"



Template.trackingInfo.helpers
  uuid: ->
    Session.get uuidCookieName
  connected: ->
    Session.get "connected"
  connectId: ->
    UsersTracking.findOne().connectId

Deps.autorun ->
  connected = Meteor.status().connected
  Session.set "connected", connected
  uuid = Session.get uuidCookieName
  if connected
    Meteor.call "logConnected", uuid
    

    


Meteor.startup ->
  Meteor.subscribe "usersTracking"

  

  uuid = Cookies.get uuidCookieName
  if not uuid
    chance = new Chance
    uuid = chance.guid()
    Cookies.set uuidCookieName, uuid
    console.log "create new uuid"  
  
  # console.log "uuid = "
  # console.log uuid

  Session.set uuidCookieName, uuid

  # console.log "Meteor.connection = "
  # console.log Meteor.connection
  # console.log "Meteor.connection._lastSessionId = "
  # console.log Meteor.connection._lastSessionId

  # Meteor.call "getConnectionId", (err, data) ->
  #   if not err
  #     # console.log "data = "
  #     # console.log data
  #     Session.set "connectId", data
  #   # else
  #   #   console.log "err = "
  #   #   console.log err
    

  




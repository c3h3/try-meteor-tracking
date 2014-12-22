# Opening and closing of DDP connections
Meteor.onConnection (connection) ->
  console.log "[onConnection] connection = "
  console.log connection
  
  connection.onClose ->
    console.log "[onClose] connection = "
    console.log connection
    query = 
      connectId: connection.id
      connected: true
    updateData =
      connected: false
      closeAt: new Date


    UsersTracking.update query, {$set:updateData}



  # addSession(connection)

  # connection.onClose ->
  #   removeSession(connection, new Date())

# Authentication of a DDP connection
# Accounts.onLogin (info) ->
#   # loginSession(info.connection, new Date(), info.user._id)
#   console.log "info = "
#   console.log info
#   console.log "info.connection = "
#   console.log info.connection
#   console.log "info.user = "
#   console.log info.user

Meteor.methods
  getConnectionId: ->
    console.log "@.connection = "
    console.log @.connection
    @.connection.id

Meteor.methods
  logConnected: (uuid) ->
    query = 
      uuid: uuid
      connected: true
    updateData =
      connected: false
      closeAt: new Date

    UsersTracking.update query, {$set:updateData}

    query.connectId = @.connection.id
    if UsersTracking.find(query).count() is 0
      query.logAt = new Date
      UsersTracking.insert query

    else
      UsersTracking.findOne(query)._id

Meteor.publish "usersTracking", ->
  UsersTracking.find connectId:@connection.id 
# Opening and closing of DDP connections
Meteor.onConnection (connection) ->
  console.log "connection = "
  console.log connection
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
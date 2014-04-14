Template.dashboard.helpers(
  tasks: ->
    Tasks.find()
)

Template.dashboard_task.helpers(
  creator: ->
    user = Meteor.users.findOne
      _id: @creatorId
    user.emails[0].address.split('@')[0]

  created: ->
    moment(@createdAt).fromNow()
)

@Tasks = new Meteor.Collection 'tasks',
  schema:
    title:
      type: String
      min: 5
      max: 144

    description:
      type: String
      max: 1000

    creatorId:
      type: String
      autoValue: ->
        @userId
      denyUpdate: true

    createdAt:
      type: Date
      autoValue: ->
        if @isInsert
          new Date()
      denyUpdate: true

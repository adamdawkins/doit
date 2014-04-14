@Tasks = new Meteor.Collection 'tasks',
  schema:
    title:
      type: String
      min: 5
      max: 144

    description:
      type: String
      max: 1000
      optional: true

    creatorId:
      type: String

    createdAt:
      type: Date
    
    status:
      type: String
      allowedValues: ['unstarted', 'in progress', 'completed']
      optional: true

 
Meteor.methods(
  createTask: (task_params) ->
    user = Meteor.user()

    unless user
      throw new Meteor.Error 401, 'you need be logged in'
    
    task = _.extend(task_params,
      creatorId: user._id
      createdAt: new Date()
      status: 'unstarted'
    )
  
    Tasks.insert(task)

  startTask: (task_id) ->
    Tasks.update(
      _id: task_id
    ,
      $set:
        status: 'in progress'
    )
)

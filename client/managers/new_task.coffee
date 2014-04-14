Template.new_task.events(
  'submit form': (e) ->
    e.preventDefault()

    $form = $('#new_task_form')

    title = $form.find('input[name="title"]').val()
    description = $form.find('textarea[name="description"]').val()
    
    Meteor.call('createTask',
      title: title
      description: description
    )
)

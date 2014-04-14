# Config
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

# Mapping
Router.map ->
  @route 'home',
    path: '/'
  @route 'dashboard',
    onBeforeAction: (pause) ->
      # AccountsEntry.signInRequired(@)
        


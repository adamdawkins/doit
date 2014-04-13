# Config
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

# Filters
requireLogin = (pause) ->
  if (!Meteor.user())
    if Meteor.loggingIn()
      @render(@loadingTemplate)
    else
      @render 'login'
    pause()

Router.onBeforeAction requireLogin

# Mapping
Router.map ->
  @route 'dashboard',
    path: '/'


# Config
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

requireLogin = (pause) ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'sign-up'
    pause()

Router.onBeforeAction requireLogin,
  except: 'home'

# Mapping
Router.map ->
  @route 'home',
    path: '/'
  @route 'dashboard'
        


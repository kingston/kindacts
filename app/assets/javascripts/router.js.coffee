KindActs.Router.map ->
  @route 'landing'

KindActs.IndexRoute = Ember.Route.extend
  redirect: ->
    if appSettings.isLoggedIn
      #TODO:
      @transitionTo 'landing'
    else
      @transitionTo 'landing'

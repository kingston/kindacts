KindActs.Router.map ->
  @route 'landing'
  @route 'welcome'
  @route 'choose_mission', { path: "/choose" }

KindActs.IndexRoute = Ember.Route.extend
  redirect: ->
    if appSettings.isLoggedIn
      #TODO:
      @transitionTo 'landing'
    else
      @transitionTo 'landing'

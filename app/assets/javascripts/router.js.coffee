KindActs.Router.map ->
  @route 'landing'
  @route 'welcome'
  @route 'choose_mission', { path: "/choose" }
  @route 'in_mission', { path: "/mission" }
  @route 'post_act', { path: "/post" }
  @route 'act_map', { path: "/map" }

KindActs.IndexRoute = Ember.Route.extend
  redirect: ->
    if appSettings.isLoggedIn
      #TODO:
      @transitionTo 'landing'
    else
      @transitionTo 'landing'



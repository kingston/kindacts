KindActs.Router.map ->
  @route 'landing'
  @route 'welcome'
  @route 'choose_mission', { path: "/choose" }
  @route 'in_mission', { path: "/mission" }
  @route 'post_act', { path: "/post" }
  @route 'act_map', { path: "/map" }
  @route 'act_list', { path: "/list" }
  @route 'act_view', { path: "/view" }

KindActs.IndexRoute = Ember.Route.extend
  redirect: ->
    if appSettings.isLoggedIn
      @transitionTo 'act_map'
    else
      @transitionTo 'landing'
      @set('applicationController.isOnboarding', true)

KindActs.ActMapRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', [])
    controller.pushObject
      id: 1
      lat: 37.42596
      long: -122.171949
      title: "I gave a free hug..."
    controller.pushObject
      id: 2
      lat: 37.42396
      long: -122.172949
      title: "I gave a free hug..."
    controller.pushObject
      id: 3
      lat: 37.42196
      long: -122.171949
      title: "I gave a free hug..."


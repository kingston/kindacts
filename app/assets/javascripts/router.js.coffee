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

KindActs.ChooseMissionRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', KindActs.Mission.find())

KindActs.PostActRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('actText', controller.get('controllers.application.selectedMission.act_autofill') || "I...")


KindActs.ActMapRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', KindActs.Act.find())

KindActs.ActListRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', KindActs.Act.find())


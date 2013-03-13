KindActs.PostActController = Ember.Controller.extend
  needs: ['application']
  missionBinding: "controllers.application.selectedMission"
  actText: ""

  init: ->
    @_super()

  imageSrc: (->
    "assets/missions/" + (@get('mission.icon') || "flower.png")
  ).property("mission.icon")

  contentStyle: (->
    "background-color: " + (@get('mission.color') || "#f22f4a")
  ).property("mission.color")

  showList: ->
    @transitionTo 'act_list'

  showMap: ->
    @transitionTo 'act_map'

  postAct: ->
    @set 'controllers.application.selectedMission', null
    @set 'controllers.application.isOnboarding', false
    @transitionTo "act_map"

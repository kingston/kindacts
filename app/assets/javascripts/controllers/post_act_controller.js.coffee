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
    lat = 3742296
    lng = -12217294
    lat += Math.random() * 500 - 250
    lng += Math.random() * 500 - 250
    act = KindActs.Act.createRecord
      description: @get('actText')
      lat: lat
      lng: lng
      mission: @get('mission.id') || null
    act.get('store').commit()
    # poor-man's timeout
    setTimeout( =>
      @set 'controllers.application.selectedMission', null
      @set 'controllers.application.primaryActId', act.get('id')
      @set 'controllers.application.isOnboarding', false
      @transitionTo "act_map"
    , 1000)

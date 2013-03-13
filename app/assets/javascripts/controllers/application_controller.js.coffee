KindActs.ApplicationController = Ember.Controller.extend
  isFromMap: false
  isOnboarding: false
  selectedMission: null

  init: ->
    @_super()
    # preload all the missions/acts
    KindActs.Act.find()
    KindActs.Mission.find()

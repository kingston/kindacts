KindActs.ChooseMissionController = Ember.Controller.extend
  init: ->
  missionSelected: false

  selectMission: ->
    @set 'missionSelected', true

  clearMission: ->
    @set 'missionSelected', false

  acceptMission: ->
    @transitionTo "in_mission"

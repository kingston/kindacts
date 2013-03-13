KindActs.ChooseMissionController = Ember.ArrayController.extend
  sortProperties: ['order', 'description']
  needs: ['application']

  init: ->
    @_super()

  missionSelected: false

  selectMission: (mission) ->
    @set 'controllers.application.selectedMission', mission
    @set 'missionSelected', mission

  clearMission: ->
    @set 'missionSelected', null

  acceptMission: ->
    @transitionTo "in_mission"

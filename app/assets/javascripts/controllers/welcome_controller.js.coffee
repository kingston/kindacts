KindActs.WelcomeController = Ember.Controller.extend
  agentName: "snazzy_13"
  accept: ->
    @transitionTo 'choose_mission'

KindActs.WelcomeController = Ember.Controller.extend
  accept: ->
    @transitionTo 'choose_mission'

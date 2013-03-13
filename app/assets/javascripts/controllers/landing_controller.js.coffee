KindActs.LandingController = Ember.Controller.extend
  needs: ['application']
  init: ->
    @set 'controllers.application.isOnboarding', true
    @_super()

  goToWelcome: ->
    @transitionTo 'welcome'

KindActs.PostActController = Ember.Controller.extend
  needs: ['application']
  init: ->
    @_super()

  showList: ->
    @transitionTo 'act_list'

  showMap: ->
    @transitionTo 'act_map'

  postAct: ->
    @set 'controllers.application.isOnboarding', false
    @transitionTo "act_map"

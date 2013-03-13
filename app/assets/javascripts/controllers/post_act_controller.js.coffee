KindActs.PostActController = Ember.Controller.extend
  init: ->
    @_super()

  postAct: ->
    @transitionTo "act_map"

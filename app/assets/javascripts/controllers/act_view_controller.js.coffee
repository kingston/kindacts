KindActs.ActViewController = Ember.ArrayController.extend
  init: ->
    @_super()

  showList: ->
    @transitionTo 'act_list'

KindActs.ActMapController = Ember.ArrayController.extend
  needs: ['application']
  primaryActId: 1

  init: ->
    @_super()

  showList: ->
    @transitionTo 'act_list'

  addAct: ->
    @set('controllers.application.isFromMap', true)
    @transitionTo 'post_act'

KindActs.ActListController = Ember.ArrayController.extend
  needs: ['application']

  init: ->
    @_super()

  showMap: ->
    @transitionTo 'act_map'

  addAct: ->
    @set('controllers.application.isFromMap', false)
    @transitionTo 'post_act'

  openCard: ->
    #@transitionTo 'act_view'

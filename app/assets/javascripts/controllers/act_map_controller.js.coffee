KindActs.ActMapController = Ember.ArrayController.extend
  needs: ['application']
  primaryActIdBinding: "controllers.application.primaryActId"

  init: ->
    @_super()

  showList: ->
    @set 'controllers.application.primaryActId', null
    @transitionTo 'act_list'

  addAct: ->
    @set('controllers.application.isFromMap', true)
    @transitionTo 'post_act'

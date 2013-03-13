KindActs.ActCardView = Ember.View.extend
  templateName: 'act_card'

  openCard: ->
    @get('controller').openCard()

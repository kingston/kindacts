KindActs.ActMapController = Ember.ArrayController.extend
  init: ->
    @set 'content', []

    @pushObject
      id: 1
      lat: 37.42596
      long: -122.171949
      title: "I gave a free hug..."

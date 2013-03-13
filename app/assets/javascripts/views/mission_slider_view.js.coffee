KindActs.MissionSliderView = Ember.View.extend
  swiper: null
  templateName: 'mission_slider'

  didInsertElement: ->
    elem = $(@get('element')).find(".mission-slider").get(0)

    @set 'swiper', new Swipe(elem,
      disableScroll: true
      auto: 2000
    )

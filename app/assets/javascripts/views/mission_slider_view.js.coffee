KindActs.MissionSliderView = Ember.View.extend
  swiper: null
  templateName: 'mission_slider'

  didInsertElement: ->
    $elem = $(@get('element')).find(".mission-slider")
    elem = $elem.get(0)

    @set 'swiper', new Swipe(elem,
      disableScroll: true
      swiping: ->
        Ember.View.views[$elem.find(".mission-content.selected").parent().parent().attr('id')].toggleExpand()
        
    )

  willDestroyElement: ->
    @get('swiper').kill()

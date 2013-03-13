KindActs.MissionSliderView = Ember.View.extend
  swiper: null
  templateName: 'mission_slider'

  didInsertElement: ->
    $elem = $(@get('element')).find(".mission-slider")
    elem = $elem.get(0)

    @set 'swiper', new Swipe(elem,
      disableScroll: true
      swiping: ->
        view = $elem.find(".mission-content.selected").closest(".mission-slide-view")
        if view.length > 0
          Ember.View.views[view.attr('id')].toggleExpand()
        
    )

  willDestroyElement: ->
    @get('swiper').kill()

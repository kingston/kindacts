KindActs.MissionSliderView = Ember.View.extend
  swiper: null
  templateName: 'mission_slider'

  didInsertElement: ->
    #TODO: MAJOR HACK
    return if @get('controller.content.length') < 4
    return if @get('swiper')
    $elem = $(@get('element')).find(".mission-slider")
    elem = $elem.get(0)

    setTimeout(=>
      @set 'swiper', new Swipe(elem,
        disableScroll: true
        swiping: ->
          view = $elem.find(".mission-content.selected").closest(".mission-slide-view")
          if view.length > 0
            Ember.View.views[view.attr('id')].toggleExpand()
          
      )
    ,0)

  controllerDidChange: (->
    @didInsertElement()
  ).observes("controller.content.@each")

  willDestroyElement: ->
    @get('swiper').kill()

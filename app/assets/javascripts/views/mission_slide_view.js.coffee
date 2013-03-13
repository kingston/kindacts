KindActs.MissionSlideView = Ember.View.extend
  templateName: 'mission_slide'
  isExpanded: false
  content: null
  classNames: ['mission-slide-view']

  toggleExpand: ->
    elem = $(@get('element')).find(".mission-content")
    @toggleProperty 'isExpanded'

    if @get 'isExpanded'
      elem.addClass("selected")
      @get('controller').selectMission()
    else
      elem.removeClass("selected")
      @get('controller').clearMission()


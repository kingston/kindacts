toHHMMSS = (str) ->
  sec_numb = parseInt(str)
  hours = Math.floor(sec_numb / 3600)
  minutes = Math.floor((sec_numb - (hours * 3600)) / 60)
  seconds = sec_numb - (hours * 3600) - (minutes * 60)
  hours = "0" + hours  if hours < 10
  minutes = "0" + minutes  if minutes < 10
  seconds = "0" + seconds  if seconds < 10
  time = minutes + ":" + seconds
  time

KindActs.InMissionController = Ember.Controller.extend
  needs: ["application"]
  timeLeft: null
  intervalId: null
  timeLeftFormatted: (->
    return toHHMMSS(@get('timeLeft'))
  ).property('timeLeft')
  missionBinding: "controllers.application.selectedMission"

  init: ->
    @_super()
    _this = @
    countdown = ->
      return if _this.isDestroyed
      timeLeft = _this.get('timeLeft')
      timeLeft--
      if timeLeft <= 0
        _this.set 'intervalId', null
        timeLeft = 0
      _this.set('timeLeft', timeLeft)
    @set 'timeLeft', 180
    @set 'intervalId', setInterval(countdown, 1000)

  completeMission: ->
    @transitionTo "post_act"

  destroy: ->
    @super()
    if @get 'intervalId'
      clearInterval(@get('intervalId'))

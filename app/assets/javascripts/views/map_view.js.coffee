KindActs.MapView = Ember.View.extend
  templateName: 'map'
  classNames: "map-view"
  map: null
  stopAnimationTimeoutId: null

  actMarkerMap: null
  glowMarkerMap: null

  destroy: ->
    @_super()
    clearTimeout(@get('stopAnimationTimeoutId')) if @get('stopAnimationTimeoutId')

  addAct: (act) ->
    return unless @get('map')
    pos = new google.maps.LatLng(act.lat, act.long)
    primaryActId = @get('controller.primaryActId')
    marker = new google.maps.Marker
      position: pos
      map: @get('map')
      title: act.title
    @get('actMarkerMap')[act.id] = marker
    glow = new KindActs.GlowMarker(
      pos,
      primaryActId == act.id
      @get('map')
    )
    @get('glowMarkerMap')[act.id] = glow

    if primaryActId == act.id
      marker = @get('actMarkerMap')[primaryActId]
      marker.setAnimation(google.maps.Animation.BOUNCE)
      @set 'stopAnimationTimeoutId', setTimeout(=>
        marker.setAnimation(null)
        @set 'stopAnimationTimeoutId', null
      , 1800)

  removeAct: (act) ->
    marker = @get('actMarkerMap')[act.id]
    marker.setMap(null) if marker
    glow = @get('glowMarkerMap')[act.id]
    glow.setMap(null) if glow

  init: ->
    @_super()
    @attachArrayObserver()
    @set 'actMarkerMap', {}
    @set 'glowMarkerMap', {}

  attachArrayObserver: (->
    return unless @get('map')
    return unless @get('controller')
    obj = Ember.Object.create
      arrayWillChange: Ember.K
      arrayDidChange: (array, start, removeCount, addCount) =>
        if addCount == 1
          @addAct(array[start])
        else if removeCount == 1
          @removeAct(array[start])
          
    @get('controller').addArrayObserver(obj)
  ).observes('controller')

  didInsertElement: ->
    elem = @get('element') #$(@get('element')).find(".map-wrapper").get(0)
    mapOptions =
      center: new google.maps.LatLng(37.42596, -122.171949)
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: false
      streetViewControl: false
    @set 'map', new google.maps.Map(elem, mapOptions)
    # Add gray overlay
    new google.maps.Rectangle(
      fillColor: 'black'
      fillOpacity: 0.35
      map: @get('map')
      bounds: new google.maps.LatLngBounds(
        new google.maps.LatLng(-90, -180),
        new google.maps.LatLng(90, 180)
      )
      zIndex: -100
    );
    @get('controller').forEach (item, index) =>
      @addAct(item)



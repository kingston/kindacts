KindActs.MapView = Ember.View.extend
  templateName: 'map'
  classNames: "map-view"
  map: null

  actMarkerMap: null

  addAct: (act) ->
    return unless @get('map')
    pos = new gogle.maps.LatLng(pos.lat, pos.long)
    marker = new google.maps.Marker
      position: pos
      map: @get('map')
      title: act.title
    @get('actMarkerMap')[act.id] = marker

  removeAct: (act) ->
    marker = @get('actMarkerMap')[act.id]
    marker.setMap(null) if marker

  init: ->
    @attachArrayObserver()
    @set 'actMarkerMap', {}

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
    mapOptions =
      center: new google.maps.LatLng(37.42596, -122.171949)
      zoom: 14
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: false
      streetViewControl: false
    @set 'map', new google.maps.Map(@get('element'), mapOptions)
    @get('controller').forEach (item, index) =>
      @addAct(item)

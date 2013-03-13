GlowMarker = (coord, isPrimary, map) ->
  
  # Now initialize all properties.
  @coord_ = coord
  @isPrimary_ = isPrimary
  @map_ = map
  
  # We define a property to hold the image's
  # div. We'll actually create this div
  # upon receipt of the add() method so we'll
  # leave it null for now.
  @div_ = null
  
  # Explicitly call setMap() on this overlay
  @setMap map

GlowMarker:: = new google.maps.OverlayView()
GlowMarker::onAdd = ->
  
  # Note: an overlay's receipt of onAdd() indicates that
  # the map's panes are now available for attaching
  # the overlay to the map via the DOM.
  
  # Create the DIV and set some basic attributes.
  div = $("<div>").addClass("glow-marker")
  
  if @isPrimary_
    div.addClass("bounceIn")
  
  # We add an overlay to a map via one of the map's panes.
  # We'll add this overlay to the overlayImage pane.
  panes = @getPanes()
  $(panes.overlayLayer).append div

  # Set the overlay's div_ property to this DIV
  @div_ = div.get(0)

GlowMarker::draw = ->
  
  # Size and position the overlay. We use a southwest and northeast
  # position of the overlay to peg it to the correct position and size.
  # We need to retrieve the projection from this overlay to do this.
  overlayProjection = @getProjection()

  diff = 0.004

  nw_coord = new google.maps.LatLng(@coord_.lat() - diff, @coord_.lng() - diff)
  se_coord = new google.maps.LatLng(@coord_.lat() + diff, @coord_.lng() + diff)
  
  # Retrieve the southwest and northeast coordinates of this overlay
  # in latlngs and convert them to pixels coordinates.
  # We'll use these coordinates to resize the DIV.
  nw = overlayProjection.fromLatLngToDivPixel(nw_coord)
  se = overlayProjection.fromLatLngToDivPixel(se_coord)
  pt = overlayProjection.fromLatLngToDivPixel(@coord_)
  
  # Resize the image's DIV to fit the indicated dimensions.
  div = @div_
  div.style.left = nw.x + "px"
  div.style.top = se.y + "px"
  div.style.width = (se.x - nw.x) + "px"
  div.style.height = (nw.y - se.y) + "px"

GlowMarker::onRemove = ->
  @div_.parentNode.removeChild @div_
  @div_ = null


KindActs.GlowMarker = GlowMarker

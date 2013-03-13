KindActs.ActCardView = Ember.View.extend
  templateName: 'act_card'

  mission: (->
    return null unless @get('content.mission')
    KindActs.Mission.find(@get('content.mission'))
  ).property('content.mission')

  openCard: ->
    @get('controller').openCard()

  imageSrc: (->
    "assets/missions/" + (@get('mission.icon') || "flower.png")
  ).property("mission.icon")

  contentStyle: (->
    "background-color: " + (@get('mission.color') || "#f22f4a")
  ).property("mission.color")

  location: (->
    idx = Math.floor(Math.random() * 8)
    locations = ["Coupa Cafe", "d.school", "The Quad", "CoHo", "Hoover", "MemChu", "Palo Alto", "Bookstore"]
    return locations[idx]

  ).property()

  time: (->
    return @get('content.id') * 3 + Math.floor(Math.random() * 3 - 2)

  ).property()

KindActs.MissionCardView = Ember.View.extend
  templateName: 'mission_card'

  imageSrc: (->
    "assets/missions/" + @get('content.icon')
  ).property("content.icon")

  contentStyle: (->
    "background-color: " + @get('content.color')
  ).property("content.color")


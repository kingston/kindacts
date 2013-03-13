KindActs.Act = DS.Model.extend({
  description: DS.attr('string'),
  lat: DS.attr('number'),
  lng: DS.attr('number'),
  mission: DS.attr('number'),

  realLat: (function() {
      return this.get('lat') / 100000;
  }).property('lat'),

  realLng: (function() {
      return this.get('lng') / 100000;
  }).property('lng'),
});

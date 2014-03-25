function initializeSourceCity(){
var options = {
  types: ['(cities)'],

};
var input = document.getElementById('from_search_box');
var autocomplete = new google.maps.places.Autocomplete(input, options);

google.maps.event.addListener(autocomplete,'place changed',function(){
	var place = autocomplete.getPlace();
});

}

function initializeDestinationCity(){
var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'us'}
};
var input = document.getElementById('to_search_box');
var autocomplete = new google.maps.places.Autocomplete(input, options);
google.maps.event.addListener(autocomplete,'place changed',function(){});

}

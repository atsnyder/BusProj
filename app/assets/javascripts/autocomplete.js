function initializeSourceCity(){
var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'us'} 
};
var input = document.getElementsByName('search[from_city]');
var autocomplete = new google.maps.places.Autocomplete(input[0], options);

google.maps.event.addListener(autocomplete,'place changed',function(){
	var place = autocomplete.getPlace();
});

}

function initializeDestinationCity(){
var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'us'}
};
var input = document.getElementsByName('search[to_city]');
var autocomplete = new google.maps.places.Autocomplete(input[0], options);
google.maps.event.addListener(autocomplete,'place changed',function(){});

}

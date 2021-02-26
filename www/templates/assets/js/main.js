$(document).ready(function() {
	
	// $(".left-panel").customScrollbar({preventDefaultScroll: true});
	
	// Отслеживание и скрытие уведомлений об успехе
	setTimeout(function(){
		$('[data-notify-hide]').slideUp(400);
	}, 2000);

	$('[data-notify-hide]').dblclick(function(){
		$(this).slideUp(400);
	});
	// - END - Отслеживание и скрытие уведомлений об успехе

});

//Map block

function initMap() {

	var berezino = {lat: 53.839100, lng: 28.987900};

	myMap = new google.maps.Map(document.getElementById('map'), {

		center: berezino,
		zoom: 13,
		styles: [
		    {
		        "featureType": "administrative",
		        "elementType": "labels.text.fill",
		        "stylers": [
		            {
		                "color": "#444444"
		            }
		        ]
		    },
		    {
		        "featureType": "landscape",
		        "elementType": "all",
		        "stylers": [
		            {
		                "color": "#f2f2f2"
		            }
		        ]
		    },
		    {
		        "featureType": "poi",
		        "elementType": "all",
		        "stylers": [
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "road",
		        "elementType": "all",
		        "stylers": [
		            {
		                "saturation": -100
		            },
		            {
		                "lightness": 45
		            }
		        ]
		    },
		    {
		        "featureType": "road.highway",
		        "elementType": "all",
		        "stylers": [
		            {
		                "visibility": "simplified"
		            }
		        ]
		    },
		    {
		        "featureType": "road.arterial",
		        "elementType": "labels.icon",
		        "stylers": [
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "transit",
		        "elementType": "all",
		        "stylers": [
		            {
		                "visibility": "off"
		            }
		        ]
		    },
		    {
		        "featureType": "water",
		        "elementType": "all",
		        "stylers": [
		            {
		                "color": "#46bcec"
		            },
		            {
		                "visibility": "on"
		            }
		        ]
		    }
		]
	});	//map

	//Markers

	var markerBerezino = new google.maps.Marker({

		position: berezino,

		map: myMap,

		title: 'Березино',

		icon: '/templates/assets/img/map-icon/location-icon.png'

	});
}
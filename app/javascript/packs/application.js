import "bootstrap";
import "../components/flatpickr"
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initMapbox } from '../init_mapbox.js';
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initUpdateNavbarOnScroll();
initMapbox();
initAutocomplete();

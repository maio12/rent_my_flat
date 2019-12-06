import "bootstrap";
import "../components/flatpickr"
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../init_mapbox';
initMapbox();

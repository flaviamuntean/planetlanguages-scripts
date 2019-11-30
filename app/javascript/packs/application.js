import "bootstrap";
import {copyClipboard} from "../components/clipboard.js";
import {instantFilters} from "../components/filters.js";
// import {clickFilter} from "../components/filters.js";

copyClipboard();
instantFilters();
// clickFilter();

$(".alert").fadeOut(3000);

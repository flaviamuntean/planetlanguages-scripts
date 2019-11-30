import "bootstrap";
import {copyClipboard} from "../components/clipboard.js";
import {instantFilters} from "../components/filters.js";

copyClipboard();
instantFilters();

$(".alert").fadeOut(3000);

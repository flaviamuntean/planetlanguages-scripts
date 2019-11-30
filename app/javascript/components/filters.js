const instantFilters = () => {
  if (document.querySelectorAll(".form-check-input")) {
    const checkBoxes = document.querySelectorAll(".form-check-input");
    const form = document.querySelector('form.simple_form.filter');

    for (const check of checkBoxes) {
      console.log("found them");
      check.addEventListener( 'change', function() {
        console.log("changed");
        Rails.fire(form, 'submit');
      });
    }
  }
}

// const changeMacroColumns = () => {
//   if (document.getElementById('macros')) {
//     if (document.querySelector('.cards')) {
//       document.getElementById('macros').classList.remove("cards");
//       document.getElementById('macros').classList.add("cards-3");
//     } else {
//       document.getElementById('macros').classList.remove("cards-3");
//       document.getElementById('macros').classList.add("cards");
//     }
//   }
// }

// const clickFilter = () => {
//   // if elem with class dropdown-menu also has the class show

//   // get width of elem

//   // assign width to div filter-space
//   if (document.getElementById('dropdownMenuButton')) {
//     const filterBtn = document.getElementById('dropdownMenuButton');
//     filterBtn.addEventListener("click", changeMacroColumns);
//   }
// }

export {instantFilters};
// export {clickFilter};


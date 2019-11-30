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

export {instantFilters};


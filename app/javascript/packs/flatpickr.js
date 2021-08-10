const datepicker = document.querySelector('.datepicker');

flatpickr(datepicker, {
  altInput: true,
  altFormat: "F j, Y H:i",
  enableTime: true,
  dateFormat: "Y-m-d H:i",
});
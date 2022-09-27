function adjustMinute() {
  const startMinute = document.getElementById("reservation_start_datetime_5i");
  const endMinute = document.getElementById("reservation_end_datetime_5i");
  startMinute.value = "00"
  endMinute.value = "59"
}

window.addEventListener('click', adjustMinute)
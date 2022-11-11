function selectCar() {
  const selectCarList = document.getElementById("certificate_car_id")
  const carModel = document.getElementById('certificate_car_model');
  const licenseNum = document.getElementById('certificate_license_num');
  const driversName = document.getElementById('certificate_drivers_name');

  selectCarList.addEventListener('change',function() {
    const selectedIndex = this.selectedIndex
    if (selectedIndex == 0) {
      carModel.value = "";
      licenseNum.value = "";
      driversName.value = "";
    } else {
      const selectedCar = gon.cars[selectedIndex - 1];
      carModel.value = selectedCar.model;
      licenseNum.value = selectedCar.license_num;
      driversName.value = selectedCar.drivers_name;
    }
  })
}

function selectDestination() {
  const selectDestList = document.getElementById("certificate_dest_id")
  const buildNum = document.getElementById('certificate_building_num_id');
  const roomNum = document.getElementById('certificate_room_num_id');
  const destination = document.getElementById('certificate_destination');

  selectDestList.addEventListener('change',function() {
    const selectedIndex = this.selectedIndex
    if (selectedIndex == 1) {
      buildNum.value = gon.user.building_num_id;
      roomNum.value = gon.user.room_num_id;
      destination.value = gon.user.last_name;
    } else {
      buildNum.value = 0;
      roomNum.value = 0;
      destination.value = "";
    }
  })
}

window.addEventListener('load', selectCar)
window.addEventListener('load', selectDestination)
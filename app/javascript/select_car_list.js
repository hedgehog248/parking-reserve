window.addEventListener('load', function() {
  const carModel = document.getElementById('certificate_car_model');
  const licenseNum = document.getElementById('certificate_license_num');
  // const driversName = document.getElementById('certificate_drivers_name');
  const selectCarList = document.getElementById("certificate_car_id")

  selectCarList.addEventListener('change',function() {
    const selectedIndex = this.selectedIndex
    if (selectedIndex == 0) {
      carModel.value = "";
      licenseNum.value = "";
    } else {
      const selectedCar = gon.cars[selectedIndex - 1];
      carModel.value = selectedCar.model;
      licenseNum.value = selectedCar.license_num;
    }
  })
})
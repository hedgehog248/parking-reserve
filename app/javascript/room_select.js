const ary = new Array();
// 未選択
ary[0] = [0]

// 10号棟
ary[1] = [
  0,
  1, 2, 3, 4,
  7, 8, 9, 10,
  13, 14, 15, 16,
  19, 20, 21, 22,
  25, 26, 27, 28,
  31, 32
];

// 11号棟
ary[2] = [
  0,
  1, 2, 3, 4,
  7, 8, 9, 10,
  13, 14, 15, 16,
  19, 20, 21, 22,
  25, 26, 27, 28,
  31, 32, 33, 34,
  35, 36, 37, 38,
  39, 40
];

// 12号棟
ary[3] = [
  0,
  1, 2, 3, 4, 5, 6,
  7, 8, 9, 10, 11, 12,
  13, 14, 15, 16, 17, 18,
  19, 20, 21, 22, 23, 24,
  25, 26, 27, 28, 29, 30,
  31, 32
];

// 13号棟
ary[4] = [
  0,
  1, 2, 3,
  7, 8, 9,
  13, 14, 15,
  19, 20, 21,
  25, 26, 27
];

// 14号棟
ary[5] = [
  0,
  1, 2, 3, 4, 5, 6,
  7, 8, 9, 10, 11, 12,
  13, 14, 15, 16, 17, 18,
  19, 20, 21, 22, 23, 24,
  25, 26, 27, 28, 29, 30,
  31, 32, 33
];

// 15号棟
ary[6] = [
  0,
  1, 2, 3,
  7, 8, 9,
  13, 14, 15,
  19, 20, 21,
  25, 26, 27,
  31, 32
];

// 16号棟
ary[7] = [
  0,
  1, 2, 3,
  7, 8, 9,
  13, 14, 15,
  19, 20, 21,
  25, 26, 27
];

// 17号棟
ary[8] = [
  0,
  1, 2, 3,
  7, 8, 9,
  13, 14, 15,
  19, 20, 21,
  25, 26, 27
];


const toggle = (buildingAry, items, list) => {
  // 全ての表示を一度消す
  for (const item of items) {
    item.style.display = 'none';
  }
  // 棟のリストにある番号だけ表示させる
  for (const buildValue of buildingAry) {
    for (const item of items) {
      if (buildValue == item.value) {
        item.style.display = 'block';
        break;
      }
    }
  }
  list.value = 0;  // リストを未選択に戻す
};

// userページ用
window.addEventListener('load', function(){
  const userBuildingList = document.getElementById("user_building_num_id");
  const userRoomList = document.getElementById("user_room_num_id");
  const userListItems = userRoomList.children;

  userBuildingList.addEventListener('change', () => {
    toggle(ary[userBuildingList.value], userListItems, userRoomList);
  }, false);
})

// certificateのベージ用
window.addEventListener('load', function(){
  const certifBuildingList = document.getElementById("certificate_building_num_id");
  const certifRoomList = document.getElementById("certificate_room_num_id");
  const certifListItems = certifRoomList.children;

  certifBuildingList.addEventListener('change', () => {
    toggle(ary[certifBuildingList.value], certifListItems, certifRoomList);
  }, false);
})
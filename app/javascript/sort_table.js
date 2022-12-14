// 数値ソート（昇順）
function compareNumber(a, b) {
  return a.value - b.value;
}
// 数値ソート（降順）
function compareNumberDesc(a, b) {
  return b.value - a.value;
}
// 文字列ソート（昇順）
function compareString(a, b) {
  if (a.value < b.value) {
    return -1;
  } else {
    return 1;
  }
  return 0;
}
// 文字列ソート（降順）
function compareStringDesc(a, b) {
  if (a.value > b.value) {
    return -1;
  } else {
    return 1;
  }
  return 0;
}
// インジケータの表示を変更
function changeIndicator(element) {
  // クリックした列のインジケータを切替え
  if (element.classList.contains('asc')) {
    element.classList.replace('asc', 'desc');
  } else if (element.classList.contains('desc')) {
    element.classList.replace('desc', 'asc');
  } else {
    element.classList.add('asc');
  }
  // クリックした列以外の表示を消す
  Array.from(element.parentNode.children)
    .filter(e => e !== element)
    .forEach(e => e.classList.remove('asc', 'desc'));
}

window.addEventListener('load', function() {
  let column_no = 0;
  let column_no_prev = 0;
  this.document.querySelectorAll('.sortable-table th').forEach(element => {
    element.onclick = function() {
      column_no = this.cellIndex; //クリックした列番号
      let table = this.parentNode.parentNode.parentNode;
      let sortType = 0; // 0:数値 1:文字
      let sortArray = new Array; // クリックした列のデータを全て格納する配列
      for (let r = 1; r < table.rows.length; r++) {
        //行番号と値を配列に格納
        let column = new Object;
        column.row = table.rows[r];
        column.value = table.rows[r].cells[column_no].textContent;
        sortArray.push(column);
        // 数値判定
        if (isNaN(Number(column.value))) {
          sortType = 1; // 値が数値変換できなかった場合は文字列ソート
        }
      }

      if (sortType == 0) { // 数値ソート
        if (column_no_prev == column_no) { // 同じ列が2回クリックされた場合は降順ソート
          sortArray.sort(compareNumberDesc);
          changeIndicator(this);
        } else {
          sortArray.sort(compareNumber);
          changeIndicator(this);
        }
      } else { // 文字列ソート
        if (column_no_prev == column_no) { // 同じ列が2回クリックされた場合は降順ソート
          sortArray.sort(compareStringDesc);
          changeIndicator(this);
        } else {
          sortArray.sort(compareString);
          changeIndicator(this);
        }
      }
      // ソート後のTRオブジェクトを順番にtbodyへ追加(移動)
      let tbody = this.parentNode.parentNode;
      for (let i = 0; i < sortArray.length; i++) {
        tbody.appendChild(sortArray[i].row);
      }
      // 昇順降順ソート切替えのために列番号を保存
      if (column_no_prev == column_no) {
        column_no_prev = -1; // 降順ソート
      } else {
        column_no_prev = column_no;
      }
    }
  })
})
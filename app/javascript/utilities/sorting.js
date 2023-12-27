document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle(){
  //Nodelist
  //https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var table = document.querySelector('table')
  var rows = table.querySelectorAll('tr')
  var sortedRows = []
  
  //select all rows except several first ones which is the header
  for( var i = 3; i < rows.length; i++ ){
    sortedRows.push(rows[i])
  }

  var arrowUp = this.querySelector('.octicon-arrow-up')
  var arrowDown = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowDown.classList.remove('hide')
    arrowUp.classList.add('hide')
  }

  // render a sorted table
  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  var tHeaders = document.createElement('thead')
  tHeaders.classList.add('table-bordered')

  for( i = 0; i < rows.length - sortedRows.length; i++){
    tHeaders.appendChild(rows[i])
  }
  sortedTable.appendChild(tHeaders)

  for( i = 0; i < sortedRows.length; i++){
    sortedTable.appendChild(sortedRows[i])
  }
  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent
  if (testTitle1 < testTitle2) {return -1; }
  if (testTitle1 > testTitle2) {return 1; }
  return 0;
}

function compareRowsDesc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent
  if (testTitle1 < testTitle2) {return 1; }
  if (testTitle1 > testTitle2) {return -1; }
  return 0;
}

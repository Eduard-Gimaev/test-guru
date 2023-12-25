document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title');

  control.addEventListener('click', sortRowsByTitle);
}); 

function sortRowsByTitle(){
  //Nodelist
  //https://developer.mozilla.org/ru/docs/Web/API/NodeList

  var table = document.querySelector('table');
  var rows = table.querySelectorAll('tr');
  var sortedRows = [];

  //select all rows except the very first one which is the header

  for( var i = 1; i < rows.length; i++ ){
    sortedRows.push(rows[i]);
  }
  console.log(sortedRows)
}
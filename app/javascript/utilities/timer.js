
console.log("custom js file loaded")

// document.addEventListener('turbolinks:load', function() {
//     var timer = document.querySelector('.timer')
//     if (timer) { countdown(timer) }
// });

// function countdown(timer){
//   var timeStart = Date.now()
//   var timeEnd = timeStart + (timer.dataset.timer * 1000)
//   var timeLeft = (timeEnd - timeStart)/1000

//   setInterval(function(){
//     document.querySelector('.timer').textContent = 'timeLeft: ' + timeLeft 
//     timeLeft -= 1

//     if (timeLeft < 0 ) {
//         document.querySelector('.timer').textContentn = 'Time is up, please press NEXT'
//     }
//   })
// }

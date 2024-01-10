document.addEventListener('turbolinks:load', function() {
    var progressBar = document.querySelector('.progress-bar')
    setProgress(progressBar)
    
})

function setProgress(progressBar){
    var currentQuestion = progressBar.dataset.currentQuestion - 1
    var allQuestions = progressBar.dataset.allQuestions
    var progress = Math.round(currentQuestion / allQuestions * 100)

    progressBar.setAttribute('style', 'width:' + progress + '%')
    progressBar.innerText = Math.round(progress) + '%'
}

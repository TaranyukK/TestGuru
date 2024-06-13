document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.progress')

  if (progressBar) {
    const questionsDone = progressBar.dataset.questionsDone
    const questionsCount = progressBar.dataset.questionsCount
    const progressPercent = (questionsDone / questionsCount) * 100

    progressBar.querySelector('.progress-bar').style.width = `${progressPercent}%`
    progressBar.querySelector('.progress-bar').setAttribute('aria-valuenow', progressPercent)
  }
})

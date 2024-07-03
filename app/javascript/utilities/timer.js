document.addEventListener('turbolinks:load', () => {
  const timer = document.getElementById("timer")
  const form = document.getElementById("answer_form")

  if (timer) {
    let duration = parseInt(timer.dataset.duration, 10)
    updateTimer(timer, duration)

    const interval = setInterval(() => {
      duration--
      updateTimer(timer, duration)

      if (duration <= 0) {
        clearInterval(interval)
        form.submit()
      }
    }, 1000)
  }
})

const updateTimer = (element, duration) => {
  const { hours, minutes, seconds } = timeLeftToTime(duration)
  element.innerHTML = `${hours}:${minutes}:${seconds}`
}

const timeLeftToTime = (duration) => {
  const hours = Math.floor(duration / 3600)
  const minutes = Math.floor((duration % 3600) / 60)
  const seconds = duration % 60

  return {
    hours: hours < 10 ? `0${hours}` : hours,
    minutes: minutes < 10 ? `0${minutes}` : minutes,
    seconds: seconds < 10 ? `0${seconds}` : seconds
  }
}

document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  const table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  const octiconArrowUp = this.querySelector('.octicon-arrow-up')
  const octiconArrowDown = this.querySelector('.octicon-arrow-down')

  if (octiconArrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    octiconArrowUp.classList.remove('hide')
    octiconArrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    octiconArrowDown.classList.remove('hide')
    octiconArrowUp.classList.add('hide')
  }

  const sortedTable = document.createElement('table')
  sortedTable.classList.add('table', 'table-striped')

  const sortedTableThead = document.createElement('thead')
  const sortedTableTbody = document.createElement('tbody')

  sortedTableThead.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTableTbody.appendChild(sortedRows[i])
  }

  sortedTable.appendChild(sortedTableThead)
  sortedTable.appendChild(sortedTableTbody)

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}

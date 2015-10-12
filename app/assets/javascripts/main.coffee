coins = document.getElementById('CoinsChart').getContext('2d')
options =
  datasetStroke: true
  datasetStrokeWidth: 2
data =
  labels: [
    'January'
    'February'
    'March'
    'April'
    'May'
    'June'
    'July'
  ]
  datasets: [
    {
      label: 'Пользователей'
      fillColor: 'rgba(220,220,220,0.2)'
      strokeColor: 'rgba(220,220,220,1)'
      pointColor: 'rgba(220,220,220,1)'
      pointStrokeColor: '#fff'
      pointHighlightFill: '#fff'
      pointHighlightStroke: 'rgba(220,220,220,1)'
      data: [
        65
        59
        80
        81
        56
        55
        40
      ]
    }
    {
      label: 'My Second dataset'
      fillColor: 'rgba(151,187,205,0.2)'
      strokeColor: 'rgba(151,187,205,1)'
      pointColor: 'rgba(151,187,205,1)'
      pointStrokeColor: '#fff'
      pointHighlightFill: '#fff'
      pointHighlightStroke: 'rgba(151,187,205,1)'
      data: [
        28
        48
        40
        19
        86
        27
        90
      ]
    }
  ]
CoinsChart = new Chart(coins).Line(data, options)
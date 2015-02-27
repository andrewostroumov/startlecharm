$ ->
  $('.progress-bar').each (index, tag) ->
    $(tag).css 'width', $(tag).data 'use'
  do ->
    return if $('#cpu_chart').length == 0
    update_url = $('#cpu_chart').data('update-url')
    $.getJSON update_url, limit: 10, (data) ->
      points = []
      $.map data, (val) ->
        points.push parseInt(val.cpu.frequency)
      $('#cpu_chart').highcharts
        series: [data: points]
        chart:
          type: 'areaspline'
          events: load: ->
            series = @series[0]
            setInterval ->
              $.getJSON update_url, limit: 1, (data) ->
                series.addPoint [parseInt(data[0].cpu.frequency)], true, true
            , 2000
            return
        title: text: ''
        xAxis:
          labels: formatter: ->
        yAxis:
          title: text: 'Frequency (MHz)'
          labels: formatter: -> 
            this.value
        legend: enabled: false
        exporting: enabled: false
        tooltip: enabled: false
        plotOptions:
          series:
            lineWidth: 1
          areaspline:
            marker: enabled: false
  do ->
    return if $('#memory_chart').length == 0
    update_url = $('#memory_chart').data('update-url')
    $.getJSON update_url, limit: 10, (data) ->
      used = []
      available = []
      $.map data, (val) ->
        used.push parseInt((val.memory.total - val.memory.available)/1024)
      $('#memory_chart').highcharts
        series: [
          {
            data: used
          }
        ]
        chart:
          type: 'areaspline'
          events: load: ->
            used = @series[0]
            setInterval ->
              $.getJSON update_url, limit: 1, (data) ->
                used.addPoint [parseInt((data[0].memory.total - data[0].memory.available)/1024)], true, true
            , 2000
            return
        title: text: ''
        xAxis:
          labels: formatter: ->
        yAxis:
          title: text: 'Memory (MB)'
          labels: formatter: ->
            this.value
        legend: enabled: false
        exporting: enabled: false
        tooltip: enabled: false
        plotOptions:
          series:
            lineWidth: 1
          areaspline:
            marker: enabled: false
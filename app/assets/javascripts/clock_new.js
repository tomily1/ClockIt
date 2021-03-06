$(document).on('turbolinks:load', function() {
  startTime();
  
  function startTime() {
    $('#time-zone').html(/\((.*)\)/.exec(new Date().toString())[1]);
    var today = new Date();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var second = today.getSeconds();
  
    minute = checkTime(minute);
    second = checkTime(second)
  
    var time = hour + ":" + minute + ":" +second;
    $('#digital-clock').html(time);
    $('#clock_clocked_at').val(new Date())

    setTimeout(startTime, 1000)
  }

  function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
  }
});

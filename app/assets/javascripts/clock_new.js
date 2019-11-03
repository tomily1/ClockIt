$(document).ready(function() {
  startTime();
  
  function startTime() {
    $('#time-zone').html(/\((.*)\)/.exec(new Date().toString())[1]);
    let today = new Date();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var second = today.getSeconds();
  
    minute = checkTime(minute);
    second = checkTime(second)
  
    let time = `${hour}:${minute}:${second}`;
    $('#digital-clock').html(time);

    setTimeout(startTime, 1000)
  }

  function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
  }
});

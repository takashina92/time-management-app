'use strict'
$(document).ready(function() {
  let setTimeoutId = undefined;
  let startTime = 0;
  let currentTime = 0;
  let elapsedTime = 0;

  function runTimer(){
    currentTime = Date.now();
    showTime();
    setTimeoutId = setTimeout(() => {
      runTimer();
    },10)
  }
  
  function showTime(){
    let d = new Date(currentTime - startTime + elapsedTime);
    const getHou = d.getHours();
    const getMin = d.getMinutes();
    const getSec =d.getSeconds();
    const getMillisec = Math.floor(d.getMilliseconds() / 10);
    $("#timer").text(`${String(getMin).padStart(2,'0')}:${String(getSec).padStart(2,'0')}:${String(getMillisec).padStart(2,'0')}`);
  }

  function classReplacementRun()  {
    $("#start").addClass("disabled");
    $("#stop").removeClass("disabled");
    $("#reset").addClass("disabled");
  }

  function classReplacementStop()  {
    $("#start").removeClass("disabled");
    $("#stop").addClass("disabled");
    $("#reset").removeClass("disabled");
  }

  function classReplacementInitial()  {
    $("#start").removeClass("disabled");
    $("#stop").addClass("disabled");
    $("#reset").addClass("disabled");
  }

  $(document).on('click', '#start', function() {
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementRun()
    startTime = Date.now();
    runTimer();
  });

  $(document).on('click', '#stop', function() {
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementStop()
    elapsedTime += currentTime - startTime;
    clearTimeout(setTimeoutId);
  });

  $(document).on('click', '#reset', function() {
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementInitial()
    clearTimeout(setTimeoutId);
    elapsedTime = 0
    $("#timer").text("00:00:00");
  });
  
  


});

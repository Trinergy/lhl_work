// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Key:
// ccbf5c74bab427b1f8f37b4fbcf9238e

// Secret:
// 24d784462d863194

$(function() {

//easter egg
  $('#twerk').on('click', function() {
    $('<h2>').appendTo('body').text("TWERK!");
  });
//search form using autocomplete api. taking parameter and reconstructing url. request in jsonp to bypass CSOR block. 
  $('.search-wrapper').on('click', '#srchBtn', function () {
    var query = $('#query').val();
    var url = "http://autocomplete.wunderground.com/aq?query=" + query;
    $.ajax({
      url: url,
      dataType: 'jsonp',
      jsonp: 'cb',
      success: function(data) {
        // clear list (SPA)
        $('.search-results').empty();
        $('.selectedCountry').empty();
        //post the list results and assign data attributes to each list item to use for later Get request
        data.RESULTS.forEach(function(result) {
          var resultLi = $('<li>').appendTo('.search-results').text(result.name).data("info", {zmw: result.zmw, country: result.c, name: result.name, timezone: result.tzs});
          //assigning data to variables then making html components for later requested info to be added to
          resultLi.on('click', function() {
            var name = resultLi.data("info").name
            var country = resultLi.data("info").country
            var zmw = resultLi.data("info").zmw
            var timezone = resultLi.data("info").timezone
            var url = "http://api.wunderground.com/api/ed1f1804b2510bf4/forecast/q/zmw:" + zmw + ".json"
            //preprinting the categories
            $('.search-results').empty();
            var chosenCountry = $('<h3>').appendTo('.selectedCountry').text(name);
            $('<p>').appendTo(chosenCountry).text("Country Code: " +country);
            $('<p>').appendTo(chosenCountry).text("Time Zone: " + timezone);
            $('<p>').appendTo(chosenCountry).text("4 Day Forecast");
            console.log(url);
            //requesting forecast information
            $.getJSON( url, function(location) {
              var forecast = location.forecast.simpleforecast.forecastday;
              forecast.forEach(function(day) {
                var date = day.date.monthname + " " + day.date.day + ", " + day.date.year;
                var condition = day.conditions;
                var tempHigh = day.high.celsius + " Celsius " + day.high.fahrenheit + " Fahrenheit";
                var tempLow = day.low.celsius + " Celsius " + day.low.fahrenheit + " Fahrenheit";
                var aveWindDir = day.avewind.dir;
                var aveWindSpeed = day.avewind.kph + " kph";
                var pop = day.pop
                //printing forecast information
                var forecastDay = $('<p>').appendTo(chosenCountry).text(date);
                $('<p>').appendTo(forecastDay).text("Conditions: " + condition);
                $('<p>').appendTo(forecastDay).text("Pop: " + pop +"%");
                $('<p>').appendTo(forecastDay).text("Temperature High: " + tempHigh);
                $('<p>').appendTo(forecastDay).text("Low: " + tempLow);
                $('<p>').appendTo(forecastDay).text("Ave Wind Direction: " + aveWindDir);
                $('<p>').appendTo(forecastDay).text("Speed: " + aveWindSpeed);

                // debugger;
              });
            });
          });
        });
      }
    });
  });












});
var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();

app.get('/scrape', function(req, res){

  //All the web scraping magic will happen here
  url = 'http://www.imdb.com/title/tt1229340/';

  request(url, function(error, response, html){

        // First we'll check to make sure no errors occurred when making the request

        if(!error){
            // Next, we'll utilize the cheerio library on the returned html which will essentially give us jQuery functionality

            var $ = cheerio.load(html);

            var title, release, rating;
            var json = { title : "", release : "", rating : ""};

            $('.title_wrapper').filter(function(){
                var data = $(this);
                console.log(data)
                title = data.children().first().text();
            
                release = data.children().last().text();

                json.title = title;
                json.release = release;
            });

            // Since the rating is in a different section of the DOM, we'll have to write a new jQuery filter to extract this information.

            $('.star-box-giga-star').filter(function(){
                var data = $(this);

                // The .star-box-giga-star class was exactly where we wanted it to be.
                // To get the rating, we can simply just get the .text(), no need to traverse the DOM any further

                rating = data.text();

                json.rating = rating;
            });
        }
        console.log(json)
        fs.writeFile('output.json', JSON.stringify(json, null, 4), function(err){

        console.log('File successfully written! - Check your project directory for the output.json file');

      });

    // Finally, we'll just send out a message to the browser reminding you that this app does not have a UI.
    res.send('Check your console!');

    });
}) ;



app.listen('3000');

console.log('Magic happens on port 3000');

exports = module.exports = app;
let paraEl = document.getElementsByTagName('pre')[0];
let preEl = document.getElementsByTagName('pre')[1];
let postCode;
let geoCode;

//fetch data when submit clicked with postcode input
function showInput() {
    document.getElementById('display').innerHTML = document.getElementById('user_input').value;
    postCode = document.getElementById('user_input').value.replace(/\s/g,'');
    testGeo();
}

//fetch data when submit clicked with geolocation input
function showInput2() {
    document.getElementById('displayReverse').innerHTML = document.getElementById('user_input2').value;
    geoCode = document.getElementById('user_input2').value.replace(/\s/g,'').split();
    testReverseGeo();
}

//fetch data location info function
function testGeo(){
fetch(`https://api.swiftcomplete.com/v1/search/geocode/?query=${postCode}&key=14c29c71-c217-40`)
.then(response => response.json())
.then(data => {

    console.log(data)
    paraEl.innerHTML = JSON.stringify(data, undefined, 2);
});
}

  //get location data with jquery below

//   $.ajax(settings).done(function (response) {
//     // console.log(response.results[0].description[0].text);
//     const jsonStr = JSON.stringify(response, undefined, 2);
//     // console.log(jsonStr);
//     paraEl.innerHTML = jsonStr;
//   });


// var settings = {
//     "url": "https://api.swiftcomplete.com/v1/search/geocode/?query=SW1A0A&key=14c29c71-c217-40",
//     "method": "GET",
//     "timeout": 0,
//   };

//fetch data reverse geolocation info function
function testReverseGeo(){
    fetch(`https://api.swiftcomplete.com/v1/search/geocode?origin=${geoCode[0]}${geoCode[1]}&limit=3&topics=postcode&key=14c29c71-c217-40`)
    .then(response => response.json())
    .then(data => {

      console.log(data)
      preEl.innerHTML = JSON.stringify(data, undefined, 2);
    });
  }


//get reverse data with jquery below

//   var settingsReverse = {
//     "url": "https://api.swiftcomplete.com/v1/search/geocode?origin=51.484819,-0.17033&limit=3&topics=postcode&key=14c29c71-c217-40",
//     "method": "GET",
//     "timeout": 0,
//   };
  
//   $.ajax(settingsReverse).done(function (res) {
//     // console.log(res.results[0].description[0].text);
//     const jsonStr2 = JSON.stringify(res, undefined, 2);
//     // console.log(jsonStr2);
//     preEl.innerHTML = jsonStr2;
//   });

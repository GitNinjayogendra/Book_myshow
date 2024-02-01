var selectedSeats = [];
  var seatPrice = 100;
  var price = [];
  document.addEventListener('DOMContentLoaded', function() {
    var seatLinks = document.querySelectorAll('.seat-link');
    seatLinks.forEach(function(seatLink) {
      seatLink.addEventListener('click', function(event) {
       seatLink.parentElement.classList.toggle('myClass');
        event.preventDefault();
          var seatNumber = this.getAttribute('data-seat-number');
          if (selectedSeats.includes(seatNumber)) {
            selectedSeats = selectedSeats.filter(function(seat) {
              return seat !== seatNumber;
            });
          }else {
            selectedSeats.push(seatNumber);
          }
            updateTotalPrice();
        });
      });
    });

  function updateTotalPrice() {
    var totalPrice = selectedSeats.length * seatPrice;
    var price = document.getElementById('price').innerText = totalPrice.toFixed(2);
    document.getElementById('price_value').value = price;
  }

  function seatNumber(){
  var showtime =  document.getElementById("showtime_field").value;
  var movie = document.getElementById("movie_field").value;
  var cinema = document.getElementById("cinema_field").value;
  var price = document.getElementById("price_value").value;

    $.ajax({
      url: "/show_seat",
      type: "POST",
      dataType: 'script',
      data: {seats: selectedSeats, showtime: showtime, movie: movie, cinema: cinema, price: price},
      success: function(data) {
      },
    });
  }

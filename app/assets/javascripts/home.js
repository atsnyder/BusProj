 $(window).load(function load()
  {
    today = new Date();
    from_date = new Date();
    to_picker = new Pikaday();

      from_picker = new Pikaday({
        field: document.getElementById('from_datepicker'),
        format: 'D MMM YYYY', 
        minDate: new Date(),
        onSelect: function() 
        {
          to_picker.destroy();
          to_picker = new Pikaday({
              field: document.getElementById('to_datepicker'),
              format: 'D MMM YYYY',
              minDate: from_picker.getDate(),
              onSelect: function() 
              {
                  console.log(this.getMoment().format('Do MMMM YYYY'));
              }
          });

            console.log(this.getMoment().format('Do MMMM YYYY'))
        }

    });

      document.getElementById('from_search_box').value = "";
      document.getElementById('to_search_box').value = "";
      document.getElementById('from_datepicker').value = "";
      document.getElementById('to_datepicker').style.visibility = 'visible';
      document.getElementById('to_datepicker').value = "";
      document.getElementById('passengers_box').value = "";
      document.getElementById('search_radio_OneWay').checked = false;
      document.getElementById('search_radio_RoundTrip').checked = true;

  });






  if (document.getElementById('search_radio_OneWay').checked) 
  {
      document.getElementById('to_datepicker').style.visibility = 'hidden';
  }


  function RoundCheck()
  { 
    if (document.getElementById('search_radio_OneWay').checked)
    {
      document.getElementById('to_datepicker').required = false;
      document.getElementById('to_datepicker').style.visibility = 'hidden';
      document.getElementById('to_datepicker').style.display = 'none';
    }
    else 
    {
      document.getElementById('to_datepicker').style.visibility = 'visible';
      document.getElementById('to_datepicker').style.display = 'inline';
    }
  }


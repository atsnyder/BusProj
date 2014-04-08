$(document).ready(function() 
    { 
        $("#myTable").tablesorter({
		headers : { 1 : {sorter : 'shortdate' }, 
			    2 : {sorter : 'shortdate' },
 			    3 : {sorter : false       }
 			  }
		}	
	); 
    } 
);

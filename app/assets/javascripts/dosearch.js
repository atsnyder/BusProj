$(document).ready(function() 
    { 
	$("#myTable").tablesorter({
        		headers : { 		    
                        				1 : {sorter : 'time'},
                                2 : {sorter : 'false'},
                                3 : {sorter : 'time'},	
                                4 : {sorter : 'false'},			
                        				5 : {sorter : 'false'}
               			  }
           
		}	
	); 
    } 
);

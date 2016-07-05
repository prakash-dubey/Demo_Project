function validateAddress() {	

	var a = $(".billing:checked").length;
	if ( a > 1 || a == 0 ){
		alert('Select only one Billing Address')
		return false;
	}
	var b = $(".shipping:checked").length;
	if ( b >1 || b == 0 ){
		alert('Select only one Shipping Address')
		return false;
	}
	else { 
		return true;
	}
}
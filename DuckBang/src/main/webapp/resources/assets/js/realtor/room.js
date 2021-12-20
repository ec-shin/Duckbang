function addMonthDiv() {
    const td = document.createElement('td');
    const month_div1 = document.createElement('div');
    month_div1.setAttribute('class', 'realtor_month_div');
    const month_div2 = document.createElement('div');
    month_div2.setAttribute('class','realtor_month_div2');
    const p1 = document.createElement('p');
    p1.setAttribute('class','realtor_month_p');
    p1.innerText = '월세';
    const input1 = document.createElement('input');
    input1.setAttribute('class','realtor_month_input');
    input1.setAttribute('placeholder','보증금');
    input1.setAttribute('form','regist_form');
    input1.setAttribute('name','ok_deposit');
    const p2 = document.createElement('p');
    p2.setAttribute('class','realtor_month_p2');
    p2.innerText = '/';
    const input2 = document.createElement('input');
    input2.setAttribute('class','realtor_month_input');
    input2.setAttribute('placeholder','월세');
    input2.setAttribute('form','regist_form');
    input2.setAttribute('name','ok_month_of_payment');
    const p3 = document.createElement('p');
    p3.setAttribute('class','realtor_month_p3');
    p3.innerText = '만원';
    const span = document.createElement('span');
    span.innerText = '(ex: 월세 1000만원/50만원)';
    const btn = document.createElement('button');
	btn.setAttribute('id','exitBtn');
    btn.innerText = 'x';
	btn.addEventListener('click',()=>{
		const room_th = document.getElementById('room_th');
		const room_tr = document.getElementById('room_tr');
		room_tr.removeChild(room_tr.lastChild);
		room_th.setAttribute('rowspan', 2);
		
	});

    p3.appendChild(span);
    month_div2.appendChild(p1);
    month_div2.appendChild(input1);
    month_div2.appendChild(p2);
    month_div2.appendChild(input2);
    month_div2.appendChild(p3);
    month_div2.appendChild(btn);
    month_div1.appendChild(month_div2);
    td.appendChild(month_div1);

	return td;
}

document.getElementById('month_btn').addEventListener('click', () => {
	const room_th = document.getElementById('room_th');
	const room_tr = document.getElementById('room_tr');
	var rowspan = parseInt(room_th.getAttribute('rowspan'));
	
	if(rowspan == 2){
		 room_th.setAttribute('rowspan', rowspan + 1);
    	 room_tr.appendChild(addMonthDiv());
	}else{
		room_tr.removeChild(room_tr.lastChild);
		room_tr.appendChild(addMonthDiv());
	}
    console.log(document.getElementById('month_btn').innerText);
        document.getElementById('ok_code_input').value = document.getElementById('month_btn').innerText;

});


function addDeposit(){
	const td = document.createElement('td');
    const deposit_div1 = document.createElement('div');
    deposit_div1.setAttribute('class','room_deposit_contain');
    const deposit_div2 = document.createElement('div');
    deposit_div2.setAttribute('class','room_deposit_div');
    const p1 = document.createElement('p');
    p1.setAttribute('class','room_deposit_p1');
    p1.innerText = '전세';
    const input = document.createElement('input');
    input.setAttribute('placeholder','전세');
    input.setAttribute('class','room_deposit_input');
    const input2 = document.createElement('input');
    input2.setAttribute('type', 'hidden');
    input2.setAttribute('value', '0');
    input.setAttribute('form','regist_form');
    input.setAttribute('name','ok_deposit');
    input2.setAttribute('form','regist_form');
    input2.setAttribute('name','ok_month_of_payment');
    const p2 = document.createElement('p');
    p2.setAttribute('class','room_deposit_p2');
    p2.innerText = '만원';
    const span = document.createElement('span');
    span.innerText = '(ex: 전세 2000만원)';
    const btn = document.createElement('button');
    btn.innerText = 'x';
	btn.addEventListener('click',()=>{
		const room_th = document.getElementById('room_th');
		const room_tr = document.getElementById('room_tr');
		room_tr.removeChild(room_tr.lastChild);
		room_th.setAttribute('rowspan', 2);
		
	});

    p2.appendChild(span);
    deposit_div2.appendChild(p1);
    deposit_div2.appendChild(input);
    deposit_div2.appendChild(input2);
    deposit_div2.appendChild(p2);
    deposit_div2.appendChild(btn);
    deposit_div1.appendChild(deposit_div2);
    td.appendChild(deposit_div1);

    return td;
}

document.getElementById('deposit_btn').addEventListener('click', () => {
    const room_th = document.getElementById('room_th');
	const room_tr = document.getElementById('room_tr');
    var rowspan = parseInt(room_th.getAttribute('rowspan'));

    if(rowspan == 2){
        room_th.setAttribute('rowspan', rowspan + 1);
        room_tr.appendChild(addDeposit());
    }else{
        room_tr.removeChild(room_tr.lastChild);
        room_tr.appendChild(addDeposit());
    }
    console.log(document.getElementById('deposit_btn').innerText);
    document.getElementById('ok_code_input').value = document.getElementById('deposit_btn').innerText;
});

function addTrading(){
	const td = document.createElement('td');
    const deposit_div1 = document.createElement('div');
    deposit_div1.setAttribute('class','room_deposit_contain');
    const deposit_div2 = document.createElement('div');
    deposit_div2.setAttribute('class','room_deposit_div');
    const p1 = document.createElement('p');
    p1.setAttribute('class','room_deposit_p1');
    p1.innerText = '매매';
    const input = document.createElement('input');
    input.setAttribute('placeholder','매매');
    input.setAttribute('class','room_deposit_input');
    const input2 = document.createElement('input');
    input2.setAttribute('type', 'hidden');
    input2.setAttribute('value', '0');
    input.setAttribute('form','regist_form');
    input.setAttribute('name','ok_deposit');
    input2.setAttribute('form','regist_form');
    input2.setAttribute('name','ok_month_of_payment');
    const p2 = document.createElement('p');
    p2.setAttribute('class','room_deposit_p2');
    p2.innerText = '만원';
    const span = document.createElement('span');
    span.innerText = '(ex: 매매 2000만원)';
    const btn = document.createElement('button');
    btn.innerText = 'x';
	btn.addEventListener('click',()=>{
		const room_th = document.getElementById('room_th');
		const room_tr = document.getElementById('room_tr');
		room_tr.removeChild(room_tr.lastChild);
		room_th.setAttribute('rowspan', 2);
		
	});

    p2.appendChild(span);
    deposit_div2.appendChild(p1);
    deposit_div2.appendChild(input);
    deposit_div2.appendChild(input2);
    deposit_div2.appendChild(p2);
    deposit_div2.appendChild(btn);
    deposit_div1.appendChild(deposit_div2);
    td.appendChild(deposit_div1);

    return td;
}

document.getElementById('trading_btn').addEventListener('click', () => {
    const room_th = document.getElementById('room_th');
	const room_tr = document.getElementById('room_tr');
    var rowspan = parseInt(room_th.getAttribute('rowspan'));

    if(rowspan == 2){
        room_th.setAttribute('rowspan', rowspan + 1);
        room_tr.appendChild(addTrading());
    }else{
        room_tr.removeChild(room_tr.lastChild);
        room_tr.appendChild(addTrading());
    }
    console.log( document.getElementById('trading_btn').innerText);
    document.getElementById('ok_code_input').value = document.getElementById('trading_btn').innerText;
});

function areaChange(e){
    if(e.getAttribute('id') == 'area_input1'){
        const input2 = document.getElementById('area_input2');
        input2.value = Math.round(e.value * 3.3058 * 100) / 100;	
    }else{
        const input4 = document.getElementById('area_input4');
        input4.value = Math.round(e.value * 3.3058 * 100) / 100;	
    }
}

function possible(e) {
	   const fee = document.getElementById('parking_fee');
	   fee.readOnly = false; 
	}
function impossible(e) {
    const fee = document.getElementById('parking_fee');
    fee.readOnly = true;
    fee.value = 0;
}

function maintenance(e){
    const input = document.getElementById('maintenance_fee');
    if(e.checked == true){
        input.value = 0;
        input.readOnly = true;
    }else{
        input.readOnly = false;
        input.value="";
    }
}

function initMap() {
	var markers = [];
    var infowindow = new google.maps.InfoWindow();
    var geocoder =  new google.maps.Geocoder();
	const map = new google.maps.Map(document.getElementById("map"), {
        center: {
           lat: 37.566826,
           lng: 126.9786567
        },
        zoom: 10,
        mapTypeControl: false,
        fullscreenControl: false,
        mapTypeId: "roadmap",
        options: {
           gestureHandling: 'greedy'
        }
     });
	
	map.addListener('click', (e) => {
        const input_x = document.getElementById('location_x');
        const input_y = document.getElementById('location_y');
        
        input_x.value = Math.round(e.latLng.lat() * 1000000) / 1000000;
        input_y.value = Math.round(e.latLng.lng() * 1000000) / 1000000;
        Marker(e.latLng);

        geocoder.geocode({'latLng' : e.latLng}, function(results, status) {
        	const p = document.getElementById('address_p');
        	
            if (status == google.maps.GeocoderStatus.OK)  {            
            if (results[1]){           
				p.innerText = results[1].formatted_address;                                                  
            }          
            }
            });
    });
	
	
	function Marker(location){
		clearOverlays();
		const marker = new google.maps.Marker({
            position: location,
            map: map
        });
		markers.push(marker);
        console.log(markers);
    }
	
	function clearOverlays(){
		for(var i=0; i<markers.length; i++){
			markers[i].setMap(null);
		}
		markers.length = 0;
		
	}
  }
/**
 * 
 */

var xhr = new XMLHttpRequest();
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/locationBasedList'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'66xFuhCa39faVNagAqAmZjvPLYtz8b5vH1O2OaqVjTe98mlBnaGmJBSRdVmul0PdpZ3184G8%2BuLyJVilppKD%2FA%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('128.6142847'); /**/
queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('36.0345423'); /**/
queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('20000'); /**/
queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
	var sliderTest = $(".slider");
    if (this.readyState == 4) {
        var obj = JSON.parse(this.responseText);
		console.log(obj);
        var itemAr = obj.response.body.items.item;
        for (var i = 0; i < itemAr.length; i++) {
			if(itemAr[i].firstImageUrl == null){continue;}
	        console.log(itemAr[i].firstImageUrl);
	        var codeTest = "<div><img src='" + itemAr[i].firstImageUrl + "'></div>"
	        sliderTest.append(codeTest);
		}
    }
};

xhr.send('');

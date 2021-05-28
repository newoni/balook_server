/**
 * https://okky.kr/article/394229
 */

function sendGetRequest4Article(articleNumber)
{
	let url = "articleController.jsp?articleNumber=" + articleNumber
	console.log(url);
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}
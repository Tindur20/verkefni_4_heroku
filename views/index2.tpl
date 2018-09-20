<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/main.css">
	<link rel="stylesheet" href="/static/normalize.css">
	<link rel="stylesheet" href="/static/bootstrap.min.css">
	<title>json skrár</title>
</head>
<body>
	% include('haus.tpl')
	<%
	import urllib.request, json
	with urllib.request.urlopen("http://apis.is/currency/m5") as url:
    gogn = json.loads(url.read().decode())
	%>

		<section class="col1_1">
		<h2 class="rond punktalina">Gengi gjaldmiðla</h2>
		<table class="table table-striped">
		    <tread>
		    <th>Merki</th>
		    <th>Nafn</th>
		    <th>Gengi</th>
		    </tread>
            <tbody>
                % cnt = 0
                % for i in gogn['results']:
                <tr>
                    <td>{{ i['shortName'] }}</td><td>{{ i['longName'] }}</td><td> {{ i['value'] }}</td>
                </tr>
                %end
            </tbody>
		</table>
		</section>
		<section class="col1_1">
		<br>
		% include('fotur.tpl')
		</section>

</body>
</html>

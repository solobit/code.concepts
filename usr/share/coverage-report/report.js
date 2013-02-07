
var sprintf = require('sprintf').sprintf;

process.on('exit', function() {
	var dirOrFile = process.argv[2].replace('.spec', '').replace('spec/', '');
	if (dirOrFile == 'spec') dirOrFile = '';

	var minCoverage = parseInt(process.env.MINCOVERAGE);

	var results = {
		covered: [],
		notCovered: []
	};

	for (var name in _$jscoverage) {
		if (name.indexOf(dirOrFile) == -1) continue;

		var file = _$jscoverage[name];
		var total = 0;
		var tested = 0;

		var lines = [];

		for (var i = 0; i < file.source.length; i++) {
			var lineNumber = i+1;
			var called = file[lineNumber];
			if (typeof called != 'undefined') {
				total++;
				if (called > 0) {
					tested++;
				} else {
					lines.push({
						content: file.source[i],
						number: lineNumber
					});
				}
			}
		}

		var coverage = (tested / total * 100).toFixed(2);

		var file = {
			name: name,
			coverage: coverage,
			lines: lines
		};

		var enoughCoverage = coverage >= minCoverage;

		results[enoughCoverage ? 'covered' : 'notCovered'].push(file);
	}

	console.log("Covered: ", results.covered.map(function(file) {
		return file.name + ' (' + file.coverage + '%)'
	}).join(', '));

	console.log("Not covered:");

	results.notCovered.forEach(function(file) {
		console.log(file.name, file.coverage+"%");
		console.log("Not tested:");

		file.lines.forEach(function(line) {
			console.log(sprintf("%5d | %s", line.number, line.content));
		});
	});

	console.log();
});

require('jasmine-node');
require('./node_modules/jasmine-node/lib/jasmine-node/cli.js');
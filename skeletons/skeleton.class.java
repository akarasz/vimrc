`!p
import re

splitted = path.split('/')
if splitted[0:3] == ['src', 'main', 'java']:
	snip.rv = 'package '
	snip.rv += '.'.join(splitted[3:-1])
	snip.rv += ';'
	snip.rv += '\n'
`/**
 * @author `whoami`
 */
${1:public} ${2:class} `!v expand('%:t:r')` {

	${0}

}

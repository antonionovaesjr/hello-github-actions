#!/bin/bash
#ola
 cat <<-EOF > text.json
{
   "fields": {
       "priority": {
            "name": "Highest"
        },
       "project":
       {
          "key": "OS"
       },
       "summary": "Report de segurança do Github no ${GITHUB_REPOSITORY}",
       "description": "Gituhub detectou vulnerabilidade no projeto",
       "issuetype": {
          "name": "Bug"
        }
    }
}
EOF

curl -D- --user $USUARIO:$TOKEN -X POST --data @text.json -H "Content-Type: application/json" $URL
rm -f text.json

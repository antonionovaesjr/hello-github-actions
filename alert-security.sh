#!/bin/bash
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
       "summary": "Report de segurança do Github no REPO de Teste",
       "description": "Gituhub detectou vulnerabilidade no projeto",
       "issuetype": {
          "name": "Bug"
        }
    }
}
EOF

curl -D- --user ${{ secrets.MY_JIRA_USER }}:${{ secrets.MY_JIRA_TOKEN }} -X POST --data @text.json -H "Content-Type: application/json" ${{ secrets.MY_JIRA_URL }}
rm -f text.json
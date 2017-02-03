# API

## Add a Project:
JSON Format:
```json
{
  "project": {
    "name": "Project Name",
    "client": "Client Name",
    "grades": [
      {"grade": 8},
      {"grade": 10}
    ]
  }
}
```
`POST` to: `http://localhost:3000/projects/`

## Mark a Project as done
`PUT` to: `http://localhost:3000/projects/::id/done`

## Update a Project
JSON Format:
```json
{
  "project": {
    "name": "New Project Name",
    "client": "New Client Name"
  }
}
```
`PUT` to: `http://localhost:3000/projects/::id`

## Archive a Project
`DELETE` to: `http://localhost:3000/projects/::id`

## List all not archived Projects
`GET` to: `http://localhost:3000/projects`

## Add a Grade
JSON Format:
```json
{
  "grade": {
    "grade": 7,
    "project_id": 14 
  }
}
```
`POST` to: `http://localhost:3000/grades/`

## Archive a Grade
`DELETE` to: `http://localhost:3000/grades/::id`

param([string] $env)

if (!$env){
    $env= 'Develop'
}

cls

Write-Host "Current Execution Environment ++++++++ $env  ++++++++"

Get-Date

Get-ChildItem "newman\*.*" | Remove-Item

node newman-run.js "./Cats-Breeds.postman_collection.json" "./workspace.postman_globals.json" "./$env.postman_environment.json"
node newman-run.js "./Cats-Facts.postman_collection.json" "./workspace.postman_globals.json" "./$env.postman_environment.json" false

allure generate
allure open allure-report
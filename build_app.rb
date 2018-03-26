`git add -A`
`git commit -m "Update for heroku"`
`git push`
`git push heroku`
`heroku pg:reset DATABASE --confirm infinite-oasis-23086`
`heroku run rails db:migrate`
`heroku run rails db:seed`

